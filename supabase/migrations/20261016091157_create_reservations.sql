
-- Les réservations du café : une ligne par table demandée par un client.
create table public.reservations (
  id               bigint generated always as identity primary key,
  customer_name    text not null,
  people           integer not null check (people between 2 and 12),
  reservation_time timestamptz not null,
  phone            text,
  email            text,
  notes            text,
  status           text not null default 'accepted',
  created_at       timestamptz not null default now()
);

create index if not exists reservations_time_idx on public.reservations (reservation_time desc);