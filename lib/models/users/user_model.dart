import 'package:flutter_defualt_project/models/users/address_model.dart';
import 'package:flutter_defualt_project/models/users/name_model.dart';

class UserModel {
  final AddressModel addressModel;
  final num id;
  final String email;
  final String username;
  final String password;
  final String phone;
  final NameModel nameModel;
  final num v;

  UserModel(
      {required this.nameModel,
      required this.addressModel,
      required this.password,
      required this.username,
      required this.id,
      required this.phone,
      required this.email,
      required this.v});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        nameModel: NameModel.fromJson(json["name"]),
        addressModel: AddressModel.fromJson(json["address"]),
        password: json["password"] as String? ?? "",
        username: json["username"] as String? ?? "",
        id: json["id"] as num? ?? 0,
        phone: json["phone"] as String? ?? "",
        email: json["email"] as String? ?? "",
        v: json["__v"] as num? ?? 0);
  }
}
