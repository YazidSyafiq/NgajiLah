String getNamaSurah(int nomorAyat) {
  if (nomorAyat > 0 && nomorAyat <= 7) {
    return 'Al-Fatihah';
  } else if (nomorAyat >= 8 && nomorAyat <= 293) {
    return 'Al-Baqarah';
  } else if (nomorAyat >= 294 && nomorAyat <= 493) {
    return 'Ali \'Imran';
  } else if (nomorAyat >= 494 && nomorAyat <= 669) {
    return 'An-Nisa\'';
  } else if (nomorAyat >= 670 && nomorAyat <= 789) {
    return 'Al-Ma\'idah';
  } else if (nomorAyat >= 790 && nomorAyat <= 954) {
    return 'Al-An\'am';
  } else if (nomorAyat >= 955 && nomorAyat <= 1160) {
    return 'Al-A\'raf';
  } else if (nomorAyat >= 670 && nomorAyat <= 1235) {
    return 'Al-Anfal';
  } else if (nomorAyat >= 1236 && nomorAyat <= 1364) {
    return 'At-Taubah';
  } else if (nomorAyat >= 1365 && nomorAyat <= 1473) {
    return 'Yunus';
  } else if (nomorAyat >= 1474 && nomorAyat <= 1596) {
    return 'Hud';
  } else if (nomorAyat >= 1597 && nomorAyat <= 1707) {
    return 'Yusuf';
  } else if (nomorAyat >= 1708 && nomorAyat <= 1750) {
    return 'Ar-Ra\'ad';
  } else if (nomorAyat >= 1751 && nomorAyat <= 1802) {
    return 'Ibrahim';
  } else if (nomorAyat >= 1803 && nomorAyat <= 1901) {
    return 'Ar-Hijr';
  } else if (nomorAyat >= 1902 && nomorAyat <= 2029) {
    return 'An-Nahl';
  } else if (nomorAyat >= 2030 && nomorAyat <= 2140) {
    return 'Al-Isra\'';
  } else if (nomorAyat >= 2141 && nomorAyat <= 2250) {
    return 'Al-Kahf';
  } else if (nomorAyat >= 2251 && nomorAyat <= 2348) {
    return 'Maryam';
  } else if (nomorAyat >= 2349 && nomorAyat <= 2483) {
    return 'Ta Ha';
  } else if (nomorAyat >= 2484 && nomorAyat <= 2595) {
    return 'Al-Anbiya';
  } else if (nomorAyat >= 2596 && nomorAyat <= 2673) {
    return 'Al-Hajj';
  } else if (nomorAyat >= 2674 && nomorAyat <= 2791) {
    return 'Al-Mu\'minun';
  } else if (nomorAyat >= 2792 && nomorAyat <= 2855) {
    return 'An-Nur';
  } else if (nomorAyat >= 2856 && nomorAyat <= 2932) {
    return 'Al-Furqan';
  } else if (nomorAyat >= 2933 && nomorAyat <= 3159) {
    return 'Asy-Syu\'ara\'';
  } else if (nomorAyat >= 3160 && nomorAyat <= 3252) {
    return 'An-Naml';
  } else if (nomorAyat >= 3253 && nomorAyat <= 3340) {
    return 'Al-Qasas';
  } else if (nomorAyat >= 3341 && nomorAyat <= 3409) {
    return 'Al-\'Ankabut';
  } else if (nomorAyat >= 3410 && nomorAyat <= 3469) {
    return 'Ar-Rum';
  } else if (nomorAyat >= 3470 && nomorAyat <= 3503) {
    return 'Luqman';
  } else if (nomorAyat >= 3504 && nomorAyat <= 3533) {
    return 'As-Sajdah';
  } else if (nomorAyat >= 3534 && nomorAyat <= 3606) {
    return 'Al-Ahzab';
  } else if (nomorAyat >= 3606 && nomorAyat <= 3660) {
    return 'Saba\'';
  } else if (nomorAyat >= 3661 && nomorAyat <= 3705) {
    return 'Fatir';
  } else if (nomorAyat >= 3706 && nomorAyat <= 3788) {
    return 'Ya Sin';
  } else if (nomorAyat >= 3789 && nomorAyat <= 3970) {
    return 'As-Saffat';
  } else if (nomorAyat >= 3971 && nomorAyat <= 4058) {
    return 'Sad';
  } else if (nomorAyat >= 4059 && nomorAyat <= 4133) {
    return 'Az-Zumar';
  } else if (nomorAyat >= 4134 && nomorAyat <= 4218) {
    return 'Ghafir';
  } else if (nomorAyat >= 4219 && nomorAyat <= 4272) {
    return 'Fussilat';
  } else if (nomorAyat >= 4273 && nomorAyat <= 4325) {
    return 'Asy-Syura';
  } else if (nomorAyat >= 4326 && nomorAyat <= 4414) {
    return 'Az-Zukhruf';
  } else if (nomorAyat >= 4415 && nomorAyat <= 4473) {
    return 'Ad-Dukhan';
  } else if (nomorAyat >= 4473 && nomorAyat <= 4510) {
    return 'Al-Jasiyah';
  } else if (nomorAyat >= 4511 && nomorAyat <= 4545) {
    return 'Al-Ahqaf';
  } else if (nomorAyat >= 4546 && nomorAyat <= 4583) {
    return 'Muhammad';
  } else if (nomorAyat >= 4584 && nomorAyat <= 4612) {
    return 'Al-Fath';
  } else if (nomorAyat >= 4613 && nomorAyat <= 4630) {
    return 'Al-Hujurat';
  } else if (nomorAyat >= 4631 && nomorAyat <= 4675) {
    return 'Qaf';
  } else if (nomorAyat >= 4676 && nomorAyat <= 4735) {
    return 'Az-Zariyat';
  } else if (nomorAyat >= 4736 && nomorAyat <= 4784) {
    return 'At-Tur';
  } else if (nomorAyat >= 4785 && nomorAyat <= 4846) {
    return 'An-Najm';
  } else if (nomorAyat >= 4847 && nomorAyat <= 4901) {
    return 'Al-Qamar';
  } else if (nomorAyat >= 4902 && nomorAyat <= 4979) {
    return 'Ar-Rahman';
  } else if (nomorAyat >= 4980 && nomorAyat <= 5075) {
    return 'Al-Waqi\'ah';
  } else if (nomorAyat >= 5076 && nomorAyat <= 5104) {
    return 'Al-Hadid';
  } else if (nomorAyat >= 5105 && nomorAyat <= 5126) {
    return 'Al-Mujadilah';
  } else if (nomorAyat >= 5127 && nomorAyat <= 5150) {
    return 'Al-Hasyr';
  } else if (nomorAyat >= 5151 && nomorAyat <= 5163) {
    return 'Al-Mumtahanah';
  } else if (nomorAyat >= 5164 && nomorAyat <= 5177) {
    return 'As-Saff';
  } else if (nomorAyat >= 5178 && nomorAyat <= 5188) {
    return 'Al-Jumu\'ah';
  } else if (nomorAyat >= 5189 && nomorAyat <= 5199) {
    return 'Al-Munafiqun';
  } else if (nomorAyat >= 5200 && nomorAyat <= 5217) {
    return 'At-Tagabun';
  } else if (nomorAyat >= 5218 && nomorAyat <= 5229) {
    return 'At-Talaq';
  } else if (nomorAyat >= 5230 && nomorAyat <= 5241) {
    return 'At-Tahrim';
  } else if (nomorAyat >= 5242 && nomorAyat <= 5271) {
    return 'Al-Mulk';
  } else if (nomorAyat >= 5272 && nomorAyat <= 5323) {
    return 'Al-Qalam';
  } else if (nomorAyat >= 5324 && nomorAyat <= 5375) {
    return 'Al-Haqqah';
  } else if (nomorAyat >= 5376 && nomorAyat <= 5419) {
    return 'Al-Ma\'arij';
  } else if (nomorAyat >= 5420 && nomorAyat <= 5447) {
    return 'Nuh';
  } else if (nomorAyat >= 5448 && nomorAyat <= 5475) {
    return 'Al-Jinn';
  } else if (nomorAyat >= 5476 && nomorAyat <= 5495) {
    return 'Al-Muzzammil';
  } else if (nomorAyat >= 5496 && nomorAyat <= 5551) {
    return 'Al-Muddassir';
  } else if (nomorAyat >= 5552 && nomorAyat <= 5591) {
    return 'Al-Qiyamah';
  } else if (nomorAyat >= 5592 && nomorAyat <= 5622) {
    return 'Al-Insan';
  } else if (nomorAyat >= 5623 && nomorAyat <= 5672) {
    return 'Al-Mursalat';
  } else if (nomorAyat >= 5673 && nomorAyat <= 5712) {
    return 'An-Naba\'';
  } else if (nomorAyat >= 5713 && nomorAyat <= 5758) {
    return 'An-Nazi\'at';
  } else if (nomorAyat >= 5759 && nomorAyat <= 5800) {
    return '\'Abasa';
  } else if (nomorAyat >= 5801 && nomorAyat <= 5829) {
    return 'At-Takwir';
  } else if (nomorAyat >= 5830 && nomorAyat <= 5848) {
    return 'Al-Infitar';
  } else if (nomorAyat >= 5849 && nomorAyat <= 5884) {
    return 'Al-Mutaffifin';
  } else if (nomorAyat >= 5885 && nomorAyat <= 5909) {
    return 'Al-Insyiqaq';
  } else if (nomorAyat >= 5910 && nomorAyat <= 5931) {
    return 'Al-Buruj';
  } else if (nomorAyat >= 5932 && nomorAyat <= 5948) {
    return 'At-Tariq';
  } else if (nomorAyat >= 5949 && nomorAyat <= 5967) {
    return 'Al-A\'la';
  } else if (nomorAyat >= 5968 && nomorAyat <= 5993) {
    return 'Al-Gasyiyah';
  } else if (nomorAyat >= 5994 && nomorAyat <= 6023) {
    return 'Al-Fajr';
  } else if (nomorAyat >= 6024 && nomorAyat <= 6043) {
    return 'Al-Balad';
  } else if (nomorAyat >= 6044 && nomorAyat <= 6058) {
    return 'Asy-Syams';
  } else if (nomorAyat >= 6059 && nomorAyat <= 6079) {
    return 'Al-Lail';
  } else if (nomorAyat >= 6080 && nomorAyat <= 6090) {
    return 'Ad-Duha';
  } else if (nomorAyat >= 6091 && nomorAyat <= 6098) {
    return 'Al-Insyirah';
  } else if (nomorAyat >= 6099 && nomorAyat <= 6106) {
    return 'At-Tin';
  } else if (nomorAyat >= 6107 && nomorAyat <= 6125) {
    return 'Al-\'Alaq';
  } else if (nomorAyat >= 6126 && nomorAyat <= 6130) {
    return 'Al-Qadr';
  } else if (nomorAyat >= 6131 && nomorAyat <= 6138) {
    return 'Al-Bayyinah';
  } else if (nomorAyat >= 6139 && nomorAyat <= 6146) {
    return 'Az-Zalzalah';
  } else if (nomorAyat >= 6147 && nomorAyat <= 6157) {
    return 'Al-\'Adiyat';
  } else if (nomorAyat >= 6158 && nomorAyat <= 6168) {
    return 'Al-Qari\'ah';
  } else if (nomorAyat >= 6169 && nomorAyat <= 6176) {
    return 'At-Takasur';
  } else if (nomorAyat >= 6177 && nomorAyat <= 6179) {
    return 'Al-\'Asr';
  } else if (nomorAyat >= 6180 && nomorAyat <= 6188) {
    return 'Al-Humazah';
  } else if (nomorAyat >= 6189 && nomorAyat <= 6193) {
    return 'Al-Fil';
  } else if (nomorAyat >= 6194 && nomorAyat <= 6197) {
    return 'Quraisy';
  } else if (nomorAyat >= 6198 && nomorAyat <= 6204) {
    return 'Al-Ma\'un';
  } else if (nomorAyat >= 6198 && nomorAyat <= 6207) {
    return 'Al-Kausar';
  } else if (nomorAyat >= 6208 && nomorAyat <= 6213) {
    return 'Al-Kafirun';
  } else if (nomorAyat >= 6214 && nomorAyat <= 6216) {
    return 'An-Nasr';
  } else if (nomorAyat >= 6217 && nomorAyat <= 6221) {
    return 'Al-Lahab';
  } else if (nomorAyat >= 6222 && nomorAyat <= 6225) {
    return 'Al-Ikhlas';
  } else if (nomorAyat >= 6226 && nomorAyat <= 6230) {
    return 'Al-Falaq';
  } else {
    return 'An-Nas';
  }
}
