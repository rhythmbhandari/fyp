class Booking {
  Booking({
    this.id,
    this.stoppage,
    this.userId,
    this.vehicleTypeId,
    this.riderId,
    this.locationId,
    this.startTime,
    this.endTime,
    this.origin,
    this.destination,
    this.distance,
    this.duration,
    this.passengerNumber,
    this.status,
    this.price,
    this.paymentType,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.location,
  });

  int id;
  List<Stoppage> stoppage;
  int userId;
  int vehicleTypeId;
  dynamic riderId;
  int locationId;
  dynamic startTime;
  dynamic endTime;
  String origin;
  String destination;
  int distance;
  int duration;
  int passengerNumber;
  String status;
  double price;
  String paymentType;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Location location;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    stoppage: json["stoppage"] == null? null : List<Stoppage>.from(json["stoppage"].map((x) => Stoppage.fromJson(x))),
    userId: json["user_id"],
    vehicleTypeId: json["vehicle_type_id"],
    riderId: json["rider_id"],
    locationId: json["location_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    origin: json["origin"],
    destination: json["destination"],
    distance: json["distance"],
    duration: json["duration"],
    passengerNumber: json["passenger_number"],
    status: json["status"],
    price: json["price"].toDouble(),
    paymentType: json["payment_type"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    location: json["location"] == null? null:Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stoppage": List<dynamic>.from(stoppage.map((x) => x.toJson())),
    "user_id": userId,
    "vehicle_type_id": vehicleTypeId,
    "rider_id": riderId,
    "location_id": locationId,
    "start_time": startTime,
    "end_time": endTime,
    "origin": origin,
    "destination": destination,
    "distance": distance,
    "duration": duration,
    "passenger_number": passengerNumber,
    "status": status,
    "price": price,
    "payment_type": paymentType,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "location": location.toJson(),
  };
}

class Location {
  Location({
    this.id,
    this.longitudeOrigin,
    this.latitudeOrigin,
    this.longitudeDestination,
    this.latitudeDestination,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  double longitudeOrigin;
  double latitudeOrigin;
  double longitudeDestination;
  double latitudeDestination;
  DateTime createdAt;
  DateTime updatedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    longitudeOrigin: json["longitude_origin"].toDouble(),
    latitudeOrigin: json["latitude_origin"].toDouble(),
    longitudeDestination: json["longitude_destination"].toDouble(),
    latitudeDestination: json["latitude_destination"].toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "longitude_origin": longitudeOrigin,
    "latitude_origin": latitudeOrigin,
    "longitude_destination": longitudeDestination,
    "latitude_destination": latitudeDestination,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Stoppage {
  Stoppage({
    this.name,
    this.latitude,
    this.longitude,
  });

  String name;
  double latitude;
  dynamic longitude;

  factory Stoppage.fromJson(Map<String, dynamic> json) => Stoppage(
    name: json["name"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
  };
}


// class Booking {
//   Booking({
//     this.origin,
//     this.destination,
//     this.passengerNumber,
//     this.vehicleTypeId,
//     this.distance,
//     this.price,
//     this.duration,
//     this.userId,
//     this.status,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//     this.riderId,
//     this.locationId,
//     this.location,
//   });
//
//   String origin;
//   String destination;
//   int passengerNumber;
//   int vehicleTypeId;
//   int distance;
//   double price;
//   int duration;
//   int riderId;
//   int userId;
//   String status;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//   int locationId;
//   Location location;
//
//   factory Booking.fromJson(Map<String, dynamic> json) => Booking(
//     origin: json["origin"],
//     destination: json["destination"],
//     passengerNumber: json["passenger_number"],
//     vehicleTypeId: json["vehicle_type_id"],
//     distance: json["distance"],
//     price: json["price"].toDouble(),
//     duration: json["duration"],
//     userId: json["user_id"],
//     riderId: json["rider_id"],
//     status: json["status"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     id: json["id"],
//     locationId: json["location_id"],
//     location: json["location"] == null? null: Location.fromJson(json["location"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "origin": origin,
//     "destination": destination,
//     "passenger_number": passengerNumber,
//     "vehicle_type_id": vehicleTypeId,
//     "distance": distance,
//     "price": price,
//     "duration": duration,
//     "user_id": userId,
//     "status": status,
//     "updated_at": updatedAt.toIso8601String(),
//     "created_at": createdAt.toIso8601String(),
//     "id": id,
//     "location_id": locationId,
//     "location": location.toJson(),
//   };
// }
//
// class Location {
//   Location({
//     this.latitudeOrigin,
//     this.longitudeOrigin,
//     this.latitudeDestination,
//     this.longitudeDestination,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//   });
//
//   double latitudeOrigin;
//   double longitudeOrigin;
//   double latitudeDestination;
//   double longitudeDestination;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     latitudeOrigin: json["latitude_origin"].toDouble(),
//     longitudeOrigin: json["longitude_origin"].toDouble(),
//     latitudeDestination: json["latitude_destination"].toDouble(),
//     longitudeDestination: json["longitude_destination"].toDouble(),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "latitude_origin": latitudeOrigin,
//     "longitude_origin": longitudeOrigin,
//     "latitude_destination": latitudeDestination,
//     "longitude_destination": longitudeDestination,
//     "updated_at": updatedAt.toIso8601String(),
//     "created_at": createdAt.toIso8601String(),
//     "id": id,
//   };
// }
