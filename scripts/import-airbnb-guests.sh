#!/bin/bash
# Airbnb Guest Import Script
# Imports all 50 guests parsed from Gmail booking confirmation emails
# Run this locally: bash scripts/import-airbnb-guests.sh

API="https://hostel-app-api.office-509.workers.dev/airbnb-import"
TOKEN="2OTr1DXeXBEMsnnWv6Rc29F4HnYHR3tah0fbRwJEETQ="

new=0
duplicate=0
errors=0
total=0

import_guest() {
  local name="$1"
  local checkIn="$2"
  local checkOut="$3"
  local persons="$4"
  local code="$5"

  total=$((total + 1))

  response=$(curl -s -X POST "$API" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -d "{\"name\":\"$name\",\"checkIn\":\"$checkIn\",\"checkOut\":\"$checkOut\",\"numberOfPersons\":$persons,\"airbnbConfirmationCode\":\"$code\"}" \
    --max-time 30 -w "\n%{http_code}")

  http_code=$(echo "$response" | tail -n1)
  body=$(echo "$response" | head -n-1)

  if echo "$body" | grep -q '"duplicate":true'; then
    echo "  DUPLICATE  [$code] $name"
    duplicate=$((duplicate + 1))
  elif echo "$body" | grep -q '"duplicate":false'; then
    echo "  NEW        [$code] $name"
    new=$((new + 1))
  else
    echo "  ERROR      [$code] $name  HTTP:$http_code  Response:$body"
    errors=$((errors + 1))
  fi
}

echo "=== Airbnb Guest Import ==="
echo ""

import_guest "Josh Alexander"                    "2026-04-12" "2026-04-17" 2 "HMDEWDEFHB"
import_guest "Thomas Heigl"                      "2026-07-19" "2026-08-02" 2 "HMQCK5HKJX"
import_guest "Max Kushynov"                      "2026-04-20" "2026-05-01" 2 "HMXBDQ44PA"
import_guest "Alexandra Harb"                    "2026-05-28" "2026-06-01" 2 "HMMQYHN9A2"
import_guest "Beate Knor"                        "2026-06-03" "2026-06-07" 2 "HMCQS3KK9F"
import_guest "Victoria Savichev"                 "2026-01-24" "2026-03-31" 1 "HM8ZZEPQ4M"
import_guest "Sabine Dechat"                     "2022-09-28" "2022-10-01" 2 "HMWDSXBFT8"
import_guest "Kevin Geronimo"                    "2022-07-17" "2022-07-24" 2 "HM5ZSNEYEF"
import_guest "Andreas Knabl"                     "2022-09-01" "2022-09-04" 2 "HMF4QX38M4"
import_guest "Mariola Stacher"                   "2022-06-26" "2022-07-12" 1 "HMCN8PZKCR"
import_guest "Andreas Knabl"                     "2022-06-16" "2022-06-19" 2 "HMKNBRXBJ8"
import_guest "Barbara Sejka"                     "2022-06-03" "2022-06-07" 2 "HMETKT3ZZR"
import_guest "Lisa Goergen"                      "2022-08-15" "2022-08-23" 2 "HM3NQ9T2SN"
import_guest "Yuriy Demkovych"                   "2022-07-31" "2022-08-07" 6 "HMCP39EP4P"
import_guest "Khalid Alhashmi"                   "2022-07-25" "2022-07-30" 2 "HMN2F49X8B"
import_guest "Petra Dolezalova"                  "2022-01-21" "2022-01-28" 3 "HMBSXAFC4Q"
import_guest "Julia Tambourinegirl"              "2022-01-07" "2022-01-11" 1 "HMDP2BHT8A"
import_guest "Mona Le"                           "2022-01-12" "2022-01-23" 2 "HMFPR4SH28"
import_guest "Katrin Vutk"                       "2021-12-23" "2021-12-25" 2 "HMTBDX53S9"
import_guest "Lara Pascher"                      "2021-12-17" "2021-12-19" 4 "HMYB5A3ZPT"
import_guest "Laura Menk"                        "2021-11-03" "2021-11-06" 4 "HMQ4ZRWPK8"
import_guest "Sarah Bergner"                     "2021-10-23" "2021-10-26" 1 "HMCR3WFDSD"
import_guest "Mariola Stacher"                   "2021-12-21" "2021-12-25" 1 "HMPNTBN43T"
import_guest "Elena Sokova"                      "2021-10-29" "2021-11-01" 2 "HMDASCDB9W"
import_guest "Aleksandra Petrovic"               "2021-09-01" "2021-09-05" 2 "HMF242BN2D"
import_guest "Lisa Goergen"                      "2021-10-16" "2021-10-22" 2 "HM5WQ9ZHE4"
import_guest "Martin Bernardi"                   "2021-12-26" "2022-01-02" 2 "HMDNEQP3NF"
import_guest "Melanie Jasmin Crnomarkovic"       "2021-10-04" "2021-10-10" 3 "HMC92EKAMD"
import_guest "Krisztina Zsombor"                 "2021-08-20" "2021-08-30" 2 "HMJSWYCFHK"
import_guest "Bert Geertsma"                     "2021-06-21" "2021-06-27" 4 "HMK2XTKJXM"
import_guest "Ali Kemal Akcakir"                 "2021-07-06" "2021-07-11" 5 "HMFCB8W9PB"
import_guest "Fabienne Hellmond"                 "2021-07-27" "2021-08-04" 2 "HMAR924D2H"
import_guest "Iona Eichleter"                    "2021-08-12" "2021-08-15" 2 "HMDT85Q3KS"
import_guest "Marc Seesing"                      "2021-08-06" "2021-08-11" 2 "HM2AJANET5"
import_guest "Gabriela De Ataíde Magalhães"     "2021-07-12" "2021-07-26" 4 "HMXN49QPR9"
import_guest "Astopher Bosskübel"               "2021-07-07" "2021-07-11" 4 "HM495FSHZZ"
import_guest "Tina Schuster"                     "2021-06-15" "2021-06-20" 2 "HM8YA4BKQT"
import_guest "Silvan Müller"                     "2021-06-28" "2021-07-05" 2 "HMTPMPNBQ8"
import_guest "Johanna Wagner"                    "2021-06-04" "2021-06-07" 2 "HM8ZSWET2D"
import_guest "Alex Gotter"                       "2021-05-07" "2021-05-10" 2 "HMF3FH9QYQ"
import_guest "Annemarie Ohnoutka"               "2021-05-21" "2021-05-24" 2 "HMFRQ3P2XZ"
import_guest "Marlene Anna"                      "2021-04-27" "2021-04-30" 2 "HMJ2AXYJZT"
import_guest "Chris Sacher"                      "2020-11-06" "2020-11-10" 1 "HM5HNAZY2H"
import_guest "Simone Deckner"                    "2020-12-23" "2020-12-30" 2 "HMH3TRB2H9"
import_guest "Tobi Prade"                        "2020-12-31" "2021-01-03" 2 "HMQXW49ZYZ"
import_guest "Chris Sacher"                      "2021-01-04" "2021-01-07" 2 "HMKBPJ4YMF"
import_guest "Theresa Steininger"                "2020-10-17" "2020-10-20" 2 "HM82MDB9YJ"
import_guest "Chris Sacher"                      "2020-10-29" "2020-11-05" 1 "HMZDAHS9ZD"
import_guest "Niki"                              "2020-09-29" "2020-10-02" 1 "HMDZCQPZYM"
import_guest "Julian Keil"                       "2020-10-22" "2020-10-25" 2 "HMASPRHZW5"

echo ""
echo "=== Summary ==="
echo "Emails found:      50"
echo "New guests:        $new"
echo "Already existing:  $duplicate"
echo "Errors:            $errors"
echo "Total processed:   $total"
