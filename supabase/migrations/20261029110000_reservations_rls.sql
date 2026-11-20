-- Corrigé café uniquement : La Tasse Vive, jeu séparé du garage.
-- À appliquer après la création de public.reservations à la séance du 16/10.

alter table public.reservations
  add column if not exists owner_id uuid references auth.users(id) default auth.uid();

alter table public.reservations enable row level security;
revoke all on public.reservations from anon, authenticated;
grant select, insert on public.reservations to authenticated;

-- La migration héritée déclare id GENERATED ALWAYS AS IDENTITY. Résoudre la
-- séquence liée à cette colonne dans la base et ne la grant que si elle existe.
do $$
declare
  reservations_id_sequence regclass;
begin
  reservations_id_sequence := pg_get_serial_sequence('public.reservations', 'id')::regclass;
  if reservations_id_sequence is not null then
    execute format('grant usage, select on sequence %s to authenticated', reservations_id_sequence);
  end if;
end;
$$;

-- Supprimer les éventuelles politiques antérieures de l'exercice pour que
-- seules les deux politiques explicites déterminent ce comportement.
drop policy if exists cafe_reservations_select on public.reservations;
drop policy if exists cafe_reservations_insert on public.reservations;

create policy cafe_reservations_select
on public.reservations for select to authenticated
using (
  owner_id = (select auth.uid())
  or (auth.jwt() -> 'app_metadata' ->> 'access_level') in ('manager', 'owner')
);

create policy cafe_reservations_insert
on public.reservations for insert to authenticated
with check (owner_id = (select auth.uid()));

-- Camille reçoit app_metadata.access_level = 'owner' et le responsable
-- reçoit 'manager' par une opération d'administration de confiance.
-- Ne jamais se fier à user_metadata ou à un champ fourni par l'application.
-- Les anciennes réservations sans owner_id restent visibles au manager/Camille;
-- on ne leur invente pas de propriétaire. Les nouvelles prennent auth.uid().
-- Ne jamais appeler l'API avec service_role pour tester ces politiques.
