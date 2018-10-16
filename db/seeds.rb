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

User.create(name: 'admin', role: 'admin', email: 'admin@example.com', password: 'admin1234', phone: '+36202968744', confirmed_at: (Time.now+100))

succes_stories = SuccessStory.create [
  {image_path: 'success_stories/0710PI.jpg', contributor: "Magyar Korfball Szövetség &  Porkoláb Imre, Mudra Gabriella, Jean-Louis Murris", title: "Szendvicsek, saláták és hidegcsomagok a sportolóktól", description: "A budapesti Tüskecsarnokban megrendezett U21 Korfball Világbajnokság szervezőinek hála, július első hetében 5 alkalommal sikerült a sportolóknak készített hidegcsomagokat, szendvicseket, gyümölcsöket és salátát továbbadni rászorulóknak, akik így többször is komplett vacsorához jutottak. Összesen több mint 200 adag ételt mentettünk meg a kidobástól."},
  {image_path: 'success_stories/0701CSE.jpg', contributor: "Chefparade és Kleber & Csiza Ernő, dr. Fehér Judit, Nagy Zoltán, Gild, Jenet László, Oláh Lackó, Farkas Ádám", title: "Jótékony csapatépítések", description: "A Kleber francia gumigyártó cég 7 alkalommal szervezett csapatépítő jótékonysági főzést dolgozóinak a Chefparade főzőiskolában. A csapatok minden alkalommal 60-60 adag finom friss gulyást és meggyes pitét készítettek a Chefparade főzőiskolában. A nagylelkű és előremutató csapatépítésekről különböző intézményekbe szállítottuk a friss vacsorákat."},
  {image_path: 'success_stories/0711CSJ.jpg', contributor: "Anonim felajánló & Csonka Judit, dr. Fehér Judit, Jenet László, Németh Júlia", title: "Finomságok uzsonnára", description: "Egy kedves anonim felajánlónak köszönhetően idén nyáron augusztus végéig hétköznapokon változó mennyiségben, de mindig kiváló minőségű péksüteményeket, szendvicseket, zöldséget és gyümölcsöt vihetünk tovább hajléktalan ellátó helyekre."},
  {image_path: 'success_stories/0706fankok.jpg', contributor: "Apacuka & Oláh Lackó", title: "Esti fánkozás", description: "Július 6-án 100 db fánkot vihettünk a Podmaniczky úti női szállóra, ahol nagyon örültek az esti édességeknek."},
  {image_path: 'success_stories/01_01.jpg', contributor: "Anonim felajánló & Gild", title: "Teljes ebéd az átmeneti szállón", description: "Gild fedőnevű önkéntes futárunk február 16-án 58 doboz vegyes melegételt és süteményt szállított le a BMSZKI Alföldi utcai átmeneti szállására egy kedves - és anonimitást kérő - felajánló jóvoltából."},
  {image_path: 'success_stories/02_01.jpg', contributor: "Anonim felajánló & Várkonyi Beáta", title: "Mindenféle sütemények", description: "Március 19-én Várkonyi Beáta önkéntesünk 200 db finom sütit vitt a Podmaniczky úti Rés Alapítvány női szállójára."},
  {image_path: 'success_stories/03_01.jpg', contributor: "Három Tarka Macska & Laczik Erika", title: "Esti péksütemények", description: "Rendszeresen számíthatunk a Három Tarka Macska Kézműves Pékség felajánlásaira. A nap végén megmaradt pékárut és szendvicseket az esetek többségében a közelben lévő BMSZKI Dózsa György úti komplexébe szállítjuk, ahol mindig jó szívvel fogadják."},
]