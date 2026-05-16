import { Request, Response } from "express";

import sendResponse from "../../../utils/sendResponse.js";
import { HttpStatus } from "http-status-ts";
import catchAsync from "../../../utils/catchAsync.js";
import { UserService } from "./users.service.js";

const createUserReq = catchAsync(async (req: Request, res: Response) => {
  const result = await UserService.createUser(req.body);
  sendResponse(res, {
    statusCode: HttpStatus.CREATED,
    success: true,
    message: "User created successfully.",
    data: result,
  });
});
const loginUserReq = catchAsync(async (req: Request, res: Response) => {
  const result = await UserService.userLogin(req.body);
  sendResponse(res, {
    statusCode: HttpStatus.OK,
    success: true,
    message: "User login successfully.",
    data: result,
  });
})

export const UserController = {
  createUserReq,
  loginUserReq
};
