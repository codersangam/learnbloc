// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  PostsModel({
    this.id,
    this.userId,
    this.title,
    this.slug,
    this.featuredimage,
    this.body,
    this.status,
    this.like,
    this.dislike,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? title;
  String? slug;
  String? featuredimage;
  String? body;
  int? status;
  dynamic like;
  dynamic dislike;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        slug: json["slug"],
        featuredimage: json["featuredimage"],
        body: json["body"],
        status: json["status"],
        like: json["like"],
        dislike: json["dislike"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "slug": slug,
        "featuredimage": featuredimage,
        "body": body,
        "status": status,
        "like": like,
        "dislike": dislike,
        "views": views,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
