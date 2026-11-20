-- Keep the privileged server role able to read reservations for operational
-- checks. BYPASSRLS does not replace the table-level SELECT grant.
grant select on public.reservations to service_role;
