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
