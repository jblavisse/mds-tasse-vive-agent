insert into public.products (name, description, price_cents, category, available) values
  ('Espresso',            'Café serré, 100 % arabica',           220, 'drink',  true),
  ('Allongé',             'Espresso allongé à l''eau chaude',    250, 'drink',  true),
  ('Café crème',          'Espresso, lait chaud, fine mousse',   380, 'drink',  true),
  ('Cappuccino',          'Espresso, lait vapeur, mousse épaisse',430,'drink',  true),
  ('Chocolat chaud',      'Chocolat noir fondu, lait entier',    420, 'drink',  true),
  ('Thé du jour',         'Sélection du jour, en vrac',          360, 'drink',  true),
  ('Limonade maison',     'Citron pressé, eau pétillante, menthe',450,'drink',  true),
  ('Cookie chocolat',     'Cookie moelleux aux pépites',         280, 'pastry', true),
  ('Part de cake citron', 'Cake au citron, glaçage maison',      390, 'pastry', true),
  ('Tartine du jour',     'Tartine garnie selon le marché',      690, 'savory', true),
  ('Toast avocat',        'Pain de campagne, avocat, œuf poché', 890, 'savory', true),
  ('Formule du midi',     'Plat du jour + dessert + boisson',   1390, 'savory', true);

-- 2) 15 réservations d'exemple (dates passées ET à venir).
insert into public.reservations
  (customer_name, people, reservation_time, phone, email, notes, status) values
  ('Amélie Durand',    4, '2026-09-20T12:00:00+02:00', '0600000001', 'amelie@example.com',  'anniversaire',        'accepted'),
  ('Karim Benali',     6, '2026-10-04T20:00:00+02:00', '0600000002', 'karim@example.com',   'près de la fenêtre',  'accepted'),
  ('Emma Leroy',       2, '2026-10-11T19:30:00+02:00', '0600000003', 'emma@example.com',    null,                  'accepted'),
  ('Léa Moreau',      12, '2026-10-17T19:00:00+02:00', '0600000004', 'lea@example.com',     'grande table',        'accepted'),
  ('Hugo Petit',       8, '2026-10-17T21:00:00+02:00', '0600000005', 'hugo@example.com',    'après le ciné',       'accepted'),
  ('Nadia Cherif',     5, '2026-10-21T13:00:00+02:00', '0600000006', 'nadia@example.com',   'déjeuner',            'accepted'),
  ('Thomas Girard',    3, '2026-10-23T18:30:00+02:00', '0600000007', 'thomas@example.com',  null,                  'accepted'),
  ('Sarah Cohen',     10, '2026-10-24T20:30:00+02:00', '0600000008', 'sarah@example.com',   'poussette',           'accepted'),
  ('Julien Roux',      2, '2026-10-25T12:00:00+01:00', '0600000009', 'julien@example.com',  null,                  'accepted'),
  ('Camille Fontaine', 4, '2026-10-25T19:30:00+01:00', '0600000010', 'camille@example.com', 'terrasse si possible','accepted'),
  ('Pierre Marchand',  6, '2026-11-02T20:00:00+01:00', '0600000011', 'pierre@example.com',  null,                  'accepted'),
  ('Inès Baudin',      9, '2026-11-05T19:00:00+01:00', '0600000012', 'ines@example.com',    'repas d''équipe',     'accepted'),
  ('Lucas Meyer',      3, '2026-11-08T12:30:00+01:00', '0600000013', 'lucas@example.com',   null,                  'accepted'),
  ('Chloé Blanc',      7, '2026-11-12T20:00:00+01:00', '0600000014', 'chloe@example.com',   'table ronde',         'accepted'),
  ('Yanis Haddad',     2, '2026-11-15T11:00:00+01:00', '0600000015', 'yanis@example.com',   'petit-déjeuner',      'accepted');
