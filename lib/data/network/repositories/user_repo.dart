import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/models/users/user_model.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';

class UserRepo{
  final ApiProvider apiProvider;
  UserRepo({required this.apiProvider});

  Future<List<UserModel>> getAllUsers()async{
    UniversalResponse universalResponse= await apiProvider.getAllUsers();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<UserModel>;
    }
    return [];
  }
}