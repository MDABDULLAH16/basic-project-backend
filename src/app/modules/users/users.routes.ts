import { Router } from "express"; 
import { validateSchema } from "../../../utils/validateSchema.js";
 
import { UserController } from "./users.controller.js";
import { userSchema } from "./users.validation.js";

const router = Router();
router.post("/create-user", validateSchema(userSchema), UserController.createUserReq);
router.post('/login',UserController.loginUserReq)
router.post('/verifyOTP',UserController.VerifyOTPReq)

export const UserRouter = router;