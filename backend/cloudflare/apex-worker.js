// Cloudflare Worker "dailyclassical-apex" on the bare domain dailyclassical.co (route dailyclassical.co/*).
// Apple sends developer copies of ad attribution postbacks only to the registrable domain named in the
// app's Info.plist, and Railway's plan has no room for a third custom domain, so this Worker passes
// those two paths on to the API (routes/attribution.ts) and sends everything else to www, as the
// registrar's forwarding did before. Deployed by hand from the Cloudflare dashboard; keep this copy in step.
const API = "https://api.dailyclassical.co";
const WWW = "https://www.dailyclassical.co";

export default {
  async fetch(request) {
    const url = new URL(request.url);
    const isPostback = url.pathname.startsWith("/.well-known/skadnetwork/") || url.pathname.startsWith("/.well-known/appattribution/");
    if (!isPostback) return Response.redirect(WWW + url.pathname + url.search, 301);
    const headers = new Headers();
    headers.set("content-type", request.headers.get("content-type") || "application/json");
    headers.set("user-agent", request.headers.get("user-agent") || "");
    headers.set("x-forwarded-for", request.headers.get("cf-connecting-ip") || "");
    const hasBody = request.method !== "GET" && request.method !== "HEAD";
    return fetch(API + url.pathname + url.search, {
      method: request.method,
      headers,
      body: hasBody ? await request.arrayBuffer() : undefined,
    });
  },
};
