import { prisma } from "../../../lib/prisma.js";
import { generateOTP, sendOTPEmail } from "../../../utils/sendEmail.js";
import env from "../../config/env.js";
import { TUser } from "./users.validation.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";



 const createUser = async (payload: TUser) => {
   const hashedPassword = await bcrypt.hash(payload.password, 10);
   const otp = await generateOTP();

   
   const result = await prisma.user.create({
     data: {
       name: payload.name,
       email: payload.email,
       password: hashedPassword,
       phone: Number(payload.phone),
       otp: Number(otp),
       isVerified: false,
     },
   });

   
   try {
     await sendOTPEmail(payload.email, otp);
     
   } catch (error) {
     console.error("Failed to send email:", error);
   }

   return result;
 };
const verifyOTP = async (payload: { email: string; otp: string }) => {
  const { email, otp } = payload;

  const user = await prisma.user.findUnique({
    where: { email },
  });

  if (!user) {
    throw new Error("User not found!");
  }
    
  if (user.otp !== Number(otp)) {
    throw new Error("Invalid OTP code!");
  }


  await prisma.user.update({
    where: { email },
    data: {
      isVerified: true,
      otp: null,  
    },
  });

  return { message: "Account verified successfully! You can login now." };
};

 
const userLogin = async (payload: Pick<TUser, "email" | "password">) => {
  const { email, password } = payload;

  const isExistUser = await prisma.user.findUnique({
    where: { email },
  });

  if (!isExistUser) {
    throw new Error("User does not exist in db");
  }

  
  if (!isExistUser.isVerified) {
    throw new Error(
      "Your account is not verified, Broo! Please verify with your OTP first.",
    );
  }

  const isPasswordMatched = await bcrypt.compare(
    password,
    isExistUser.password,
  );

  if (!isPasswordMatched) {
    throw new Error("Password does not match Broo!");
  }

  const jwtPayload = {
    id: isExistUser.id,
    email: isExistUser.email,
    name: isExistUser.name,
  };

  const accessToken = jwt.sign(jwtPayload, env.jwt_secret, {
    expiresIn: env.jwt_expired as any,
  });

  return { token: accessToken };
};

 
export const UserService = {
  createUser,
  verifyOTP,
  userLogin,
};
