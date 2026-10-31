THE MIDNIGHT MARGINS — FRESH START

Files:
- index.html: one-page public website
- styles.css: visual design
- app.js: original poems, search, community wall and submission form
- config.js: Supabase connection placeholders
- admin.html + admin.js: private editor sign-in and moderation dashboard
- SUPABASE-SETUP-NEXT.sql: matching database setup for the next stage

GITHUB FIRST:
1. Create a NEW GitHub repository.
2. Upload all these files into the repository root (not inside another folder).
3. Keep filenames exactly as shown.
4. Enable GitHub Pages from the main branch and /(root).
5. The front page can be viewed before Supabase is connected; the submission form will tell visitors it is not connected yet.

IMPORTANT:
- Original poems are separate from community submissions.
- New submissions are inserted as pending.
- Only approved poems appear on the public Community Wall.
- PostgreSQL TEXT is used for poem body; there is no imposed word limit.
- config.js intentionally has placeholders. We will fill it after creating the NEW Supabase project.
- Never put a secret/service_role key or database password in config.js.
- Admin moderation requires a Supabase Auth account with app_metadata role=admin and the matching SQL policies.
- Hiding admin.html is not security; Supabase Auth and Row Level Security protect the data.
