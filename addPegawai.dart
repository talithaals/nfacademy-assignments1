import 'dart:io';
import 'menu.dart';
import 'mainMenu.dart';
import 'viewPegawai.dart';

void login() {
  String usernameAdmin = 'adminonly';
  String passwordAdmin = 'benar123';
  int percobaanLogin = 0;
  int maxPercobaan = 3;
  bool loginBerhasil = false;

  while (percobaanLogin < maxPercobaan && !loginBerhasil) {
    stdout.write('Masukkan Username : ');
    String username = stdin.readLineSync()!;
    stdout.write('Masukkan password anda : ');
    String password = stdin.readLineSync()!;

    if (username == usernameAdmin && password == passwordAdmin) {
      print('Login Berhasil! Anda dapat mengedit data pegawai di database');
      loginBerhasil = true;
    } else {
      percobaanLogin++;
      print('''Login Gagal! Silahkan coba lagi.
        Percobaan login ke-$percobaanLogin dari $maxPercobaan percobaan.''');

      if (percobaanLogin == maxPercobaan) {
        print(
          'Anda telah mencapai batas maksimum percobaan login. Program akan kembali ke menu utama',
        );
        return;
      }
    }
  }
  if (loginBerhasil) {
    formTambahPegawai2();
  } else {
    menuUtama();
  }
}

void formTambahPegawai2() {
  String lanjutInput;

  do {
    formTambahPegawai1();
    stdout.write('ID Pegawai : ');
    String idPegawaiString = stdin.readLineSync()!;
    int idPegawai = int.tryParse(idPegawaiString)!;

    stdout.write('Nama Pegawai : ');
    String namaPegawai = stdin.readLineSync()!;

    stdout.write('Jabatan : ');
    String jabatanPegawai = stdin.readLineSync()!;

    stdout.write('Gaji : ');
    String gajiPegawaiString = stdin.readLineSync()!;
    int gajiPegawai = int.tryParse(gajiPegawaiString)!;

    Map<String, dynamic> pegawaiBaru = {
      'id': idPegawai,
      'nama': namaPegawai,
      'jabatan': jabatanPegawai,
      'gaji': gajiPegawai,
    };

    dataPegawai.add(pegawaiBaru);

    print('Data Pegawai Baru Berhasil Ditambahkan!');
    print('Jumlah Pegawai Saat Ini : ${dataPegawai.length}');

    stdout.write('Apakah anda ingin menambahkan data pegawai lagi? (y/n) : ');
    lanjutInput = stdin.readLineSync()!;
  } while (lanjutInput == 'y' || lanjutInput == 'Y');
  print('');
  lihatPegawaiFor();
  print('');
  menuAkhirSelect();
}