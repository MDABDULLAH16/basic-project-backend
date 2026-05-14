import express, { Application, Request, Response } from "express";
import router from "./routes/routes.js";
import cors from "cors";
import notFound from "./middleware/not-found.js";
import globalErrorHandler from "./middleware/globalErrorHandler.js";
const app: Application = express();

app.use(cors());
app.use(express.json());

app.use("/api/v1", router);
app.get("/", (req: Request, res: Response) => {
  res.send("Hello from TypeScript Express!");
});

app.use(notFound);
app.use(globalErrorHandler);

export default app;
