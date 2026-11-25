import { serve } from "@hono/node-server";
import { app } from "./app.js";
import { env } from "./env.js";
import { startPushLoop } from "./lib/push-sender.js";

serve({ fetch: app.fetch, port: env.PORT }, (info) => {
  console.log(`DailyClassical API listening on :${info.port}`);
});

// Scheduled push campaigns (/admin/messages); off without an APNs key.
if (env.NODE_ENV !== "test") startPushLoop();
