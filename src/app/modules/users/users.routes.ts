import { Router } from "express"; 
import { validateSchema } from "../../../utils/validateSchema.js";
 
import { UserController } from "./users.controller.js";
import { userSchema } from "./users.validation.js";

const router = Router();
router.post("/create-user", validateSchema(userSchema),UserController.createUserReq);

export const UserRouter = router;