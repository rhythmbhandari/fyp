class History {
  History({
    this.id,
    this.userId,
    this.riderId,
    this.bookingId,
    this.locationId,
    this.startTime,
    this.endTime,
    this.origin,
    this.destination,
    this.stoppage,
    this.distance,
    this.duration,
    this.passengerNumber,
    this.status,
    this.price,
    this.paymentType,
    this.cancelledByType,
    this.cancelledById,
    this.cancelMessage,
    this.createdAt,
    this.updatedAt,
    this.location,
  });

  int id;
  int userId;
  int riderId;
  int bookingId;
  int locationId;
  DateTime startTime;
  DateTime endTime;
  String origin;
  String destination;
  List<Stoppage> stoppage;
  int distance;
  int duration;
  int passengerNumber;
  String status;
  int price;
  String paymentType;
  String cancelledByType;
  int cancelledById;
  String cancelMessage;
  DateTime createdAt;
  DateTime updatedAt;
  Location location;

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json["id"],
    userId: json["user_id"],
    riderId: json["rider_id"],
    bookingId: json["booking_id"],
    locationId: json["location_id"],
    startTime: json["start_time"] == null? null: DateTime.parse(json["start_time"]),
    endTime: json["end_time"] == null? null: DateTime.parse(json["end_time"]),
    origin: json["origin"],
    destination: json["destination"],
    stoppage: json["stoppage"] == null? null: List<Stoppage>.from(json["stoppage"].map((x) => Stoppage.fromJson(x))),
    distance: json["distance"],
    duration: json["duration"],
    passengerNumber: json["passenger_number"],
    status: json["status"],
    price: json["price"],
    paymentType: json["payment_type"],
    cancelledByType: json["cancelled_by_type"],
    cancelledById: json["cancelled_by_id"],
    cancelMessage: json["cancel_message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    location: json["location"] == null? null: Location.fromJson(json["location"]),
  );
}

class Location {
  Location({
    this.id,
    this.longitudeOrigin,
    this.latitudeOrigin,
    this.longitudeDestination,
    this.latitudeDestination,
  });

  int id;
  double longitudeOrigin;
  double latitudeOrigin;
  double longitudeDestination;
  double latitudeDestination;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    longitudeOrigin: json["longitude_origin"].toDouble(),
    latitudeOrigin: json["latitude_origin"].toDouble(),
    longitudeDestination: json["longitude_destination"].toDouble(),
    latitudeDestination: json["latitude_destination"].toDouble(),
  );
}

class Stoppage {
  Stoppage({
    this.name,
    this.latitude,
    this.longitude,
  });

  String name;
  double latitude;
  double longitude;

  factory Stoppage.fromJson(Map<String, dynamic> json) => Stoppage(
    name: json["name"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );
}
