class MissionModel {
  String name;
  String patch;
  String? details;
  int flightNumber;

  MissionModel({
    required this.name,
    required this.patch,
    this.details,
    required this.flightNumber,
  });

  factory MissionModel.fromJson(Map<String,dynamic> json) {
    return MissionModel(
      name: json["name"],
      patch: json["patch"]["large"],
      flightNumber: json["flight_number"],
    );
  }
}