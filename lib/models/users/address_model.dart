import 'package:flutter_defualt_project/models/users/geolocation_model.dart';

class AddressModel {
  final GeolocationModel geolocationModel;
  final String city;
  final String street;
  final String zipcode;
  final num number;

  AddressModel({required this.geolocationModel,
    required this.number,
    required this.city,
    required this.street,
    required this.zipcode});

  factory AddressModel.fromJson(Map<String, dynamic>json){
    return AddressModel(
        geolocationModel: GeolocationModel.fromJson(json["geolocation"]),
        number: json["number"] as num? ?? 0,
        city: json["city"] as String? ?? "",
        street: json["street"] as String? ?? "",
        zipcode: json["zipcode"] as String? ?? "");
  }
}

