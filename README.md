# DailyClassical

One great work a day, with a listening guide you follow while the music plays.
Native iOS (SwiftUI, Liquid Glass), English and Turkish.

| Folder | What lives there |
| --- | --- |
| `ios/` | SwiftUI app (XcodeGen, `ios/project.yml`) |
| `backend/` | API (Node + Hono + Drizzle) on Railway, Neon Postgres; landing page and legal pages |
| `content/` | Piece guides (`en|tr/pieces/*.md`), glossary, composers, paintings, schedule, research notes |
| `design/` | App icon, SVG icon set, App Store assets, landing page design |
| `project-knowledge/` | **All documentation:** `project_information.md` (product, infrastructure, commands, content guide, App Store, design), `content_status.md` (catalogue, stop timing, release plan), `backlog.md` (open work) |

Quick start: `cd backend && npm install && npm run content:build && npm run dev`; `cd ios && xcodegen generate`. Details in `project-knowledge/project_information.md`.
