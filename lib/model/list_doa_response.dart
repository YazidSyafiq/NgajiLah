// To parse this JSON data, do
//
//     final listDoaResponse = listDoaResponseFromJson(jsonString);

import 'dart:convert';

ListDoaResponse listDoaResponseFromJson(String str) =>
    ListDoaResponse.fromJson(json.decode(str));

String listDoaResponseToJson(ListDoaResponse data) =>
    json.encode(data.toJson());

class ListDoaResponse {
  bool? status;
  Request? request;
  Info? info;
  List<DataDoa>? data;

  ListDoaResponse({
    this.status,
    this.request,
    this.info,
    this.data,
  });

  factory ListDoaResponse.fromJson(Map<String, dynamic> json) =>
      ListDoaResponse(
        status: json["status"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        data: json["data"] == null
            ? []
            : List<DataDoa>.from(json["data"]!.map((x) => DataDoa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request?.toJson(),
        "info": info?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataDoa {
  String? arab;
  String? indo;
  String? judul;
  String? source;

  DataDoa({
    this.arab,
    this.indo,
    this.judul,
    this.source,
  });

  factory DataDoa.fromJson(Map<String, dynamic> json) => DataDoa(
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
