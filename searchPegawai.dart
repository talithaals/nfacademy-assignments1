import 'dart:io';
import 'menu.dart';
import 'mainMenu.dart';

void cariPegawaiIdGaji() {
  stdout.write('Masukkan ID / Gaji Pegawai yang ingin dicari : ');
  String keywordString = stdin.readLineSync()!;
  int keyword = int.tryParse(keywordString)!;
  print('');

  List<Map<String, dynamic>> hasilPencarian = dataPegawai.where((pegawai) {
    return pegawai['id'] == keyword ||
        pegawai['gaji'] == keyword;
  }).toList();
  if (hasilPencarian.isEmpty) {
    print('Data pegawai dengan keyword "$keyword" tidak ditemukan.');
  } else {
    print('');
    print('==== Hasil Pencarian ====');
    print('ID PEGAWAI ; NAMA PEGAWAI ; JABATAN ; GAJI');
    print('');
    hasilPencarian.forEach((pegawai) {
      stdout.write('${pegawai['id']} ; ');
      stdout.write('${pegawai['nama']} ; ');
      stdout.write('${pegawai['jabatan']} ; ');
      stdout.write('Rp. ${pegawai['gaji']}');
      print('');
    });
  }
  print('');
}

void cariPegawaiNamaJabatan() {
  stdout.write('Masukkan Nama / Jabatan Pegawai yang ingin dicari : ');
  String keyword = stdin.readLineSync()!;
  print('');
  List<Map<String, dynamic>> hasilPencarian = dataPegawai.where((pegawai) {
    return pegawai['nama'] == keyword ||
        pegawai['jabatan'] == keyword;
  }).toList();
  if (hasilPencarian.isEmpty) {
    print('Data pegawai dengan keyword "$keyword" tidak ditemukan.');
  } else {
    print('==== Hasil Pencarian ====');
    print('ID PEGAWAI ; NAMA PEGAWAI ; JABATAN ; GAJI');
    print('');
    for (var pegawai in hasilPencarian) {
      stdout.write('${pegawai['id']} ; ');
      stdout.write('${pegawai['nama']} ; ');
      stdout.write('${pegawai['jabatan']} ; ');
      stdout.write('Rp. ${pegawai['gaji']}');
      print('');
    }
  }
  print('');
}

void menuCariPegawai2() {
  menuCariPegawai1();
  stdout.write('Pilih Opsi (0-3) : ');
  String opsiSearch = stdin.readLineSync()!;
  print('');

  if (opsiSearch == '0') {
    cariPegawaiIdGaji();
  } else if (opsiSearch == '1') {
    cariPegawaiNamaJabatan();
  } else if (opsiSearch == '2') {
    cariPegawaiNamaJabatan();
  } else if (opsiSearch == '3') {
    cariPegawaiIdGaji();
  }
  print('');
  cariLagi2();
}

void cariLagi2() {
  cariLagi();
  stdout.write('Pilih Opsi (0-2) : ');
  String opsiCariLagi = stdin.readLineSync()!;
  print('');
  if (opsiCariLagi == '0') {
    menuCariPegawai2();
  } else if (opsiCariLagi == '1') {
    menuUtamaSelect();
  } else if (opsiCariLagi == '2') {
    print('Terima kasih telah menggunakan program ini.');
  } else {
    print('Opsi tidak valid. Silahkan coba lagi.');
    cariLagi2();
  }
}