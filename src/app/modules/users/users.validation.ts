import { z } from "zod";

export const userSchema = z.object({
  email: z.string("Email is required"),
  name: z
    .string("Name is required")
    .min(2, { message: "Name must be at least 2 characters long" }),

  password: z
    .string("Password is required")
    .min(6, { message: "Password must be at least 6 characters long" }),

  age: z
    .number()
    .int({ message: "Age must be an integer" })
    .positive({ message: "Age must be a positive number" })
    .optional()
    .nullable(),

  phone: z
    .number("Phone number is required")
    .int({ message: "Phone must be a valid integer" }),

  otp: z.number("OTP number is required").optional(),
});

export type TUser = z.infer<typeof userSchema>;
