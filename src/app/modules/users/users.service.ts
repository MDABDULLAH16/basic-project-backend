import { TUser } from "./users.interface.js";
 
const createUser =   (payload: TUser) => { 
    return payload 
};
const loginUser =   (payload: TUser) => {
    return payload
}

export const UserService = {
    createUser,loginUser
}