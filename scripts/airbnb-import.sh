#!/usr/bin/env bash
# Airbnb Booking Import Script
# Generated: 2026-04-11
# Imports 50 parsed bookings to hostel-app-api

API_URL="https://hostel-app-api.office-509.workers.dev/airbnb-import"
AUTH="Bearer 2OTr1DXeXBEMsnnWv6Rc29F4HnYHR3tah0fbRwJEETQ="

imported=0
duplicates=0
errors=0

post_booking() {
  local name="$1"
  local check_in="$2"
  local check_out="$3"
  local persons="$4"
  local code="$5"

  local body
  body=$(printf '{"name":"%s","checkIn":"%s","checkOut":"%s","numberOfPersons":%d,"airbnbConfirmationCode":"%s"}' \
    "$name" "$check_in" "$check_out" "$persons" "$code")

  local response
  response=$(curl -s -w "\n%{http_code}" -X POST "$API_URL" \
    -H "Content-Type: application/json" \
    -H "Authorization: $AUTH" \
    -d "$body")

  local http_code
  http_code=$(echo "$response" | tail -n1)
  local body_response
  body_response=$(echo "$response" | head -n -1)

  if [[ "$http_code" == "200" || "$http_code" == "201" ]]; then
    echo "  OK       [$code] $name ($check_in → $check_out, ${persons}P)"
    ((imported++))
  elif [[ "$http_code" == "409" ]] || echo "$body_response" | grep -qi "duplicate\|already\|exists"; then
    echo "  SKIP     [$code] $name — Duplikat"
    ((duplicates++))
  else
    echo "  ERROR    [$code] $name — HTTP $http_code: $body_response"
    ((errors++))
  fi
}

echo "=== Airbnb Import gestartet: $(date) ==="
echo ""

post_booking "Corina Brottrager"               "2026-04-06" "2026-04-10" 1 "HMPPPR888D"
post_booking "Josh Alexander"                   "2026-04-12" "2026-04-17" 2 "HMDEWDEFHB"
post_booking "Thomas Heigl"                     "2026-07-19" "2026-08-02" 2 "HMQCK5HKJX"
post_booking "Max Kushynov"                     "2026-04-20" "2026-05-01" 2 "HMXBDQ44PA"
post_booking "Alexandra Harb"                   "2026-05-28" "2026-06-01" 2 "HMMQYHN9A2"
post_booking "Beate Knor"                       "2026-06-03" "2026-06-07" 2 "HMCQS3KK9F"
post_booking "Victoria Savichev"                "2026-01-24" "2026-03-31" 1 "HM8ZZEPQ4M"
post_booking "Sabine Dechat"                    "2022-09-28" "2022-10-01" 2 "HMWDSXBFT8"
post_booking "Kevin Geronimo"                   "2022-07-17" "2022-07-24" 2 "HM5ZSNEYEF"
post_booking "Andreas Knabl"                    "2022-09-01" "2022-09-04" 2 "HMF4QX38M4"
post_booking "Mariola Stacher"                  "2022-06-26" "2022-07-12" 1 "HMCN8PZKCR"
post_booking "Andreas Knabl"                    "2022-06-16" "2022-06-19" 2 "HMKNBRXBJ8"
post_booking "Barbara Sejka"                    "2022-06-03" "2022-06-07" 2 "HMETKT3ZZR"
post_booking "Lisa Goergen"                     "2022-08-15" "2022-08-23" 2 "HM3NQ9T2SN"
post_booking "Yuriy Demkovych"                  "2022-07-31" "2022-08-07" 6 "HMCP39EP4P"
post_booking "Khalid Alhashmi"                  "2022-07-25" "2022-07-30" 2 "HMN2F49X8B"
post_booking "Petra Dolezalova"                 "2022-01-21" "2022-01-28" 3 "HMBSXAFC4Q"
post_booking "Julia Tambourinegirl"             "2022-01-07" "2022-01-11" 1 "HMDP2BHT8A"
post_booking "Mona Le"                          "2022-01-12" "2022-01-23" 2 "HMFPR4SH28"
post_booking "Katrin Vutk"                      "2021-12-23" "2021-12-25" 2 "HMTBDX53S9"
post_booking "Lara Pascher"                     "2021-12-17" "2021-12-19" 4 "HMYB5A3ZPT"
post_booking "Laura Menk"                       "2021-11-03" "2021-11-06" 4 "HMQ4ZRWPK8"
post_booking "Sarah Bergner"                    "2021-10-23" "2021-10-26" 1 "HMCR3WFDSD"
post_booking "Mariola Stacher"                  "2021-12-21" "2021-12-25" 1 "HMPNTBN43T"
post_booking "Elena Sokova"                     "2021-10-29" "2021-11-01" 2 "HMDASCDB9W"
post_booking "Aleksandra Petrovic"              "2021-09-01" "2021-09-05" 2 "HMF242BN2D"
post_booking "Lisa Goergen"                     "2021-10-16" "2021-10-22" 2 "HM5WQ9ZHE4"
post_booking "Martin Bernardi"                  "2021-12-26" "2022-01-02" 2 "HMDNEQP3NF"
post_booking "Melanie Jasmin Crnomarkovic"      "2021-10-04" "2021-10-10" 3 "HMC92EKAMD"
post_booking "Krisztina Zsombor"                "2021-08-20" "2021-08-30" 2 "HMJSWYCFHK"
post_booking "Bert Geertsma"                    "2021-06-21" "2021-06-27" 4 "HMK2XTKJXM"
post_booking "Ali Kemal Akcakir"                "2021-07-06" "2021-07-11" 5 "HMFCB8W9PB"
post_booking "Fabienne Hellmond"                "2021-07-27" "2021-08-04" 2 "HMAR924D2H"
post_booking "Iona Eichleter"                   "2021-08-12" "2021-08-15" 2 "HMDT85Q3KS"
post_booking "Marc Seesing"                     "2021-08-06" "2021-08-11" 2 "HM2AJANET5"
post_booking "Gabriela De Ataíde Magalhães"     "2021-07-12" "2021-07-26" 4 "HMXN49QPR9"
post_booking "Astopher Bosskübel"               "2021-07-07" "2021-07-11" 4 "HM495FSHZZ"
post_booking "Tina Schuster"                    "2021-06-15" "2021-06-20" 2 "HM8YA4BKQT"
post_booking "Silvan Müller"                    "2021-06-28" "2021-07-05" 2 "HMTPMPNBQ8"
post_booking "Johanna Wagner"                   "2021-06-04" "2021-06-07" 2 "HM8ZSWET2D"
post_booking "Alex Gotter"                      "2021-05-07" "2021-05-10" 2 "HMF3FH9QYQ"
post_booking "Annemarie Ohnoutka"               "2021-05-21" "2021-05-24" 2 "HMFRQ3P2XZ"
post_booking "Marlene Anna"                     "2021-04-27" "2021-04-30" 2 "HMJ2AXYJZT"
post_booking "Chris Sacher"                     "2020-11-06" "2020-11-10" 1 "HM5HNAZY2H"
post_booking "Simone Deckner"                   "2020-12-23" "2020-12-30" 2 "HMH3TRB2H9"
post_booking "Tobi Prade"                       "2020-12-31" "2021-01-03" 2 "HMQXW49ZYZ"
post_booking "Chris Sacher"                     "2021-01-04" "2021-01-07" 2 "HMKBPJ4YMF"
post_booking "Theresa Steininger"               "2020-10-17" "2020-10-20" 2 "HM82MDB9YJ"
post_booking "Chris Sacher"                     "2020-10-29" "2020-11-05" 1 "HMZDAHS9ZD"
post_booking "Niki"                             "2020-09-29" "2020-10-02" 1 "HMDZCQPZYM"

echo ""
echo "=== Ergebnis ==="
echo "  Importiert:  $imported"
echo "  Duplikate:   $duplicates"
echo "  Fehler:      $errors"
echo "  Gesamt:      $((imported + duplicates + errors))"
echo "=== Fertig: $(date) ==="
