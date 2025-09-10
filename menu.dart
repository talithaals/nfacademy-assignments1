List<Map<String, dynamic>> dataPegawai = [
  {'id': 22025002, 'nama': 'Anda Andi', 'jabatan': 'Staff', 'gaji': 4500000},
  {'id': 22005001, 'nama': 'Budi Beda', 'jabatan': 'Manager', 'gaji': 8000000},
  {
    'id': 22003003,
    'nama': 'Chaca Ceria',
    'jabatan': 'Supervisor',
    'gaji': 6000000,
  },
  {'id': 12025003, 'nama': 'Dana Dia', 'jabatan': 'Intern', 'gaji': 4500000},
  {'id': 32025001, 'nama': 'Era Emas', 'jabatan': 'Staff', 'gaji': 4500000},
  {'id': 12010001, 'nama': 'Festa Fora', 'jabatan': 'Manager', 'gaji': 8000000},
  {
    'id': 12025002,
    'nama': 'Guna Galah',
    'jabatan': 'Supervisor',
    'gaji': 6000000,
  },
];

void menuUtama() {
  print('==== Selamat Datang di Sistem Manajemen Data Pegawai ====');
  print('0. Edit Data Pegawai (Login Required)');
  print('1. Lihat Data Pegawai');
  print('2. Cari Data Pegawai');
  print('3. Gaji, Bonus, dan Tunjangan Pegawai');
  print('4. Keluar');
  print('');
}

void headlineData() {
  print('==== Data Pegawai ====');
  print('NO. ID PEGAWAI ; NAMA PEGAWAI ; JABATAN ; GAJI');
}

void formTambahPegawai1() {
  print('==== Data Pegawai Baru ====');

  print(
    '''!! Pastikan Format ID Sebagai Berikut !!
    1. Digit pertama merupakan kode departemen (contoh: 1 untuk HR, 2 untuk IT, 3 untuk Finance).
    2. Empat digit kedua merupakan tahun masuk pegawai.
    3. Tiga digit terakhir merupakan nomor urut pegawai yang masuk pada tahun tersebut.''',
  );
}

void lihatPegawai1() {
  print('==== Menu Tampilan Data Pegawai ====');
  print('0. Tampilkan Data Pegawai (dengan for loop)');
  print('1. Tampilkan Data Pegawai (dengan while loop)');
  print('2. Tampilkan Data Pegawai (dengan do-while loop)');
  print('');
}

void lihatLagiAtauUrutkan1() {
  print('==== Menu Tampilan Data Pegawai ====');
  print('0. Urutkan Data Pegawai Berdasarkan ID (Ascending)');
  print('1. Urutkan Data Pegawai Berdasarkan ID (Descending)');
  print('2. Tampilkan Data Pegawai dengan ID Ganjil');
  print('3. Tampilkan Data Pegawai dengan ID Genap');
  print('4. Kembali ke Opsi Tampilan Pegawai');
  print('5. Kembali ke Menu Utama');
  print('6. Keluar');
  print('');
}

void menuCariPegawai1() {
  print('==== Menu Pencarian Data Pegawai ====');
  print('0. Cari Berdasarkan ID Pegawai');
  print('1. Cari Berdasarkan Nama Pegawai');
  print('2. Cari Berdasarkan Jabatan Pegawai');
  print('3. Cari Berdasarkan Gaji Pegawai');
  print('');
}

void cariLagi() {
  print('==== Menu Pencarian Data Pegawai ====');
  print('0. Cari Data Pegawai Lain');
  print('1. Kembali ke Menu Utama');
  print('2. Keluar');
  print('');
}

void menuAkhir() {
  print('==== Menu Akhir ====');
  print('0. Kembali ke Menu Utama');
  print('1. Keluar');
  print('');
}

void gajiDanBonus() {
  print('==== Menu Kalkulasi Gaji, Bonus, dan Tunjangan ====');
  print('0. Hitung Total Gaji Pegawai');
  print('1. Hitung Tunjangan Pegawai');
  print('2. Hitung Bonus Tahunan Pegawai');
  print('3. Hitung Gaji Bersih Pegawai');
  print('4. Kembali ke Menu Utama');
  print('5. Keluar');
  print('');
}