class Rider {
  Rider({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.image,
    this.gender,
    this.username,
    this.phone,
    this.email,
    this.location,
    this.avatar,
    this.name,
    this.thumbnailPath,
    this.imagePath,
  });

  int id;
  String firstName;
  String middleName;
  String lastName;
  String image;
  dynamic gender;
  String username;
  String phone;
  String email;
  dynamic location;
  dynamic avatar;
  String name;
  String thumbnailPath;
  String imagePath;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
    id: json["id"],
    firstName: json["first_name"],
    middleName: json["middle_name"],
    lastName: json["last_name"],
    image: json["image"],
    gender: json["gender"],
    username: json["username"],
    phone: json["phone"],
    email: json["email"],
    location: json["location"],
    avatar: json["avatar"],
    name: json["name"],
    thumbnailPath: json["thumbnail_path"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "image": image,
    "gender": gender,
    "username": username,
    "phone": phone,
    "email": email,
    "location": location,
    "avatar": avatar,
    "name": name,
    "thumbnail_path": thumbnailPath,
    "image_path": imagePath,
  };
}