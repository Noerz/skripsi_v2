// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

List<Profile> profileFromJson(String str) => List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
    int id;
    String gender;
    String? status;
    String name;
    String email;

    Profile({
        required this.id,
        required this.gender,
        this.status,
        required this.name,
        required this.email,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        gender: json["gender"],
        status: json["status"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender,
        "status": status,
        "name": name,
        "email": email,
    };
}
