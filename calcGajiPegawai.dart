import 'dart:io';
import 'menu.dart';
import 'mainMenu.dart';

int hitungTotalGaji(List<Map<String, dynamic>> dataPegawai) {
  int totalGaji = 0;

  for (var pegawai in dataPegawai) {
    var gaji = pegawai['gaji'];
    int gajiInt = 0;

    if (gaji is int) {
      gajiInt = gaji;
    } else if (gaji is String) {
      gajiInt = int.parse(gaji);
    }
    totalGaji = totalGaji + gajiInt;
  }

  return totalGaji;
}

int hitungTunjangan(String jabatan) {
  int tunjangan = 0;

  switch (jabatan) {
    case 'Manager':
      tunjangan = 2000000;
      break;
    case 'Supervisor':
      tunjangan = 1500000;
      break;
    case 'Staff':
      tunjangan = 1000000;
      break;
    default:
      tunjangan = 0;
  }
  return tunjangan;
}

int hitungBonusTahunan(int tahunKerja) {
  if (tahunKerja <= 0) {
    return 0;
  }
  if (tahunKerja > 5) {
    return hitungBonusTahunan(5);
  }
  return 500000 + hitungBonusTahunan(tahunKerja - 1);
}

double hitungGajiBersih(int gajiPokok) => gajiPokok * 0.90;

void gajiDanTunjangan(
  Map<String, dynamic> pegawai, [
  bool formatRupiah = true,
]) {
  int gajiPokok = 0;
  var gajiPegawai = pegawai['gaji'];
  if (gajiPegawai is int) {
    gajiPokok = gajiPegawai;
  } else if (gajiPegawai is String) {
    gajiPokok = int.parse(gajiPegawai);
  }

  int tunjangan = hitungTunjangan(pegawai['jabatan']);
  int total = gajiPokok + tunjangan;

  if (formatRupiah) {
    print('==== Hasil Pencarian ====');
    print('Nama : ${pegawai['nama']}');
    print('Jabatan : ${pegawai['jabatan']}');
    print('Total Gaji : Rp. $total');
    print('Rincian : ');
    print('Gaji Pokok = Rp. $gajiPokok');
    print('Tunjangan = Rp. $tunjangan');
    print('');
  }
}

void totalGajiBonus() {
  gajiDanBonus();
  stdout.write('Pilih Opsi (0-5) : ');
  String opsiHitung = stdin.readLineSync()!;
  print('');
  if (opsiHitung == '0') {
    int totalGajiPegawai = hitungTotalGaji(dataPegawai);
    print('Total Gaji Pegawai : Rp. $totalGajiPegawai');
    print('');
    totalGajiBonus();
  } else if (opsiHitung == '1') {
    stdout.write('Masukkan ID Pegawai : ');
    String idInputSring = stdin.readLineSync()!;
    int idInput = int.parse(idInputSring);
    print('');

    List<Map<String, dynamic>> hasilPencarian = dataPegawai
        .where((pegawai) => pegawai['id'] == idInput)
        .toList();

    if (hasilPencarian.isEmpty) {
      print('Data pegawai dengan keyword "$idInput" tidak ditemukan.');
    } else {
      Map<String, dynamic> pegawaiDitemukan = hasilPencarian.first;

      gajiDanTunjangan(pegawaiDitemukan);
    }
    print('');
    totalGajiBonus();
  } else if (opsiHitung == '2') {
    stdout.write('Masukkan ID Pegawai : ');
    String idInputSring = stdin.readLineSync()!;
    int idInput = int.parse(idInputSring);
    print('');

    var hasilCari = dataPegawai
        .where((pegawai) => pegawai['id'] == idInput)
        .toList();
    if (hasilCari.isEmpty) {
      print('Data pegawai dengan keyword "$idInput" tidak ditemukan.');
    } else {
      int tahunMasuk = int.parse(
        hasilCari.first['id'].toString().substring(1, 5),
      );
      int tahunSekarang = 2025;
      int masaKerja = tahunSekarang - tahunMasuk;

      int bonusTahunan = hitungBonusTahunan(masaKerja);
      print('==== Hasil Pencarian ====');
      print('Nama : ${hasilCari.first['nama']}');
      print('Masa Kerja : $masaKerja tahun');
      print('Bonus Tahunan : Rp. $bonusTahunan');
    }
    print('');
    totalGajiBonus();
  } else if (opsiHitung == '3') {
    stdout.write('Masukkan ID Pegawai : ');
    String idInputSring = stdin.readLineSync()!;
    int idInput = int.parse(idInputSring);
    print('');

    var hasilCari = dataPegawai
        .where((pegawai) => pegawai['id'] == idInput)
        .toList();
    if (hasilCari.isEmpty) {
      print('Data pegawai dengan keyword "$idInput" tidak ditemukan.');
    } else {
      int gajiPokok = 0;
      var gajiInt = hasilCari.first['gaji'];
      if (gajiInt is int) {
        gajiPokok = gajiInt;
      } else if (gajiInt is String) {
        gajiPokok = int.parse(gajiInt);
      }

      double gajiBersihPajak = hitungGajiBersih(gajiPokok);
      print('==== Hasil Pencarian ====');
      print('Nama : ${hasilCari.first['nama']}');
      print('Gaji Pokok : Rp. $gajiPokok');
      print('Gaji Bersih : Rp. $gajiBersihPajak');
    }
    print('');
    totalGajiBonus();
  } else if (opsiHitung == '4') {
    menuUtamaSelect();
  } else if (opsiHitung == '5') {
    print('Terima kasih telah menggunakan program ini.');
  } else {
    print('Opsi tidak valid. Silahkan coba lagi.');
    menuAkhirSelect();
  }
}