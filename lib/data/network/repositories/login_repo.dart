import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';

class LoginRepo{
  final ApiProvider apiProvider;
  LoginRepo({required this.apiProvider});

  Future<bool> loginUser({required String username, required String password})async{
    UniversalResponse universalResponse = await apiProvider.loginUser(username: username, password: password);
    if(universalResponse.error.isEmpty){
      await StorageRepository.putString("token", universalResponse.data as String);
      return true;
    }
    print("ERROR:${universalResponse.error}");
    return false;

  }
}