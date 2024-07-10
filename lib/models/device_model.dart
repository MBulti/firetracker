class Device {
  final String name;
  final String deviceType;
  final DateTime nextInspectionDate;
  final String locationVehicle;

  Device({
    required this.name,
    required this.deviceType,
    required this.nextInspectionDate,
    required this.locationVehicle,
  });

  // Methode zum Erstellen eines Device-Objekts aus einer JSON-Map
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      name: json['name'],
      deviceType: json['deviceType'],
      nextInspectionDate: DateTime.parse(json['nextInspectionDate']),
      locationVehicle: json['locationVehicle'],
    );
  }

  // Methode zum Konvertieren eines Device-Objekts in eine JSON-Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'deviceType': deviceType,
      'nextInspectionDate': nextInspectionDate.toIso8601String(),
      'locationVehicle': locationVehicle,
    };
  }
}
