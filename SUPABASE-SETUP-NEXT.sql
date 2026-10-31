-- THE MIDNIGHT MARGINS: matching setup for a BRAND-NEW Supabase project
create table public.poems (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  pen_name text not null,
  email text,
  category text not null default 'other'
    check (category in ('life','love','loss','other')),
  body text not null,
  status text not null default 'pending'
    check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default now()
);
alter table public.poems enable row level security;
grant usage on schema public to anon, authenticated;
grant insert, select on public.poems to anon, authenticated;
grant update, delete on public.poems to authenticated;

create policy "Public can submit pending poems"
on public.poems for insert to anon, authenticated
with check (status = 'pending');

create policy "Public can read approved poems"
on public.poems for select to anon, authenticated
using (status = 'approved');

create policy "Admins can read every poem"
on public.poems for select to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

create policy "Admins can update poems"
on public.poems for update to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin')
with check ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

create policy "Admins can delete poems"
on public.poems for delete to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

-- After creating your Auth user, run separately with your own email:
-- update auth.users set raw_app_meta_data =
-- coalesce(raw_app_meta_data, '{}'::jsonb) || '{"role":"admin"}'::jsonb
-- where email = 'YOUR-ADMIN-EMAIL';
-- Then sign out and sign in again to refresh the session.
