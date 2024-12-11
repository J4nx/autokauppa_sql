# autokauppa_sql
MySQL kouluprojekti
# 1.	Johdanto

Tämä dokumentti kuvaa ’autokauppa’ -tietokannan rakennetta, joka on suunniteltu hallitsemaan autoliikkeen toimintaa kolmessa eri toimipisteessä. Tietokanta tukee autojen myynnin ja ostojen hallintaa, myyjien suoritusten seurantaa, sekä provisioiden ja liikevoittojen laskentaa.

# 2.	Tietokannan rakenne

- Toimipiste: Sisältää toimipisteiden tunnisteet, nimet ja osoitteet.
- Myyjä: Sisältää myyjien tunnisteet, nimet ja viittaukset toimipisteisiin.
- Auto: Sisältää autojen tunnisteet, rekisterinumerot, merkit, mallit ja vuosimallit.
- Osto: Sisältää autojen ostotunnisteet, ostohinnat, päivämäärät ja viittaukset autoihin.
- Myynti: Sisältää autojen myyntitunnisteet, myyntihinnat, päivämäärät, viittaukset autoihin ja myyjään.

# 3.	Tietokannan käyttötarkoitus

Tietokantaa käytetään autojen myynti- ja ostotietojen tallentamiseen ja käsittelyyn, myyjien myyntitulosten seuraamiseen ja provisiopalkkojen laskentaan sekä toimipisteiden ja autoliikkeen myyntivoittojen laskemiseen. 
