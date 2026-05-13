import { Server } from "http";
import app from "./app.js";
import env from "./app/config/env.js";
 

let server: Server;

const bootstrap = async () => {
  try {
    server = app.listen(env.port, () => {
      console.log(`Server is running on port ${env.port}`);
    });
  } catch (err) {
    console.log("Server running error", err);
  }
};

(async () => {
  await bootstrap();
})();

process.on("unhandledRejection", (err) => {
  console.log("Unhandled Rejection Detected", err);
  if (server) {
    server.close(() => {
      process.exit(1);
    });
  } else {
    process.exit(1);
  }
});

process.on("uncaughtException", (err) => {
  console.log("Uncaught Exception Detected", err);
  if (server) {
    server.close(() => {
      process.exit(1);
    });
  } else {
    process.exit(1);
  }
});

process.on("SIGTERM", () => {
  console.log("SIGTERM signal received - server shutting down gracefully");
  if (server) {
    server.close(() => {
      process.exit(0);
    });
  } else {
    process.exit(0);
  }
});
