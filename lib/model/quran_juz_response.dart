// To parse this JSON data, do
//
//     final juzQuranResponse = juzQuranResponseFromJson(jsonString);

import 'dart:convert';

JuzQuranResponse juzQuranResponseFromJson(String str) =>
    JuzQuranResponse.fromJson(json.decode(str));

String juzQuranResponseToJson(JuzQuranResponse data) =>
    json.encode(data.toJson());

class JuzQuranResponse {
  bool? status;
  Request? request;
  List<DataJuz>? data;

  JuzQuranResponse({
    this.status,
    this.request,
    this.data,
  });

  factory JuzQuranResponse.fromJson(Map<String, dynamic> json) =>
      JuzQuranResponse(
        status: json["status"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        data: json["data"] == null
            ? []
            : List<DataJuz>.from(json["data"]!.map((x) => DataJuz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataJuz {
  String? ayatArab;
  String? ayatIndo;
  String? ayatLatin;
  String? name;
  String? nameEndArab;
  String? nameEndId;
  String? nameStartArab;
  String? nameStartId;
  String? number;
  String? surahIdEnd;
  String? surahIdStart;
  String? verseEnd;
  String? verseStart;

  DataJuz({
    this.ayatArab,
    this.ayatIndo,
    this.ayatLatin,
    this.name,
    this.nameEndArab,
    this.nameEndId,
    this.nameStartArab,
    this.nameStartId,
    this.number,
    this.surahIdEnd,
    this.surahIdStart,
    this.verseEnd,
    this.verseStart,
  });

  factory DataJuz.fromJson(Map<String, dynamic> json) => DataJuz(
        ayatArab: json["ayat_arab"],
        ayatIndo: json["ayat_indo"],
        ayatLatin: json["ayat_latin"],
        name: json["name"],
        nameEndArab: json["name_end_arab"],
        nameEndId: json["name_end_id"],
        nameStartArab: json["name_start_arab"],
        nameStartId: json["name_start_id"],
        number: json["number"],
        surahIdEnd: json["surah_id_end"],
        surahIdStart: json["surah_id_start"],
        verseEnd: json["verse_end"],
        verseStart: json["verse_start"],
      );

  Map<String, dynamic> toJson() => {
        "ayat_arab": ayatArab,
        "ayat_indo": ayatIndo,
        "ayat_latin": ayatLatin,
        "name": name,
        "name_end_arab": nameEndArab,
        "name_end_id": nameEndId,
        "name_start_arab": nameStartArab,
        "name_start_id": nameStartId,
        "number": number,
        "surah_id_end": surahIdEnd,
        "surah_id_start": surahIdStart,
        "verse_end": verseEnd,
        "verse_start": verseStart,
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
