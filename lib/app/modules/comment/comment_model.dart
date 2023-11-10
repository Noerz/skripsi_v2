// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    int id;
    String body;
    String name;
    int authId;
    String email;
    int postId;

    Comment({
        required this.id,
        required this.body,
        required this.name,
        required this.authId,
        required this.email,
        required this.postId,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        body: json["body"],
        name: json["name"],
        authId: json["auth_id"],
        email: json["email"],
        postId: json["post_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "name": name,
        "auth_id": authId,
        "email": email,
        "post_id": postId,
    };
}
