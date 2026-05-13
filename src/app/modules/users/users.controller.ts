import { Request, Response } from "express";
import { HttpStatus } from "http-status-ts";

const createUserReq =async (req:Request,res:Response) => {
    const result = await req.body; 
    console.log(result);
    
res.status(HttpStatus.CREATED).json({'success': true, message: "User created successfully",data: result });
};

export const UserController = {
    createUserReq
}