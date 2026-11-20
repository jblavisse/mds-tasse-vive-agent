-- La carte du café : un produit par ligne.
create table public.products (
  id          bigint generated always as identity primary key,
  name        text not null,
  description text,
  price_cents integer not null,
  category    text not null,
  available   boolean not null default true,
  created_at  timestamptz not null default now()
);