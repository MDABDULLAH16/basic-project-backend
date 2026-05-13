import { Request, Response } from "express";
 
import sendResponse from "../../../utils/sendResponse.js";
import { HttpStatus } from "http-status-ts";

const createUserReq =async (req:Request,res:Response) => {
    const result = await req.body; 
    console.log(result);
    
  sendResponse(res, {
    statusCode: HttpStatus.CREATED,
    success: true,
    message: "User created successfully.",
    data: result,
  });
};

export const UserController = {
    createUserReq
}