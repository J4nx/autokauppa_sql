-- Lisää ajoneuvo
INSERT INTO autokauppa.auto (toimipiste_id, rekisterinumero, merkki, malli, vuosimalli) VALUES
(1, 'ABC-123', 'Toyota', 'Corolla', 2015);

-- Lisää ajoneuvolle ostohinta ja ostopäivämäärä ajoneuvon auto_id perusteella.
INSERT INTO autokauppa.osto (auto_id, ostohinta, osto_pvm) VALUES
(1, 15000, '2024-01-15');

-- Lisää myyntitapahtuma
INSERT INTO autokauppa.myynti (auto_id, myyja_id, myyntihinta, myynti_pvm) VALUES
(1, 1, 20000, '2024-04-01'); -- Myyjä 1 myi auton 1

-- Myyjäkohtainen kuukauden myyntivoitto ja kuukauden provisiopalkka 25% myyntivoitosta
SELECT
  my.myyja_id,
  my.nimi AS myyjan_nimi,
  SUM(m.myyntihinta - o.ostohinta) AS huhtikuu_myyntivoitto,
  SUM(m.myyntihinta - o.ostohinta) * 0.25 AS provisio_eur
FROM
  autokauppa.myynti m
JOIN
  autokauppa.myyja my ON m.myyja_id = my.myyja_id
JOIN
  autokauppa.auto a ON m.auto_id = a.auto_id
JOIN
  autokauppa.osto o ON a.auto_id = o.auto_id
WHERE
  MONTH(m.myynti_pvm) = 4 AND YEAR(m.myynti_pvm) = 2024
GROUP BY
  my.myyja_id, my.nimi
ORDER BY huhtikuu_myyntivoitto DESC;

-- Myyjien myyntien lukumäärä, kokonaismyynti ja kokonaismyyntivoitto
SELECT
  m.nimi AS Myyjä,
  COUNT(mt.myynti_id) AS Myyntien_lukumäärä,
  SUM(mt.myyntihinta) AS Kokonaismyynti,
  SUM(mt.myyntihinta - o.ostohinta) AS Myyntivoitto
FROM
  autokauppa.myyja m
JOIN
  autokauppa.myynti mt ON m.myyja_id = mt.myyja_id
JOIN
  autokauppa.auto a ON mt.auto_id = a.auto_id
JOIN
  autokauppa.osto o ON a.auto_id = o.auto_id
GROUP BY
  m.myyja_id, m.nimi
ORDER BY
	Myyntivoitto DESC;
    
-- Toimipistekohtaiset myyntivoitot
SELECT
  tp.nimi AS Toimipisteen_nimi,
  SUM(m.myyntihinta - o.ostohinta) AS Myyntivoitto
FROM
  autokauppa.toimipiste tp
JOIN
  autokauppa.auto a ON tp.toimipiste_id = a.toimipiste_id
JOIN
  autokauppa.myynti m ON a.auto_id = m.auto_id
JOIN
  autokauppa.osto o ON a.auto_id = o.auto_id
WHERE
  o.osto_pvm = (SELECT MAX(o2.osto_pvm) FROM osto o2 WHERE o2.auto_id = a.auto_id) -- Oletetaan että otetaan viimeisin osto
GROUP BY
  tp.toimipiste_id, tp.nimi
ORDER BY
  Myyntivoitto DESC;
  
  -- Listaa myynnissä olevat autot (Kyselylle ei löydy vastaavuutta myynti taulussa = IS NULL)
SELECT
  a.auto_id,
  a.rekisterinumero,
  a.merkki,
  a.malli,
  a.vuosimalli,
  tp.nimi AS Toimipisteen_nimi
FROM
  autokauppa.auto a
LEFT JOIN
  autokauppa.myynti m ON a.auto_id = m.auto_id
JOIN
  autokauppa.toimipiste tp ON a.toimipiste_id = tp.toimipiste_id
WHERE
  m.auto_id IS NULL;