class Surah {
  bool? status;
  int? nomor;
  String? nama;
  int? jumlahAyat;
  String? namaLatin;
  String? arti;
  String? tempatTurun;
  String? deskripsi;
  String? audio;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  bool? suratSebelumnya;

  Surah({
    this.status,
    this.nomor,
    this.nama,
    this.jumlahAyat,
    this.namaLatin,
    this.arti,
    this.tempatTurun,
    this.deskripsi,
    this.audio,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  Surah.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nomor = json['nomor'];
    nama = json['nama'];
    jumlahAyat = json['jumlah_ayat'];
    namaLatin = json['nama_latin'];
    arti = json['arti'];
    tempatTurun = json['tempat_turun'];
    deskripsi = json['deskripsi'];
    audio = json['audio'];
    if (json['ayat'] != null) {
      ayat = <Ayat>[];
      json['ayat'].forEach((v) {
        ayat!.add(Ayat.fromJson(v));
      });
    }
    suratSelanjutnya = json['surat_selanjutnya'] != null
        ? SuratSelanjutnya.fromJson(json['surat_selanjutnya'])
        : null;
    suratSebelumnya = json['surat_sebelumnya'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['nomor'] = nomor;
    data['nama'] = nama;
    data['jumlah_ayat'] = jumlahAyat;
    data['nama_latin'] = namaLatin;
    data['arti'] = arti;
    data['tempat_turun'] = tempatTurun;
    data['deskripsi'] = deskripsi;
    data['audio'] = audio;
    if (ayat != null) {
      data['ayat'] = ayat!.map((v) => v.toJson()).toList();
    }
    if (suratSelanjutnya != null) {
      data['surat_selanjutnya'] = suratSelanjutnya!.toJson();
    }
    data['surat_sebelumnya'] = suratSebelumnya;
    return data;
  }
}

class Ayat {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  Ayat({this.id, this.surah, this.nomor, this.ar, this.tr, this.idn});

  Ayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'];
    nomor = json['nomor'];
    ar = json['ar'];
    tr = json['tr'];
    idn = json['idn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surah'] = surah;
    data['nomor'] = nomor;
    data['ar'] = ar;
    data['tr'] = tr;
    data['idn'] = idn;
    return data;
  }
}

class SuratSelanjutnya {
  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  SuratSelanjutnya(
      {this.id,
      this.nomor,
      this.nama,
      this.namaLatin,
      this.jumlahAyat,
      this.tempatTurun,
      this.arti,
      this.deskripsi,
      this.audio});

  SuratSelanjutnya.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    nama = json['nama'];
    namaLatin = json['nama_latin'];
    jumlahAyat = json['jumlah_ayat'];
    tempatTurun = json['tempat_turun'];
    arti = json['arti'];
    deskripsi = json['deskripsi'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nomor'] = nomor;
    data['nama'] = nama;
    data['nama_latin'] = namaLatin;
    data['jumlah_ayat'] = jumlahAyat;
    data['tempat_turun'] = tempatTurun;
    data['arti'] = arti;
    data['deskripsi'] = deskripsi;
    data['audio'] = audio;
    return data;
  }
}
