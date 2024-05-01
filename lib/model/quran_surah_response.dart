// To parse this JSON data, do
//
//     final surahQuranResponse = surahQuranResponseFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

SurahQuranResponse surahQuranResponseFromJson(String str) =>
    SurahQuranResponse.fromJson(json.decode(str));

String surahQuranResponseToJson(SurahQuranResponse data) =>
    json.encode(data.toJson());

class SurahQuranResponse {
  bool? status;
  Request? request;
  List<DataSurah>? data;

  SurahQuranResponse({
    this.status,
    this.request,
    this.data,
  });

  factory SurahQuranResponse.fromJson(Map<String, dynamic> json) =>
      SurahQuranResponse(
        status: json["status"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        data: json["data"] == null
            ? []
            : List<DataSurah>.from(
                json["data"]!.map((x) => DataSurah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataSurah {
  String? audioUrl;
  String? nameEn;
  String? nameId;
  String? nameLong;
  String? nameShort;
  String? number;
  String? numberOfVerses;
  String? revelation;
  String? revelationEn;
  String? revelationId;
  String? sequence;
  String? tafsir;
  String? translationEn;
  String? translationId;

  DataSurah({
    this.audioUrl,
    this.nameEn,
    this.nameId,
    this.nameLong,
    this.nameShort,
    this.number,
    this.numberOfVerses,
    this.revelation,
    this.revelationEn,
    this.revelationId,
    this.sequence,
    this.tafsir,
    this.translationEn,
    this.translationId,
  });

  factory DataSurah.fromJson(Map<String, dynamic> json) => DataSurah(
        audioUrl: json["audio_url"],
        nameEn: json["name_en"],
        nameId: json["name_id"],
        nameLong: json["name_long"],
        nameShort: json["name_short"],
        number: json["number"],
        numberOfVerses: json["number_of_verses"],
        revelation: json["revelation"],
        revelationEn: json["revelation_en"],
        revelationId: json["revelation_id"],
        sequence: json["sequence"],
        tafsir: json["tafsir"],
        translationEn: json["translation_en"],
        translationId: json["translation_id"],
      );

  Map<String, dynamic> toJson() => {
        "audio_url": audioUrl,
        "name_en": nameEn,
        "name_id": nameId,
        "name_long": nameLong,
        "name_short": nameShort,
        "number": number,
        "number_of_verses": numberOfVerses,
        "revelation": revelation,
        "revelation_en": revelationEn,
        "revelation_id": revelationId,
        "sequence": sequence,
        "tafsir": tafsir,
        "translation_en": translationEn,
        "translation_id": translationId,
      };
}

class Request {
  String? path;

  Request({
    this.path,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
