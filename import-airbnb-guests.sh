#!/bin/bash
# Airbnb Guest Import Script
# Generated from 50 Gmail booking confirmation emails
# Run this script locally: bash import-airbnb-guests.sh

API="https://hostel-app-api.office-509.workers.dev/airbnb-import"
AUTH="Bearer 2OTr1DXeXBEMsnnWv6Rc29F4HnYHR3tah0fbRwJEETQ="

success=0
duplicate=0
error=0

post() {
  local name="$1" checkIn="$2" checkOut="$3" persons="$4" code="$5"
  local resp
  resp=$(curl -s -w "\n%{http_code}" -X POST "$API" \
    -H "Content-Type: application/json" \
    -H "Authorization: $AUTH" \
    -d "{\"name\":\"$name\",\"checkIn\":\"$checkIn\",\"checkOut\":\"$checkOut\",\"numberOfPersons\":$persons,\"airbnbConfirmationCode\":\"$code\"}")
  local body http_code
  body=$(echo "$resp" | head -n -1)
  http_code=$(echo "$resp" | tail -n 1)
  if [[ "$http_code" == "200" || "$http_code" == "201" ]]; then
    echo "✓ $name ($code)"
    ((success++))
  elif [[ "$http_code" == "409" ]] || echo "$body" | grep -qi "duplicate\|already exists"; then
    echo "= $name ($code) — duplicate"
    ((duplicate++))
  else
    echo "✗ $name ($code) — HTTP $http_code: $body"
    ((error++))
  fi
}

# 2026 bookings
post "Josh Alexander"                 "2026-04-12" "2026-04-17"  2  "HMDEWDEFHB"
post "Thomas Heigl"                   "2026-07-19" "2026-08-02"  2  "HMQCK5HKJX"
post "Max Kushynov"                   "2026-04-20" "2026-05-01"  2  "HMXBDQ44PA"
post "Alexandra Harb"                 "2026-05-28" "2026-06-01"  2  "HMMQYHN9A2"
post "Beate Knor"                     "2026-06-03" "2026-06-07"  2  "HMCQS3KK9F"
post "Victoria Savichev"              "2026-01-24" "2026-03-31"  1  "HM8ZZEPQ4M"

# 2022 bookings
post "Sabine Dechat"                  "2022-09-28" "2022-10-01"  2  "HMWDSXBFT8"
post "Kevin Geronimo"                 "2022-07-17" "2022-07-24"  2  "HM5ZSNEYEF"
post "Andreas Knabl"                  "2022-09-01" "2022-09-04"  2  "HMF4QX38M4"
post "Mariola Stacher"                "2022-06-26" "2022-07-12"  1  "HMCN8PZKCR"
post "Andreas Knabl"                  "2022-06-16" "2022-06-19"  2  "HMKNBRXBJ8"
post "Barbara Sejka"                  "2022-06-03" "2022-06-07"  2  "HMETKT3ZZR"
post "Lisa Goergen"                   "2022-08-15" "2022-08-23"  2  "HM3NQ9T2SN"
post "Yuriy Demkovych"                "2022-07-31" "2022-08-07"  6  "HMCP39EP4P"
post "Khalid Alhashmi"                "2022-07-25" "2022-07-30"  2  "HMN2F49X8B"
post "Petra Dolezalova"               "2022-01-21" "2022-01-28"  3  "HMBSXAFC4Q"
post "Julia Tambourinegirl"           "2022-01-07" "2022-01-11"  1  "HMDP2BHT8A"
post "Mona Le"                        "2022-01-12" "2022-01-23"  2  "HMFPR4SH28"

# 2021 bookings
post "Katrin Vutk"                    "2021-12-23" "2021-12-25"  2  "HMTBDX53S9"
post "Lara Pascher"                   "2021-12-17" "2021-12-19"  4  "HMYB5A3ZPT"
post "Mariola Stacher"                "2021-12-21" "2021-12-25"  1  "HMPNTBN43T"
post "Martin Bernardi"                "2021-12-26" "2022-01-02"  2  "HMDNEQP3NF"
post "Laura Menk"                     "2021-11-03" "2021-11-06"  4  "HMQ4ZRWPK8"
post "Elena Sokova"                   "2021-10-29" "2021-11-01"  2  "HMDASCDB9W"
post "Sarah Bergner"                  "2021-10-23" "2021-10-26"  1  "HMCR3WFDSD"
post "Melanie Jasmin Crnomarkovic"    "2021-10-04" "2021-10-10"  3  "HMC92EKAMD"
post "Lisa Goergen"                   "2021-10-16" "2021-10-22"  2  "HM5WQ9ZHE4"
post "Aleksandra Petrovic"            "2021-09-01" "2021-09-05"  2  "HMF242BN2D"
post "Krisztina Zsombor"              "2021-08-20" "2021-08-30"  2  "HMJSWYCFHK"
post "Iona Eichleter"                 "2021-08-12" "2021-08-15"  2  "HMDT85Q3KS"
post "Marc Seesing"                   "2021-08-06" "2021-08-11"  2  "HM2AJANET5"
post "Fabienne Hellmond"              "2021-07-27" "2021-08-04"  2  "HMAR924D2H"
post "Gabriela De Ataíde Magalhães"   "2021-07-12" "2021-07-26"  4  "HMXN49QPR9"
post "Ali Kemal Akcakir"              "2021-07-06" "2021-07-11"  5  "HMFCB8W9PB"
post "Astopher Bosskübel"             "2021-07-07" "2021-07-11"  4  "HM495FSHZZ"
post "Silvan Müller"                  "2021-06-28" "2021-07-05"  2  "HMTPMPNBQ8"
post "Bert Geertsma"                  "2021-06-21" "2021-06-27"  4  "HMK2XTKJXM"
post "Tina Schuster"                  "2021-06-15" "2021-06-20"  2  "HM8YA4BKQT"
post "Johanna Wagner"                 "2021-06-04" "2021-06-07"  2  "HM8ZSWET2D"
post "Alex Gotter"                    "2021-05-07" "2021-05-10"  2  "HMF3FH9QYQ"
post "Annemarie Ohnoutka"             "2021-05-21" "2021-05-24"  2  "HMFRQ3P2XZ"
post "Marlene Anna"                   "2021-04-27" "2021-04-30"  2  "HMJ2AXYJZT"

# 2020 bookings
post "Chris Sacher"                   "2020-11-06" "2020-11-10"  1  "HM5HNAZY2H"
post "Chris Sacher"                   "2020-10-29" "2020-11-05"  1  "HMZDAHS9ZD"
post "Julian Keil"                    "2020-10-22" "2020-10-25"  2  "HMASPRHZW5"
post "Theresa Steininger"             "2020-10-17" "2020-10-20"  2  "HM82MDB9YJ"
post "Niki"                           "2020-09-29" "2020-10-02"  1  "HMDZCQPZYM"
post "Simone Deckner"                 "2020-12-23" "2020-12-30"  2  "HMH3TRB2H9"
post "Tobi Prade"                     "2020-12-31" "2021-01-03"  2  "HMQXW49ZYZ"
post "Chris Sacher"                   "2021-01-04" "2021-01-07"  2  "HMKBPJ4YMF"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Ergebnis: $success neu | $duplicate Duplikate | $error Fehler"
