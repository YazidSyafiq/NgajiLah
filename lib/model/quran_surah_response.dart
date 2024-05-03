// To parse this JSON data, do
//
//     final surahQuranResponse = surahQuranResponseFromJson(jsonString);

import 'dart:convert';

SurahQuranResponse surahQuranResponseFromJson(String str) =>
    SurahQuranResponse.fromJson(json.decode(str));

String surahQuranResponseToJson(SurahQuranResponse data) =>
    json.encode(data.toJson());

class SurahQuranResponse {
  int? code;
  String? message;
  List<DataSurah>? data;

  SurahQuranResponse({
    this.code,
    this.message,
    this.data,
  });

  factory SurahQuranResponse.fromJson(Map<String, dynamic> json) =>
      SurahQuranResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataSurah>.from(
                json["data"]!.map((x) => DataSurah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataSurah {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;

  DataSurah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
  });

  factory DataSurah.fromJson(Map<String, dynamic> json) => DataSurah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
