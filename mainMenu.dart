import 'dart:io';
import 'menu.dart';
import 'addPegawai.dart';
import 'viewPegawai.dart';
import 'searchPegawai.dart';
import 'calcGajiPegawai.dart';

void menuUtamaSelect() {
  menuUtama();
  stdout.write('Pilih opsi (0-4) : ');
  String pilihan = stdin.readLineSync()!;
  print('');
  switch (pilihan) {
    case '0':
      login();
      break;
    case '1':
      lihatPegawai3();
      break;
    case '2':
      menuCariPegawai2();
      break;
    case '3':
      totalGajiBonus();
    case '4':
      print('Terima kasih telah menggunakan program ini.');
      return;
    default:
      print('Opsi tidak valid. Silahkan coba lagi.');
      menuUtamaSelect();
      break;
  }
  print('');
}

void menuAkhirSelect() {
  menuAkhir();
  print('');
  stdout.write('Pilih Opsi (0-1) : ');
  String opsiAkhir = stdin.readLineSync()!;
  print('');
  if (opsiAkhir == '0') {
    menuUtamaSelect();
  } else if (opsiAkhir == '1') {
    print('Terima kasih telah menggunakan program ini.');
  } else {
    print('Opsi tidak valid. Silahkan coba lagi.');
    menuAkhirSelect();
  }
}
