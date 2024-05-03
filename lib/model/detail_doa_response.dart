// To parse this JSON data, do
//
//     final detailDoaResponse = detailDoaResponseFromJson(jsonString);

import 'dart:convert';

DetailDoaResponse detailDoaResponseFromJson(String str) =>
    DetailDoaResponse.fromJson(json.decode(str));

String detailDoaResponseToJson(DetailDoaResponse data) =>
    json.encode(data.toJson());

class DetailDoaResponse {
  bool? status;
  Request? request;
  Info? info;
  DetailDoa? data;

  DetailDoaResponse({
    this.status,
    this.request,
    this.info,
    this.data,
  });

  factory DetailDoaResponse.fromJson(Map<String, dynamic> json) =>
      DetailDoaResponse(
        status: json["status"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        data: json["data"] == null ? null : DetailDoa.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request?.toJson(),
        "info": info?.toJson(),
        "data": data?.toJson(),
      };
}

class DetailDoa {
  String? arab;
  String? indo;
  String? judul;
  String? source;

  DetailDoa({
    this.arab,
    this.indo,
    this.judul,
    this.source,
  });

  factory DetailDoa.fromJson(Map<String, dynamic> json) => DetailDoa(
        arab: json["arab"],
        indo: json["indo"],
        judul: json["judul"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "judul": judul,
        "source": source,
      };
}

class Info {
  int? min;
  int? max;

  Info({
    this.min,
    this.max,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}

class Request {
  String? path;
  String? id;

  Request({
    this.path,
    this.id,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json["path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "id": id,
      };
}
