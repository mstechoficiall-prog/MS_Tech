-- Crie estas tabelas no editor SQL do Supabase

create table if not exists users (
  id text primary key,
  data jsonb not null
);

create table if not exists products (
  id text primary key,
  data jsonb not null
);

create table if not exists sales (
  id text primary key,
  data jsonb not null
);

create table if not exists expenses (
  id text primary key,
  data jsonb not null
);

create table if not exists goals (
  id text primary key,
  month text not null,
  data jsonb not null
);

create table if not exists cash_flows (
  id text primary key,
  date text not null,
  data jsonb not null
);

create table if not exists pricing_settings (
  id text primary key,
  data jsonb not null
);

create table if not exists pricing_products (
  id text primary key,
  data jsonb not null
);

create table if not exists pricing_history (
  id text primary key,
  data jsonb not null
);

-- Permissoes simples para uso direto pelo app estatico com a anon key.
-- Use apenas enquanto o app nao tiver autenticacao Supabase/RLS por usuario.
grant select, insert, update, delete on users to anon;
grant select, insert, update, delete on products to anon;
grant select, insert, update, delete on sales to anon;
grant select, insert, update, delete on expenses to anon;
grant select, insert, update, delete on goals to anon;
grant select, insert, update, delete on cash_flows to anon;
grant select, insert, update, delete on pricing_settings to anon;
grant select, insert, update, delete on pricing_products to anon;
grant select, insert, update, delete on pricing_history to anon;

alter table users enable row level security;
alter table products enable row level security;
alter table sales enable row level security;
alter table expenses enable row level security;
alter table goals enable row level security;
alter table cash_flows enable row level security;
alter table pricing_settings enable row level security;
alter table pricing_products enable row level security;
alter table pricing_history enable row level security;

drop policy if exists "anon_all_users" on users;
create policy "anon_all_users" on users for all to anon using (true) with check (true);

drop policy if exists "anon_all_products" on products;
create policy "anon_all_products" on products for all to anon using (true) with check (true);

drop policy if exists "anon_all_sales" on sales;
create policy "anon_all_sales" on sales for all to anon using (true) with check (true);

drop policy if exists "anon_all_expenses" on expenses;
create policy "anon_all_expenses" on expenses for all to anon using (true) with check (true);

drop policy if exists "anon_all_goals" on goals;
create policy "anon_all_goals" on goals for all to anon using (true) with check (true);

drop policy if exists "anon_all_cash_flows" on cash_flows;
create policy "anon_all_cash_flows" on cash_flows for all to anon using (true) with check (true);

drop policy if exists "anon_all_pricing_settings" on pricing_settings;
create policy "anon_all_pricing_settings" on pricing_settings for all to anon using (true) with check (true);

drop policy if exists "anon_all_pricing_products" on pricing_products;
create policy "anon_all_pricing_products" on pricing_products for all to anon using (true) with check (true);

drop policy if exists "anon_all_pricing_history" on pricing_history;
create policy "anon_all_pricing_history" on pricing_history for all to anon using (true) with check (true);
