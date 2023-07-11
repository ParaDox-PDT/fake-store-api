import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';

import '../../models/products/product_model.dart';

class ProductRepo{
  final ApiProvider apiProvider;
  ProductRepo({required this.apiProvider});

  Future<List<ProductModel>> getAllProducts()async{
    UniversalResponse universalResponse = await apiProvider.getAllProducts();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> getProductByLimit(String limit)async{
    UniversalResponse universalResponse = await apiProvider.getProductsByLimit(limit: limit);
    if(universalResponse.error.isEmpty){
      return  universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> getProductsByCategory(String category)async{
    UniversalResponse universalResponse =await apiProvider.getProductsByCategory(category: category);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> getSortedProducts(String sort) async {
    UniversalResponse universalResponse = await apiProvider.sortProducts(sort);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<ProductModel?> addProduct(ProductModel productModel) async {
    UniversalResponse universalResponse =
    await apiProvider.addProduct(productModel);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as ProductModel;
    }
    return null;
  }

  Future<ProductModel?> updateProduct(ProductModel productModel) async {
    UniversalResponse universalResponse =
    await apiProvider.updateProduct(productModel);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as ProductModel;
    }
    return null;
  }

  Future<ProductModel?> deleteProduct(String id) async {
    UniversalResponse universalResponse = await apiProvider.deleteProduct(id);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as ProductModel;
    }
    return null;
  }
}