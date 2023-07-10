import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/models/products/product_model.dart';
import 'package:flutter_defualt_project/models/universal_response.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<ProductModel>> fetchAllProducts()async{
    UniversalResponse universalResponse=await apiProvider.getAllProducts();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> fetchProductsByLimit(String limit)async{
    UniversalResponse universalResponse=await apiProvider.getProductsByLimit(limit);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> fetchProductsById(String id)async{
    UniversalResponse universalResponse=await apiProvider.getProductsById(id);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<ProductModel>;
    }
    return [];
  }
}