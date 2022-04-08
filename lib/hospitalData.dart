// ignore_for_file: file_names

import 'hospital.dart';

List<Hospital> hospitals = [
  //1
  Hospital(
      'MANA Pet Hospital',
      'assets/h1.jpg',
      '100 117 Phutthamonthon Sai 2 Soi 24, Sala Thammasop, Thawi Watthana, Bangkok 10170',
      '9.00',
      '21.00',
      '092 564 7994',
      '13.7738923',
      '100.4019061'),
  //2
  Hospital(
      'Oasis Animal Hospital',
      'assets/h2.jpg',
      '88 ถนน วัดอินทราวาส Bang Ramat, Taling Chan, Bangkok 10170',
      '0.00',
      '24.00',
      '02 443 3944',
      '13.7580071',
      '100.4349953'),
  //3
  Hospital(
      'Nakarin Veterinary Hospital',
      'assets/h3.jpg',
      '2363 Phatthanakan 49 Alley, Suan Luang, Bangkok 10250',
      '9.00',
      '20.00',
      '084 131 1211',
      '13.7363996',
      '100.6374841'),
  //4
  Hospital(
      'Vet 4 Animal Hospital (Sukumvit)',
      'assets/h4.jpg',
      'Sukhumvit 33 Alley, Khlong Tan Nuea, Watthana, Bangkok 10110',
      '0.00',
      '24.00',
      '02 119 4571',
      '13.7374915',
      '100.5655086'),
  //5
  Hospital(
      'Pattanawech Animal Hospital',
      'assets/h5.jpg',
      '537/33 ซอย สุขุมวิท Phra Khanong Nuea, Watthana, Bangkok 10110',
      '10.30',
      '20.00',
      '02 381 6502',
      '13.7264581',
      '100.5935957'),
  //6
  Hospital(
      'Sukhumvit Veterinarians',
      'assets/h6.jpg',
      '10 Chong Lom Alley, Klongton-nua Watthana, Bangkok 10110',
      '8.00',
      '21.00',
      '092 710 1551',
      '13.7263523',
      '100.5744762'),
  //7
  Hospital(
      'I-Pet Hospital',
      'assets/h7.jpg',
      'ตรงข้ามซอยรพ. กล้วยน้ำไท 4384/1-3 ริม, Rama IV Rd, พระโขนง',
      '9.00',
      '20.00',
      '081 903 3390',
      '13.712639',
      '100.5857481'),
  //8
  Hospital(
      'Thonglor International Pet Hospital Rama9',
      'assets/h8.jpg',
      '180 Thanon Phet Phra Ram, Bang Kapi, Huai Khwang, Bangkok 10310',
      '0.00',
      '24.00',
      '02 079 9999',
      '13.7476651',
      '100.5969309'),
  //9
  Hospital(
      'Charoensuk Animal Hospital (CAH)',
      'assets/h9.jpg',
      '167 Soi Ekkamai 5, Khlong Tan Nuea, Watthana, Bangkok 10110',
      '0.00',
      '24.00',
      '02 391 9707',
      '13.7314004',
      '100.5832868'),
  //10
  Hospital(
      'Thonglor Pet Hospital',
      'assets/h10.jpg',
      '205/19-20 ซอยทองหล่อ ระหว่างซอย 9 กับ11 Khlong Tan Nuea, Watthana, Bangkok 10110',
      '8.00',
      '20.00',
      '02 712 6119',
      '13.7317748',
      '100.5725121'),
  //11
  Hospital(
      'โรงพยาบาลสัตว์ เพ็ทไดเร็ค (ทองหล่อ 20)',
      'assets/h11.jpg',
      '946/10-12 ซอย ทองหล่อ 20 ถนน สุขุมวิท 55 ถนน สุขุมวิท Khlong Tan Nuea, Watthana, Bangkok 10110',
      '0.00',
      '24.00',
      '02 714 7544',
      '13.7394024',
      '100.5831182'),
  //12
  Hospital(
      'Animal Hospital Bangkok - Ratchada',
      'assets/h12.jpg',
      '279, 8 Sutthisan Winitchai Rd, Samsen Nok, Huai Khwang, Bangkok 10310',
      '0.00',
      '24.00',
      '02 004 7889',
      '13.7894576',
      '100.5831884'),
  //13
  Hospital(
      'โรงพยาบาลสัตว์ กรุงเทพ-นครินทร์',
      'assets/h13.jpg',
      '1105 Srinagarindra Rd, Khwaeng Suan Luang, Suan Luang, Bangkok 10250',
      '9.00',
      '21.00',
      '098 878 3663',
      '13.7049461',
      '100.6436192'),
  //14
  Hospital(
      'Sriwara Animal Hospital',
      'assets/h14.jpg',
      'Soi Panchamit, พลับพลา วังทองหลาง Bangkok 10310',
      '0.00',
      '24.00',
      '02 530 7636',
      '13.7687794',
      '100.6040451'),
  //15
  Hospital(
      'โรงพยาบาลสัตว์ทองหล่อ สาทร-นราธิวาส',
      'assets/h15.jpg',
      '130/144 ถนน นราธิวาสราชนครินทร์ เขต, Thung Wat Don, Sathon, Bangkok 10120',
      '0.00',
      '24.00',
      '02 079 9909',
      '13.7108784',
      '100.5331112'),
  //16
  Hospital(
      'โรงพยาบาลสัตว์ตลิ่งชัน',
      'assets/h16.jpg',
      '1 ซอย บรมราชชนนี 61 Chim Phli, Taling Chan, Bangkok 10170',
      '0.00',
      '24.00',
      '02 887 8322',
      '13.7793934',
      '100.4421054'),
  //17
  Hospital(
      'โรงพยาบาลสัตว์ ทองหล่อ ประดิษฐ์มนูธรรม',
      'assets/h17.jpg',
      '738 Pradit Manutham Road, Khlong Chaokhunsing, Wang Thonglang, Bangkok 10310',
      '0.00',
      '24.00',
      '02 079 9955',
      '13.7965744',
      '100.6116451'),
  //18
  Hospital(
      'Phundhaphat Pet Hospital',
      'assets/h18.jpg',
      '603 Sukhumvit 101/1 Rd, Bang Chak, Phra Khanong, Bangkok 10260',
      '9.00',
      '20.00',
      '02 728 3699',
      '13.6847536',
      '100.623243'),
  //19
  Hospital(
      'Jusco Ratchada Animal Hospital',
      'assets/h19.jpg',
      '160 Ratchadaphisek Rd, Khwaeng Huai Khwang, Huai Khwang, Bangkok 10310',
      '9.00',
      '21.00',
      '02 530 7636',
      '13.7722765',
      '100.5714219'),
  //20
  Hospital(
      'Mahasin Vet Hospital',
      'assets/h20.jpg',
      '954/ 2 101/1 ซอย สุขุมวิท Bang Chak, Phra Khanong, Bangkok 10260',
      '0.00',
      '24.00',
      '02 747 7181',
      '13.6842817',
      '100.6193498'),
  //21
  Hospital(
      'Phyathai 7 Animal Hospital',
      'assets/h21.jpg',
      '9, 9 Chamnan Akson Alley, Khwaeng Samsen Nai, Phaya Thai, Bangkok 10400',
      '0.00',
      '24.00',
      '02 619 5782',
      '13.7850345',
      '100.5424007'),
  //22
  Hospital(
      'Phatthanakan Veterinary Hospital',
      'assets/h22.jpg',
      '74/10 (198) ซอย พัฒนาการ 30 (เข้าซอย300เมตร Phatthanakan Rd, Suan Luang, Bangkok 10250',
      '9.30',
      '20.30',
      '02 319 2360',
      '13.7334895',
      '100.6171571'),
  //23
  Hospital(
      'Veterinary Hospital Ramkamhang 60',
      'assets/h23.jpg',
      '16 16/1 Ramkhamhaeng Rd, Hua Mak, Bang Kapi District, Bangkok 10240',
      '8.00',
      '20.00',
      '02 735 3622',
      '13.7590607',
      '100.6476175'),
  //24
  Hospital(
      'โรงพยาบาลสัตว์ มีสุข (ถ.พระราม 3)',
      'assets/h24.jpg',
      '1045 Rama III Rd, Chong Nonsi, Yan Nawa, Bangkok 10120',
      '10.00',
      '22.00',
      '02 681 8118',
      '13.6880583',
      '100.5452339'),
  //25
  Hospital(
      'Peaceful Animal Hospital Soi Bangwaek 51',
      'assets/h25.jpg',
      '1 Bang Waek Rd, Bang Waek, Phasi Charoen, Bangkok 10160',
      '10.00',
      '21.00',
      '02 865 1994',
      '13.7375621',
      '100.4416825'),
  //26
  Hospital(
      'PETClub - Ladprao 101 (happy condo)',
      'assets/h26.jpg',
      '779 Ladprao 101, Klongjaokhunsing, Wang Thonglang, Bangkok 10310',
      '10.00',
      '20.30',
      '02 736 8848',
      '13.7879712',
      '100.625744'),
  //27
  Hospital(
      'โรงพยาบาลสัตว์ คริสตัล เพ็ท',
      'assets/h27.jpg',
      '60 ซ. รามอินทรา 34 แยก 14 Tha Raeng, Bang Khen, Bangkok 10220',
      '9.00',
      '21.00',
      '02 069 0838',
      '13.8467805',
      '100.6305943'),
  //28
  Hospital(
      'Patthawikorn Animal Hospital',
      'assets/h28.jpg',
      '27 131-132 Nawamin 117 Alley, Khlong Kum, Bueng Kum, Bangkok 10230',
      '9.00',
      '21.00',
      '02 519 2546',
      '13.8133355',
      '100.6491935'),
  //29
  Hospital(
      'น้องหมาน้องแมวคลินิก',
      'assets/h29.jpg',
      '253 255 Phatthanakan 1 Alley, Suan Luang, Bangkok 10250',
      '9.00',
      '20.00',
      '088 872 7273',
      '13.7406035',
      '100.6013601'),
  //30
  Hospital(
      'Rama 4 Animal Hospital',
      'assets/h30.jpg',
      '1100, 14 Rama IV Rd, Thung Maha Mek, Sathon, Bangkok 10120',
      '9.00',
      '20.00',
      '02 671 9339',
      '13.723302',
      '100.548667'),
];
