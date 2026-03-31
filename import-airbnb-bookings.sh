#!/bin/bash
# Airbnb Booking Import Script
# Auto-generated – run this locally to import all 50 bookings

API="https://hostel-app-api.office-509.workers.dev/airbnb-import"
TOKEN="2OTr1DXeXBEMsnnWv6Rc29F4HnYHR3tah0fbRwJEETQ="

NEW=0
DUP=0
ERR=0

do_import() {
  local num="$1"
  local payload="$2"
  local resp
  resp=$(curl -s -w "\n__STATUS:%{http_code}" -X POST "$API" \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer $TOKEN" \
    -d "$payload")
  local status
  status=$(echo "$resp" | grep '__STATUS:' | cut -d: -f2)
  local body
  body=$(echo "$resp" | grep -v '__STATUS:')
  if [[ "$status" == "200" || "$status" == "201" ]]; then
    if echo "$body" | grep -q '"duplicate":true'; then
      echo "[$num] DUP  – $body"
      ((DUP++))
    else
      echo "[$num] NEW  – $body"
      ((NEW++))
    fi
  else
    echo "[$num] ERR (HTTP $status) – $body"
    ((ERR++))
  fi
}

do_import  1  '{"name":"Josh Alexander","checkIn":"2026-04-12","checkOut":"2026-04-17","numberOfPersons":2,"airbnbConfirmationCode":"HMDEWDEFHB"}'
do_import  2  '{"name":"Thomas Heigl","checkIn":"2026-07-19","checkOut":"2026-08-02","numberOfPersons":2,"airbnbConfirmationCode":"HMQCK5HKJX"}'
do_import  3  '{"name":"Max Kushynov","checkIn":"2026-04-20","checkOut":"2026-05-01","numberOfPersons":2,"airbnbConfirmationCode":"HMXBDQ44PA"}'
do_import  4  '{"name":"Alexandra Harb","checkIn":"2026-05-28","checkOut":"2026-06-01","numberOfPersons":2,"airbnbConfirmationCode":"HMMQYHN9A2"}'
do_import  5  '{"name":"Beate Knor","checkIn":"2026-06-03","checkOut":"2026-06-07","numberOfPersons":2,"airbnbConfirmationCode":"HMCQS3KK9F"}'
do_import  6  '{"name":"Victoria Savichev","checkIn":"2026-01-24","checkOut":"2026-03-31","numberOfPersons":1,"airbnbConfirmationCode":"HM8ZZEPQ4M"}'
do_import  7  '{"name":"Sabine Dechat","checkIn":"2022-09-28","checkOut":"2022-10-01","numberOfPersons":2,"airbnbConfirmationCode":"HMWDSXBFT8"}'
do_import  8  '{"name":"Kevin Geronimo","checkIn":"2022-07-17","checkOut":"2022-07-24","numberOfPersons":2,"airbnbConfirmationCode":"HM5ZSNEYEF"}'
do_import  9  '{"name":"Andreas Knabl","checkIn":"2022-09-01","checkOut":"2022-09-04","numberOfPersons":2,"airbnbConfirmationCode":"HMF4QX38M4"}'
do_import 10  '{"name":"Mariola Stacher","checkIn":"2022-06-26","checkOut":"2022-07-12","numberOfPersons":1,"airbnbConfirmationCode":"HMCN8PZKCR"}'
do_import 11  '{"name":"Andreas Knabl","checkIn":"2022-06-16","checkOut":"2022-06-19","numberOfPersons":2,"airbnbConfirmationCode":"HMKNBRXBJ8"}'
do_import 12  '{"name":"Barbara Sejka","checkIn":"2022-06-03","checkOut":"2022-06-07","numberOfPersons":2,"airbnbConfirmationCode":"HMETKT3ZZR"}'
do_import 13  '{"name":"Lisa Goergen","checkIn":"2022-08-15","checkOut":"2022-08-23","numberOfPersons":2,"airbnbConfirmationCode":"HM3NQ9T2SN"}'
do_import 14  '{"name":"Yuriy Demkovych","checkIn":"2022-07-31","checkOut":"2022-08-07","numberOfPersons":6,"airbnbConfirmationCode":"HMCP39EP4P"}'
do_import 15  '{"name":"Khalid Alhashmi","checkIn":"2022-07-25","checkOut":"2022-07-30","numberOfPersons":2,"airbnbConfirmationCode":"HMN2F49X8B"}'
do_import 16  '{"name":"Petra Dolezalova","checkIn":"2022-01-21","checkOut":"2022-01-28","numberOfPersons":3,"airbnbConfirmationCode":"HMBSXAFC4Q"}'
do_import 17  '{"name":"Julia Tambourinegirl","checkIn":"2022-01-07","checkOut":"2022-01-11","numberOfPersons":1,"airbnbConfirmationCode":"HMDP2BHT8A"}'
do_import 18  '{"name":"Mona Le","checkIn":"2022-01-12","checkOut":"2022-01-23","numberOfPersons":2,"airbnbConfirmationCode":"HMFPR4SH28"}'
do_import 19  '{"name":"Katrin Vutk","checkIn":"2021-12-23","checkOut":"2021-12-25","numberOfPersons":2,"airbnbConfirmationCode":"HMTBDX53S9"}'
do_import 20  '{"name":"Lara Pascher","checkIn":"2021-12-17","checkOut":"2021-12-19","numberOfPersons":4,"airbnbConfirmationCode":"HMYB5A3ZPT"}'
do_import 21  '{"name":"Laura Menk","checkIn":"2021-11-03","checkOut":"2021-11-06","numberOfPersons":4,"airbnbConfirmationCode":"HMQ4ZRWPK8"}'
do_import 22  '{"name":"Sarah Bergner","checkIn":"2021-10-23","checkOut":"2021-10-26","numberOfPersons":1,"airbnbConfirmationCode":"HMCR3WFDSD"}'
do_import 23  '{"name":"Mariola Stacher","checkIn":"2021-12-21","checkOut":"2021-12-25","numberOfPersons":1,"airbnbConfirmationCode":"HMPNTBN43T"}'
do_import 24  '{"name":"Elena Sokova","checkIn":"2021-10-29","checkOut":"2021-11-01","numberOfPersons":2,"airbnbConfirmationCode":"HMDASCDB9W"}'
do_import 25  '{"name":"Aleksandra Petrovic","checkIn":"2021-09-01","checkOut":"2021-09-05","numberOfPersons":2,"airbnbConfirmationCode":"HMF242BN2D"}'
do_import 26  '{"name":"Lisa Goergen","checkIn":"2021-10-16","checkOut":"2021-10-22","numberOfPersons":2,"airbnbConfirmationCode":"HM5WQ9ZHE4"}'
do_import 27  '{"name":"Martin Bernardi","checkIn":"2021-12-26","checkOut":"2022-01-02","numberOfPersons":2,"airbnbConfirmationCode":"HMDNEQP3NF"}'
do_import 28  '{"name":"Melanie Jasmin Crnomarkovic","checkIn":"2021-10-04","checkOut":"2021-10-10","numberOfPersons":3,"airbnbConfirmationCode":"HMC92EKAMD"}'
do_import 29  '{"name":"Krisztina Zsombor","checkIn":"2021-08-20","checkOut":"2021-08-30","numberOfPersons":2,"airbnbConfirmationCode":"HMJSWYCFHK"}'
do_import 30  '{"name":"Bert Geertsma","checkIn":"2021-06-21","checkOut":"2021-06-27","numberOfPersons":4,"airbnbConfirmationCode":"HMK2XTKJXM"}'
do_import 31  '{"name":"Ali Kemal Akcakir","checkIn":"2021-07-06","checkOut":"2021-07-11","numberOfPersons":5,"airbnbConfirmationCode":"HMFCB8W9PB"}'
do_import 32  '{"name":"Fabienne Hellmond","checkIn":"2021-07-27","checkOut":"2021-08-04","numberOfPersons":2,"airbnbConfirmationCode":"HMAR924D2H"}'
do_import 33  '{"name":"Iona Eichleter","checkIn":"2021-08-12","checkOut":"2021-08-15","numberOfPersons":2,"airbnbConfirmationCode":"HMDT85Q3KS"}'
do_import 34  '{"name":"Marc Seesing","checkIn":"2021-08-06","checkOut":"2021-08-11","numberOfPersons":2,"airbnbConfirmationCode":"HM2AJANET5"}'
do_import 35  '{"name":"Gabriela De Ataíde Magalhães","checkIn":"2021-07-12","checkOut":"2021-07-26","numberOfPersons":4,"airbnbConfirmationCode":"HMXN49QPR9"}'
do_import 36  '{"name":"Astopher Bosskübel","checkIn":"2021-07-07","checkOut":"2021-07-11","numberOfPersons":4,"airbnbConfirmationCode":"HM495FSHZZ"}'
do_import 37  '{"name":"Tina Schuster","checkIn":"2021-06-15","checkOut":"2021-06-20","numberOfPersons":2,"airbnbConfirmationCode":"HM8YA4BKQT"}'
do_import 38  '{"name":"Silvan Müller","checkIn":"2021-06-28","checkOut":"2021-07-05","numberOfPersons":2,"airbnbConfirmationCode":"HMTPMPNBQ8"}'
do_import 39  '{"name":"Johanna Wagner","checkIn":"2021-06-04","checkOut":"2021-06-07","numberOfPersons":2,"airbnbConfirmationCode":"HM8ZSWET2D"}'
do_import 40  '{"name":"Alex Gotter","checkIn":"2021-05-07","checkOut":"2021-05-10","numberOfPersons":2,"airbnbConfirmationCode":"HMF3FH9QYQ"}'
do_import 41  '{"name":"Annemarie Ohnoutka","checkIn":"2021-05-21","checkOut":"2021-05-24","numberOfPersons":2,"airbnbConfirmationCode":"HMFRQ3P2XZ"}'
do_import 42  '{"name":"Marlene Anna","checkIn":"2021-04-27","checkOut":"2021-04-30","numberOfPersons":2,"airbnbConfirmationCode":"HMJ2AXYJZT"}'
do_import 43  '{"name":"Chris Sacher","checkIn":"2020-11-06","checkOut":"2020-11-10","numberOfPersons":1,"airbnbConfirmationCode":"HM5HNAZY2H"}'
do_import 44  '{"name":"Simone Deckner","checkIn":"2020-12-23","checkOut":"2020-12-30","numberOfPersons":2,"airbnbConfirmationCode":"HMH3TRB2H9"}'
do_import 45  '{"name":"Tobi Prade","checkIn":"2020-12-31","checkOut":"2021-01-03","numberOfPersons":2,"airbnbConfirmationCode":"HMQXW49ZYZ"}'
do_import 46  '{"name":"Chris Sacher","checkIn":"2021-01-04","checkOut":"2021-01-07","numberOfPersons":2,"airbnbConfirmationCode":"HMKBPJ4YMF"}'
do_import 47  '{"name":"Theresa Steininger","checkIn":"2020-10-17","checkOut":"2020-10-20","numberOfPersons":2,"airbnbConfirmationCode":"HM82MDB9YJ"}'
do_import 48  '{"name":"Chris Sacher","checkIn":"2020-10-29","checkOut":"2020-11-05","numberOfPersons":1,"airbnbConfirmationCode":"HMZDAHS9ZD"}'
do_import 49  '{"name":"Niki","checkIn":"2020-09-29","checkOut":"2020-10-02","numberOfPersons":1,"airbnbConfirmationCode":"HMDZCQPZYM"}'
do_import 50  '{"name":"Julian Keil","checkIn":"2020-10-22","checkOut":"2020-10-25","numberOfPersons":2,"airbnbConfirmationCode":"HMASPRHZW5"}'

echo ""
echo "========================================="
echo "ZUSAMMENFASSUNG"
echo "========================================="
echo "Gefundene E-Mails:  50"
echo "Neu importiert:     $NEW"
echo "Bereits vorhanden:  $DUP"
echo "Fehler:             $ERR"
echo "========================================="
