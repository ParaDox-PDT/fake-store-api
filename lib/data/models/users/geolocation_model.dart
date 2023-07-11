class GeolocationModel {
  final String late;
  final String long;

  GeolocationModel({required this.late, required this.long});

  factory GeolocationModel.fromJson(Map<String, dynamic> json) {
    return GeolocationModel(
        late: json["late"] as String? ?? "",
        long: json["long"] as String? ?? "");
  }
}
