// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.slug,
        this.firstName,
        this.middleName,
        this.lastName,
        this.image,
        this.dob,
        this.gender,
        this.googleId,
        this.facebookId,
        this.username,
        this.phone,
        this.email,
        this.status,
        this.emailVerifiedAt,
        this.lastLoggedIn,
        this.noOfLogins,
        this.avatar,
        this.deletedAt,
        this.lastUpdatedBy,
        this.lastDeletedBy,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.imagePath,
    });

    int id;
    String slug;
    String firstName;
    String middleName;
    String lastName;
    String image;
    DateTime dob;
    dynamic gender;
    dynamic googleId;
    dynamic facebookId;
    dynamic username;
    String phone;
    String email;
    dynamic status;
    dynamic emailVerifiedAt;
    dynamic lastLoggedIn;
    dynamic noOfLogins;
    dynamic avatar;
    dynamic deletedAt;
    dynamic lastUpdatedBy;
    dynamic lastDeletedBy;
    DateTime createdAt;
    DateTime updatedAt;
    String name;
    String imagePath;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        slug: json["slug"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        image: json["image"],
        dob: json["dob"] == null? null: DateTime.parse(json["dob"]),
        gender: json["gender"],
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        lastLoggedIn: json["last_logged_in"],
        noOfLogins: json["no_of_logins"],
        avatar: json["avatar"],
        deletedAt: json["deleted_at"],
        lastUpdatedBy: json["last_updated_by"],
        lastDeletedBy: json["last_deleted_by"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        imagePath: json["image_path"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "image": image,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "google_id": googleId,
        "facebook_id": facebookId,
        "username": username,
        "phone": phone,
        "email": email,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "last_logged_in": lastLoggedIn,
        "no_of_logins": noOfLogins,
        "avatar": avatar,
        "deleted_at": deletedAt,
        "last_updated_by": lastUpdatedBy,
        "last_deleted_by": lastDeletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "image_path": imagePath,
    };
}
