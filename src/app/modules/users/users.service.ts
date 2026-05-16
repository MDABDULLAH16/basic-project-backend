 
import { prisma } from "../../../lib/prisma.js";
import env from "../../config/env.js";
import { TUser } from "./users.validation.js";
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
 
 
 
const createUser = async (payload: TUser) => {
    const hashedPassword = await bcrypt.hash(payload.password, 10);
    
    const result = await prisma.user.create({
        data: {
            name: payload.name,
            email: payload.email,
            password: hashedPassword,
            phone: Number(payload.phone)
            
        }
    })
    return result
}

const userLogin =async (payload:Pick<TUser,'email'|'password'>) => {
    
    const { email, password } = payload;

    const isExistUser = await prisma.user.findUnique({
        where:{email}
    })

    if (!isExistUser) {
        throw new Error('User does not exist in db');
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
    return {"token":accessToken}
}

export const UserService = {
    createUser, 
    userLogin
}