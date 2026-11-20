-- Jour 3 : quelques réservations à venir, pour que l'agent et le serveur MCP aient quelque chose à lire.
insert into public.reservations (customer_name, people, reservation_time, phone, email, notes, status) values
  ('Sophie Lambert',  4, '2026-11-21T12:30:00+01:00', '0600000016', 'sophie@example.com',  null,               'accepted'),
  ('Mehdi Rahmani',   2, '2026-11-21T19:00:00+01:00', '0600000017', 'mehdi@example.com',   'anniversaire',     'accepted'),
  ('Claire Dubois',   6, '2026-11-28T13:00:00+01:00', '0600000018', 'claire@example.com',  'chaise haute',     'accepted'),
  ('Antoine Vidal',  10, '2026-12-05T20:00:00+01:00', '0600000019', 'antoine@example.com', 'repas de fin d''année', 'accepted'),
  ('Laura Martin',    3, '2026-12-12T11:00:00+01:00', '0600000020', 'laura@example.com',   'brunch',           'accepted');
