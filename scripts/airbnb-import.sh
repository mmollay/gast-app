#!/bin/bash
# Airbnb Buchungsimport - 50 Gäste aus Gmail-Export
# Ausführen: bash scripts/airbnb-import.sh

API_URL="https://hostel-app-api.office-509.workers.dev/airbnb-import"
AUTH="Bearer 2OTr1DXeXBEMsnnWv6Rc29F4HnYHR3tah0fbRwJEETQ="

new=0
duplicate=0
error=0

import() {
  local name="$1" checkIn="$2" checkOut="$3" persons="$4" code="$5"
  local response
  response=$(curl -s -X POST "$API_URL" \
    -H "Content-Type: application/json" \
    -H "Authorization: $AUTH" \
    -d "{\"name\":\"$name\",\"checkIn\":\"$checkIn\",\"checkOut\":\"$checkOut\",\"numberOfPersons\":$persons,\"airbnbConfirmationCode\":\"$code\"}")
  local exit_code=$?
  if [ $exit_code -ne 0 ]; then
    echo "ERROR [$code] $name - curl exit $exit_code"
    ((error++))
  elif echo "$response" | grep -q '"duplicate":true'; then
    echo "DUPL  [$code] $name"
    ((duplicate++))
  elif echo "$response" | grep -q '"duplicate":false\|"success":true\|"id":'; then
    echo "NEW   [$code] $name ($checkIn → $checkOut, $persons P.)"
    ((new++))
  else
    echo "?     [$code] $name — Response: $response"
    ((error++))
  fi
}

echo "=== Airbnb Import gestartet ==="
echo ""

import "Josh Alexander"                  "2026-04-12" "2026-04-17" 2 "HMDEWDEFHB"
import "Thomas Heigl"                    "2026-07-19" "2026-08-02" 2 "HMQCK5HKJX"
import "Max Kushynov"                    "2026-04-20" "2026-05-01" 2 "HMXBDQ44PA"
import "Alexandra Harb"                  "2026-05-28" "2026-06-01" 2 "HMMQYHN9A2"
import "Beate Knor"                      "2026-06-03" "2026-06-07" 2 "HMCQS3KK9F"
import "Victoria Savichev"               "2026-01-24" "2026-03-31" 1 "HM8ZZEPQ4M"
import "Sabine Dechat"                   "2022-09-28" "2022-10-01" 2 "HMWDSXBFT8"
import "Kevin Geronimo"                  "2022-07-17" "2022-07-24" 2 "HM5ZSNEYEF"
import "Andreas Knabl"                   "2022-09-01" "2022-09-04" 2 "HMF4QX38M4"
import "Mariola Stacher"                 "2022-06-26" "2022-07-12" 1 "HMCN8PZKCR"
import "Andreas Knabl"                   "2022-06-16" "2022-06-19" 2 "HMKNBRXBJ8"
import "Barbara Sejka"                   "2022-06-03" "2022-06-07" 2 "HMETKT3ZZR"
import "Lisa Goergen"                    "2022-08-15" "2022-08-23" 2 "HM3NQ9T2SN"
import "Yuriy Demkovych"                 "2022-07-31" "2022-08-07" 6 "HMCP39EP4P"
import "Khalid Alhashmi"                 "2022-07-25" "2022-07-30" 2 "HMN2F49X8B"
import "Petra Dolezalova"                "2022-01-21" "2022-01-28" 3 "HMBSXAFC4Q"
import "Julia Tambourinegirl"            "2022-01-07" "2022-01-11" 1 "HMDP2BHT8A"
import "Mona Le"                         "2022-01-12" "2022-01-23" 2 "HMFPR4SH28"
import "Katrin Vutk"                     "2021-12-23" "2021-12-25" 2 "HMTBDX53S9"
import "Lara Pascher"                    "2021-12-17" "2021-12-19" 4 "HMYB5A3ZPT"
import "Laura Menk"                      "2021-11-03" "2021-11-06" 4 "HMQ4ZRWPK8"
import "Sarah Bergner"                   "2021-10-23" "2021-10-26" 1 "HMCR3WFDSD"
import "Mariola Stacher"                 "2021-12-21" "2021-12-25" 1 "HMPNTBN43T"
import "Elena Sokova"                    "2021-10-29" "2021-11-01" 2 "HMDASCDB9W"
import "Aleksandra Petrovic"             "2021-09-01" "2021-09-05" 2 "HMF242BN2D"
import "Lisa Goergen"                    "2021-10-16" "2021-10-22" 2 "HM5WQ9ZHE4"
import "Martin Bernardi"                 "2021-12-26" "2022-01-02" 2 "HMDNEQP3NF"
import "Melanie Jasmin Crnomarkovic"     "2021-10-04" "2021-10-10" 3 "HMC92EKAMD"
import "Krisztina Zsombor"               "2021-08-20" "2021-08-30" 2 "HMJSWYCFHK"
import "Bert Geertsma"                   "2021-06-21" "2021-06-27" 4 "HMK2XTKJXM"
import "Ali Kemal Akcakir"               "2021-07-06" "2021-07-11" 5 "HMFCB8W9PB"
import "Fabienne Hellmond"               "2021-07-27" "2021-08-04" 2 "HMAR924D2H"
import "Iona Eichleter"                  "2021-08-12" "2021-08-15" 2 "HMDT85Q3KS"
import "Marc Seesing"                    "2021-08-06" "2021-08-11" 2 "HM2AJANET5"
import "Gabriela De Ataíde Magalhães"    "2021-07-12" "2021-07-26" 4 "HMXN49QPR9"
import "Astopher Bosskübel"              "2021-07-07" "2021-07-11" 4 "HM495FSHZZ"
import "Tina Schuster"                   "2021-06-15" "2021-06-20" 2 "HM8YA4BKQT"
import "Silvan Müller"                   "2021-06-28" "2021-07-05" 2 "HMTPMPNBQ8"
import "Johanna Wagner"                  "2021-06-04" "2021-06-07" 2 "HM8ZSWET2D"
import "Alex Gotter"                     "2021-05-07" "2021-05-10" 2 "HMF3FH9QYQ"
import "Annemarie Ohnoutka"              "2021-05-21" "2021-05-24" 2 "HMFRQ3P2XZ"
import "Marlene Anna"                    "2021-04-27" "2021-04-30" 2 "HMJ2AXYJZT"
import "Chris Sacher"                    "2020-11-06" "2020-11-10" 1 "HM5HNAZY2H"
import "Simone Deckner"                  "2020-12-23" "2020-12-30" 2 "HMH3TRB2H9"
import "Tobi Prade"                      "2020-12-31" "2021-01-03" 2 "HMQXW49ZYZ"
import "Chris Sacher"                    "2021-01-04" "2021-01-07" 2 "HMKBPJ4YMF"
import "Theresa Steininger"              "2020-10-17" "2020-10-20" 2 "HM82MDB9YJ"
import "Chris Sacher"                    "2020-10-29" "2020-11-05" 1 "HMZDAHS9ZD"
import "Niki"                            "2020-09-29" "2020-10-02" 1 "HMDZCQPZYM"
import "Julian Keil"                     "2020-10-22" "2020-10-25" 2 "HMASPRHZW5"

echo ""
echo "=== Ergebnis ==="
echo "Neu importiert: $new"
echo "Duplikate:      $duplicate"
echo "Fehler:         $error"
echo "Gesamt:         $((new + duplicate + error))"
