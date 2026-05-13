import { Router } from "express";
import { UserRouter } from "../app/modules/users/users.routes.js";

const router=Router()

const moduleRoutes = [
    {
        path: '/auth',
        route:UserRouter
    }
];

moduleRoutes.forEach(route => router.use(route.path,route.route));
export default router;