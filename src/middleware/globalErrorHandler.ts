import { ErrorRequestHandler, NextFunction, Request, Response } from "express";
import env from "../app/config/env.js";
import { Prisma } from "@prisma/client";
import { HttpStatus } from "http-status-ts";

const globalErrorHandler: ErrorRequestHandler = (
  err: any,
  _req: Request,
  res: Response,
  _next: NextFunction,
) => {
  let statusCode = err.statusCode || 500;
  let message= err.message || 'something went wrong'
  // Handle known Prisma client errors
  if (err instanceof Prisma.PrismaClientKnownRequestError) {
    switch (err.code) {
      case "P1000":
        message = "Authentication failed against the database server.";
        statusCode = HttpStatus.BAD_GATEWAY;
        break;

      case "P1001":
        message = "Cannot reach the database server. Please check connection.";
        statusCode = HttpStatus.BAD_GATEWAY;
        break;

      case "P1002":
        message = "The database operation timed out.";
        statusCode = HttpStatus.REQUEST_TIMEOUT;
        break;

      case "P2000":
        message = "Value too long for a database column.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2001":
        message = "Record not found.";
        statusCode = HttpStatus.NOT_FOUND;
        break;

      case "P2002":
        message = "Duplicate key error — unique constraint failed.";
        statusCode = HttpStatus.CONFLICT;
        break;

      case "P2003":
        message = "Foreign key constraint failed.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2004":
        message = "Database constraint failed.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2005":
        message = "Invalid value stored in the database.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2006":
        message = "Invalid value type provided for the field.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2007":
        message = "Data validation error.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2008":
        message = "Query parsing failed.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2009":
        message = "Query validation failed.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2010":
        message = "Raw query failed. Check your query syntax.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2011":
        message = "Null constraint violation — missing required field.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2012":
        message = "Missing required value for a field.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2013":
        message = "Missing required argument for a field.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2014":
        message = "Relation violation between records.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2015":
        message = "Related record not found.";
        statusCode = HttpStatus.NOT_FOUND;
        break;

      case "P2016":
        message = "Query interpretation error.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2017":
        message = "Record relation inconsistency.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2018":
        message = "Required connected record not found.";
        statusCode = HttpStatus.NOT_FOUND;
        break;

      case "P2019":
        message = "Input error — invalid data.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2020":
        message = "Value out of range for the column type.";
        statusCode = HttpStatus.BAD_REQUEST;
        break;

      case "P2021":
        message = "Table not found in the database.";
        statusCode = HttpStatus.NOT_FOUND;
        break;
    }
  }
  const response = {
    success: false,
    message: err.message || "Something went wrong",
    ...(env.node_env === "development" && {
      stack: err.stack,
      error: err,
    }),
  };

  res.status(statusCode).json(response);
};;

export default globalErrorHandler;
