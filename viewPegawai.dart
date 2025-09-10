import 'dart:io';
import 'menu.dart';
import 'mainMenu.dart';

void lihatPegawaiFor() {
  headlineData();
  for (int i = 0; i < dataPegawai.length; i++) {
    stdout.write('${i + 1}. ');
    stdout.write('${dataPegawai[i]['id']} ; ');
    stdout.write('${dataPegawai[i]['nama']} ; ');
    stdout.write('${dataPegawai[i]['jabatan']} ; ');
    stdout.write('Rp. ${dataPegawai[i]['gaji']}');
    print('');
  }
  print('');
  print('Total Pegawai : ${dataPegawai.length}');
  print('');
}

void lihatPegawaiWhile() {
  headlineData();
  int i = 0;
  while (i < dataPegawai.length) {
    stdout.write('${i + 1}. ');
    stdout.write('${dataPegawai[i]['id']} ; ');
    stdout.write('${dataPegawai[i]['nama']} ; ');
    stdout.write('${dataPegawai[i]['jabatan']} ;');
    stdout.write('Rp. ${dataPegawai[i]['gaji']}');
    print('');
    i++;
  }
  print('');
  print('Total Pegawai : ${dataPegawai.length}');
}

void lihatPegawaiDoWhile() {
  headlineData();
  int i = 0;
  do {
    stdout.write('${i + 1}. ');
    stdout.write('${dataPegawai[i]['id']} ; ');
    stdout.write('${dataPegawai[i]['nama']} ; ');
    stdout.write('${dataPegawai[i]['jabatan']} ;');
    stdout.write('Rp. ${dataPegawai[i]['gaji']}');
    print('');
    i++;
  } while (i < dataPegawai.length);
  print('');
  print('Total Pegawai : ${dataPegawai.length}');
}

void lihatPegawai2() {
  if (dataPegawai.isEmpty) {
    headlineData();
    print(
      'Data pegawai kosong. Silahkan tambahkan data pegawai terlebih dahulu',
    );
    print('');
  }
}

void lihatPegawai3() {
  lihatPegawai1();
  stdout.write('Pilih Opsi (0-2) : ');
  String opsiLoop = stdin.readLineSync()!;
  print('');
  lihatPegawai2();

  if (dataPegawai.isNotEmpty) {
    if (opsiLoop == '0') {
      lihatPegawaiFor();
    } else if (opsiLoop == '1') {
      lihatPegawaiWhile();
    } else if (opsiLoop == '2') {
      lihatPegawaiDoWhile();
    }
  }
  print('');
  lihatLagiAtauUrutkan2();
}

void lihatLagiAtauUrutkan2() {
  lihatLagiAtauUrutkan1();
  stdout.write('Pilih Opsi (0-6) : ');
  String opsiUrutkan = stdin.readLineSync()!;
  print('');

  if (opsiUrutkan == '0') {
    dataPegawai.sort((a, b) => a['id'].compareTo(b['id']));
    lihatPegawaiFor();
    lihatLagiAtauUrutkan2();
  } else if (opsiUrutkan == '1') {
    dataPegawai.sort((a, b) => b['id'].compareTo(a['id']));
    lihatPegawaiFor();
    lihatLagiAtauUrutkan2();
  } else if (opsiUrutkan == '2') {
    var sortGanjil = dataPegawai.where((pegawai) {
      return pegawai['id'] % 2 != 0;
    }).toList();

    headlineData();
    int i = 0;
    while (i < sortGanjil.length) {
      stdout.write('${i + 1}. ');
      stdout.write('${sortGanjil[i]['id']} ; ');
      stdout.write('${sortGanjil[i]['nama']} ; ');
      stdout.write('${sortGanjil[i]['jabatan']} ;');
      stdout.write('Rp. ${sortGanjil[i]['gaji']}');
      print('');
      i++;
    }
    print('');
    print('Total Pegawai : ${sortGanjil.length}');
    print('');
    lihatLagiAtauUrutkan2();
  } else if (opsiUrutkan == '3') {
    var sortGenap = dataPegawai.where((pegawai) {
      return pegawai['id'] % 2 == 0;
    }).toList();

    headlineData();
    int i = 0;
    while (i < sortGenap.length) {
      stdout.write('${i + 1}. ');
      stdout.write('${sortGenap[i]['id']} ; ');
      stdout.write('${sortGenap[i]['nama']} ; ');
      stdout.write('${sortGenap[i]['jabatan']} ;');
      stdout.write('Rp. ${sortGenap[i]['gaji']}');
      print('');
      i++;
    }
    print('');
    print('Total Pegawai : ${sortGenap.length}');
    print('');
    lihatLagiAtauUrutkan2();
  } else if (opsiUrutkan == '4') {
    lihatPegawai3();
  } else if (opsiUrutkan == '5') {
    menuUtamaSelect();
  } else if (opsiUrutkan == '6') {
    print('Terima kasih telah menggunakan program ini.');
    return;
  } else {
    print('Opsi tidak valid. Silahkan coba lagi.');
    lihatLagiAtauUrutkan2();
  }
}