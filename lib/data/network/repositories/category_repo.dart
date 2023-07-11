import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';

class CategoryRepo{
  final ApiProvider apiProvider;
  CategoryRepo({required this.apiProvider});

  Future<List<String>>  getAllCategories()async{
    UniversalResponse universalResponse = await apiProvider.getAllCategories();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<String>;
    }
    return [];
  }
}