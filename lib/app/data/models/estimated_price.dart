class EstimatedPrice {
  EstimatedPrice({
    this.vehicleTypeId,
    this.vehicleTypeName,
    this.shift,
    this.priceBreakdown,
  });

  int vehicleTypeId;
  String vehicleTypeName;
  int shift;
  PriceBreakdown priceBreakdown;

  factory EstimatedPrice.fromJson(Map<String, dynamic> json) => EstimatedPrice(
    vehicleTypeId: json["vehicle_type_id"],
    vehicleTypeName: json["vehicle_type_name"],
    shift: json["shift"],
    priceBreakdown: PriceBreakdown.fromJson(json["price_breakdown"]),
  );

  Map<String, dynamic> toJson() => {
    "vehicle_type_id": vehicleTypeId,
    "vehicle_type_name": vehicleTypeName,
    "shift": shift,
    "price_breakdown": priceBreakdown.toJson(),
  };
}

class PriceBreakdown {
  PriceBreakdown({
    this.minimumCharge,
    this.pricePerKm,
    this.priceAfterDistance,
    this.surgeRate,
    this.surge,
    this.priceAfterSurge,
    this.appChargePercent,
    this.appCharge,
    this.priceAfterAppCharge,
    this.pricePerMin,
    this.durationCharge,
    this.priceAfterDuration,
    this.totalPrice,
  });

  double minimumCharge;
  double pricePerKm;
  double priceAfterDistance;
  double surgeRate;
  double surge;
  double priceAfterSurge;
  double appChargePercent;
  double appCharge;
  double priceAfterAppCharge;
  double pricePerMin;
  double durationCharge;
  double priceAfterDuration;
  double totalPrice;

  factory PriceBreakdown.fromJson(Map<String, dynamic> json) => PriceBreakdown(
    minimumCharge: json["minimum_charge"] is int? double.parse(json["minimum_charge"].toString()): json["minimum_charge"].toDouble(),
    pricePerKm: json["price_per_km"] is int? double.parse(json["price_per_km"].toString()): json["price_per_km"].toDouble(),
    priceAfterDistance: json["price_after_distance"] is int? double.parse(json["price_after_distance"].toString()): json["price_after_distance"].toDouble(),
    surgeRate: json["surge_rate"] is int? double.parse(json["surge_rate"].toString()): json["surge_rate"].toDouble(),
    surge: json["surge"] is int? double.parse(json["surge"].toString()): json["surge"].toDouble(),
    priceAfterSurge: json["price_after_surge"] is int? double.parse(json["price_after_surge"].toString()): json["price_after_surge"].toDouble(),
    appChargePercent: json["app_charge_percent"] is int? double.parse(json["app_charge_percent"].toString()): json["app_charge_percent"].toDouble(),
    appCharge: json["app_charge"] is int? double.parse(json["app_charge"].toString()):json["app_charge"].toDouble(),
    priceAfterAppCharge: json["price_after_app_charge"] is int? double.parse(json["price_after_app_charge"].toString()): json["price_after_app_charge"].toDouble(),
    pricePerMin: json["price_per_min"] is int? double.parse(json["price_per_min"].toString()): json["price_per_min"].toDouble(),
    durationCharge: json["duration_charge"] is int? double.parse(json["duration_charge"].toString()): json["duration_charge"].toDouble(),
    priceAfterDuration: json["price_after_duration"] is int? double.parse(json["price_after_duration"].toString()): json["price_after_duration"].toDouble(),
    totalPrice: json["total_price"] is int? double.parse(json["total_price"].toString()): json["total_price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "minimum_charge": minimumCharge,
    "price_per_km": pricePerKm,
    "price_after_distance": priceAfterDistance,
    "surge_rate": surgeRate,
    "surge": surge,
    "price_after_surge": priceAfterSurge,
    "app_charge_percent": appChargePercent,
    "app_charge": appCharge,
    "price_after_app_charge": priceAfterAppCharge,
    "price_per_min": pricePerMin,
    "duration_charge": durationCharge,
    "price_after_duration": priceAfterDuration,
    "total_price": totalPrice,
  };
}
