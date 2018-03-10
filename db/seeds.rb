# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

target_locations = TargetLocation.create [
  {name: "Podmaniczky", address: "Podmaniczky utca 33", contact_name: "", phone: "+36 1 269-36-01 (Központi)", category: "fapad - női", capacity: 35, winter_capacity: 50, comment: "16-07-ig hívható"},
  {name: "Dankó", address: "Budapest VIII., Dankó u. 9.", contact_name: "", phone: "+36 1 210-5400", category: "nappali melegedő, éjjeli menedékhely", capacity: nil, winter_capacity: nil, comment: ""},
  {name: "Menhely Kürt utca", address: "1074 Budapest, Kürt u. 4", contact_name: "", phone: "+36 1 322-3423", category: "nappali melegedő, információs központ", capacity: 240, winter_capacity: nil, comment: "H-Sz"},
  {name: "Menedékház", address: "1112 Budapest, Muskétás u. 1", contact_name: "", phone: "+36 30 9895739", category: "nappali melegedő (60 fő)+ átmeneti szálló (80 fő - férfi, női)", capacity: 60, winter_capacity: nil, comment: "H-P"},
  {name: "Golgota Keresztény Gyülekezet", address: "1074 Budapest, Vörösmarty utca 17.", contact_name: "", phone: "+36 1 786-1946", category: "nappali melegedő", capacity: 85, winter_capacity: nil, comment: "H-V"},
  {name: "Tiszta Forrás", address: "1181 Budapest, Üllői út 373.", contact_name: "", phone: "+36 1 297-0357", category: "", capacity: 120, winter_capacity: nil, comment: "H-V"},
  {name: "Isola Menedékhely", address: "1138 Budapest, Népsziget, Zsilip utca 13.", contact_name: "", phone: "+36 20 353-6483", category: "fapad", capacity: 76, winter_capacity: nil, comment: "18-08-ig nyitva"},
  {name: "BMSZKI Szobabérlők háza", address: "1157 Budapest, Kőrakás park 1-8", contact_name: "", phone: "+36 1 414-0631", category: "", capacity: 500, winter_capacity: nil, comment: "Elvileg piaci alapon működő szegény emberek"},
  {name: "BMSZKI Éjjeli Menedékhely", address: "1097 Budapest, Aszódi út 18.", contact_name: "", phone: "+36 70 377-3401 ", category: "Fapad", capacity: 200, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Könyves Éjjeli Menedékhely és Nappali Melegedő", address: "Budapest X., Könyves K. krt. 84.", contact_name: "", phone: "+36 1 333-11-94", category: "Fapad (38 fő) + melegedő (200 fő)", capacity: 210, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Váci Éjjeli Menedékhely és Nappali Melegedő", address: "IV. Budapest, Váci út 102.", contact_name: "", phone: "+36 1 232-11-35", category: "Fapad - férfi, női, páros", capacity: 74, winter_capacity: nil, comment: "17:30-8:30-ig nyitva"},
  {name: "BMSZKI Előd Éjjeli Menedékhely", address: "Budapest X., Előd u. 9.", contact_name: "", phone: "+36 1 260-70-46", category: "fapad - férfi ", capacity: 140, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Bánya Éjjeli Menedékhely", address: "Budapest X., Bánya u. 37.", contact_name: "", phone: "+36 1 262-03-50", category: "Fapad - férfi", capacity: 64, winter_capacity: nil, comment: "0-24-es"},
  {name: "BMSZKI Kőbányai Éjjeli Menedékhely", address: "Budapest X., Kőbányai út 22.7", contact_name: "", phone: "+36 1 323-33-05", category: "fapad - férfo", capacity: 40, winter_capacity: nil, comment: "0-24-es"},
  {name: "BMSZKI Átmeneti szálló", address: "1157 Budapest, Kőrakás park 4. lépcsőház", contact_name: "", phone: "+36 1 414-0631", category: "Átmeneti szálló - férfi, női, páros", capacity: 110, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Éjjeli Menedékhely", address: "1134 Budapest, Dózs Gy. út 152.", contact_name: "", phone: "+36 1 238-9552 / +36 1 238-9553 / +36 1 238-9536", category: "fapad - női", capacity: 148, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Táblás", address: "1097 Budapest, Táblás u.31.", contact_name: "Ügyeletes szocmunkás", phone: "+36 1 3470257 (Központi)", category: "Átmeneti szálló - férfi, női, páros", capacity: 80, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Origóc Nappali Melegedő", address: "1134 Budapest, Dózsa György út 152", contact_name: "", phone: "+36 1 238-9530", category: "nappali melegedő", capacity: 70, winter_capacity: nil, comment: "H-P"},
  {name: "BMSZKI Családok Átmeneti Otthona", address: "1142 Budapest XIV. Rákosszeg park 4-6", contact_name: "", phone: "+36 1 422-04-04", category: "fizetős szálló", capacity: 80, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Krízis Anya-gyermek Szállás", address: "1142 Budapest XIV. Rákosszeg park 4-6", contact_name: "", phone: "+36 1 422-04-04", category: "max 5 nap", capacity: nil, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Gyáli u", address: "1097 Budapest Gyáli út 33-35", contact_name: "Keserű Zsolt", phone: "+36 30 4853076", category: "Átmeneti szálló - férfi, női, páros", capacity: 146, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Vaspálya u.", address: "1103 Budapest, Vaspálya utca 56.", contact_name: "", phone: "", category: "átmeneti szálló - férfi, női ", capacity: 66, winter_capacity: nil, comment: "absztinens szálló"},
  {name: "BMSZKI Külső Mester u.", address: "Budapest IX., Külső Mester u. 84.", contact_name: "", phone: "", category: "", capacity: nil, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Fehér köz", address: "Budapest X., Fehér köz 2.", contact_name: "", phone: "", category: "Nappali melegedő", capacity: 120, winter_capacity: nil, comment: "H-P"},
  {name: "BMSZKI Kocsis u.", address: "1119 Budapest Kocsis u. 26.", contact_name: "", phone: "", category: "átmeneti szálló - férfi, női, páros", capacity: 148, winter_capacity: nil, comment: ""},
  {name: "BMSZKI Alföldi u.", address: "Alföldi u. 6-8, Budapest, 1081", contact_name: "Preszl Éva", phone: "+36 30 4853122", category: "Átmeneti szálló - férfi, női ", capacity: 181, winter_capacity: nil, comment: ""},
  {name: "Menhely Vajda", address: "1082, Vajdahunyad u. 3.", contact_name: "", phone: "+36 1 333-5987", category: "fapad - férfi", capacity: 52, winter_capacity: nil, comment: "18-08h-ig nyitva"},
]
