import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/models/default_model.dart';
import 'package:flutter_defualt_project/models/universal_response.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<DefaultModel>> fetchDefaultModelData()async{
    UniversalResponse universalResponse=await apiProvider.getAllProducts();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<DefaultModel>;
    }
    return [];
  }
}