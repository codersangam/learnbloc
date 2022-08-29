// To parse this JSON data, do
//
//     final tagsModel = tagsModelFromJson(jsonString);

import 'dart:convert';

List<TagsModel> tagsModelFromJson(String str) =>
    List<TagsModel>.from(json.decode(str).map((x) => TagsModel.fromJson(x)));

String tagsModelToJson(List<TagsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TagsModel {
  TagsModel({
    this.id,
    this.title,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
