#!/bin/bash
PAGES=("https://2e.aonprd.com/Equipment.aspx?Category=62" 
 "https://2e.aonprd.com/Equipment.aspx?Category=1"
 "https://2e.aonprd.com/Equipment.aspx?Category=6"
 "https://2e.aonprd.com/Armor.aspx"
 "https://2e.aonprd.com/Equipment.aspx?Category=45"
 "https://2e.aonprd.com/Equipment.aspx?Category=72"
 "https://2e.aonprd.com/Equipment.aspx?Category=15"
 "https://2e.aonprd.com/Equipment.aspx?Category=58"
 "https://2e.aonprd.com/Equipment.aspx?Category=49"
 "https://2e.aonprd.com/Equipment.aspx?Category=75"
 "https://2e.aonprd.com/Equipment.aspx?Category=65"
 "https://2e.aonprd.com/Equipment.aspx?Category=21"
 "https://2e.aonprd.com/Equipment.aspx?Category=48"
 "https://2e.aonprd.com/Equipment.aspx?Category=22"
 "https://2e.aonprd.com/Equipment.aspx?Category=53"
 "https://2e.aonprd.com/Equipment.aspx?Category=23"
 "https://2e.aonprd.com/Equipment.aspx?Category=2"
 "https://2e.aonprd.com/Shields.aspx"
 "https://2e.aonprd.com/SiegeWeapons.aspx"
 "https://2e.aonprd.com/Equipment.aspx?Category=31"
 "https://2e.aonprd.com/Equipment.aspx?Category=68"
 "https://2e.aonprd.com/Equipment.aspx?Category=32"
 "https://2e.aonprd.com/Equipment.aspx?Category=33"
 "https://2e.aonprd.com/Equipment.aspx?Category=46"
 "https://2e.aonprd.com/Vehicles.aspx"
 "https://2e.aonprd.com/Equipment.aspx?Category=34"
 "https://2e.aonprd.com/Weapons.aspx"
 "https://2e.aonprd.com/Equipment.aspx?Category=41")

for P in "${PAGES[@]}"
do
    node index.js $P
done