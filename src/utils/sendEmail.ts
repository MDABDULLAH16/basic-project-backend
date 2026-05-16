import nodemailer from "nodemailer";
import env from "../app/config/env.js";

 
export const generateOTP = (): string => {
  return Math.floor(1000 + Math.random() * 9000).toString();
};

 
const transporter = nodemailer.createTransport({
  service: "gmail", 
  auth: {
    user: env.email_user,
    pass: env.email_pass,
  },
});

export const sendOTPEmail = async (email: string, otp: string) => {
  const mailOptions = {
    from: `"Rise Together" <${env.email_user}>`,
    to: email,
    subject: "Your Account Verification OTP",
    html: `<h3>Welcome to Rise Together!</h3>
           <p>Your verification code is: <b>${otp}</b></p>
           <p>This code will expire soon.</p>`,
  };

  await transporter.sendMail(mailOptions);
};
