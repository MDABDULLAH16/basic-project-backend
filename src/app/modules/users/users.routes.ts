import { Router } from "express"; 
import { validateSchema } from "../../../utils/validateSchema.js";
import { userSchema } from "./users.validation.js";
import { UserController } from "./users.controller.js";

const router = Router();
router.post("/create-user", validateSchema(userSchema),UserController.createUserReq);

export const UserRouter = router;