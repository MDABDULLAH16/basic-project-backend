import { NextFunction, Request, Response } from "express";
import { HttpStatus } from "http-status-ts";
import z from "zod";

export const validateSchema = (schema: z.ZodSchema) => {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      const result = schema.safeParse(req.body);

      if (!result.success) {
        return res.status(HttpStatus.BAD_REQUEST).json({
          success: false,
          message: result.error.issues[0]?.message,
        });
      }
      req.body = result.data;
      next();
    } catch (error) {
      next(error);
    }
  };
};
