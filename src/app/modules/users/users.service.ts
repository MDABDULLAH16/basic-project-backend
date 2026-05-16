 
import { prisma } from "../../../lib/prisma.js";
import { TUser } from "./users.validation.js";
import bcrypt from 'bcrypt';
 
 
 
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

export const UserService = {
    createUser, 
}