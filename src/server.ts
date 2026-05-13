import http from "http";
import env from "./app/config/env.js";
import app from "./app.js";

const port = env.port;

const server = http.createServer(app);

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

// const gracefulShutdown = () => {
//   console.log("Shutting down server...");

//   server.close(() => {
//     console.log("Server closed successfully");
//     process.exit(0);
//   });
// };

// process.on("SIGINT", gracefulShutdown);
// process.on("SIGTERM", gracefulShutdown);
