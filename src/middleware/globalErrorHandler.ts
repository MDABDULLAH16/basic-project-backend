import { ErrorRequestHandler, NextFunction, Request, Response } from "express";
import env from "../app/config/env.js";

const globalErrorHandler: ErrorRequestHandler = (
  err: any,
  _req: Request,
  res: Response,
  _next: NextFunction,
) => {
    const statusCode = err.statusCode || 500;
    
  const response = {
    success: false,
    message: err.message || "Something went wrong",
    ...( env.node_env === "development" && {
      stack: err.stack,
      error: err,
    }),
  };

  res.status(statusCode).json(response);
};

export default globalErrorHandler;
