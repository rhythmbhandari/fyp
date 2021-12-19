class AvailableRider {
  AvailableRider({
    this.id,
    this.longitude,
    this.latitude,
    this.riderId,
  });

  int id;
  double longitude;
  double latitude;
  int riderId;

  factory AvailableRider.fromJson(Map<String, dynamic> json) => AvailableRider(
    id: json["id"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    riderId: json["rider_id"],
  );
}
