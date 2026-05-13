import express, { Application, Request, Response } from "express";
import router from "./routes/routes.js";
import cors from 'cors'
const app: Application = express();

app.use(cors())
app.use(express.json()) 

app.use('/api/v1',router)
app.get("/", (req: Request, res: Response) => {
  res.send("Hello from TypeScript Express!");
});

// app.use('',(req:Request,res:Response)=> {
//     res.send("Route not found")
// })

 export default app;