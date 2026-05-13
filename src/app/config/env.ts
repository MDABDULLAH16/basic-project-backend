 import  dotenv  from  'dotenv' ;
import path from 'path';
 

dotenv.config({ path: path.join(process.cwd(), ".env") });
const env = {
    port: process.env.PORT || 5000,
    jwtSecret: process.env.JWT_SECRET as string,
};
export default env;