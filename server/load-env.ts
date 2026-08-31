// Loads environment variables before any other module reads process.env.
//
// ES module imports are hoisted and fully evaluated before the importing
// module's own statements run. That meant calling dotenv.config() inside
// index.ts executed *after* ./db.ts had already been evaluated, so db.ts
// never saw the values from the local config file and threw on startup.
//
// Importing this module first guarantees the environment is populated in time.
import dotenv from "dotenv";

dotenv.config();
