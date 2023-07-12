import 'dart:convert';

import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../models/products/product_model.dart';
import '../../models/universal_response.dart';
import '../../models/users/user_model.dart';

class ApiProvider {

  //---------------------------------Login Response-----------------------------

  Future<UniversalResponse> loginUser({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('$baseUrl/auth/login');
    try {
      final response = await http.post(
        url,
        body:
          {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        String token = jsonDecode(response.body)["token"];
        return UniversalResponse(data: token);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }






  //---------------------------Products Response--------------------------------
  //-----------------------------get response-----------------------------------



  Future<UniversalResponse> getAllProducts() async {
    Uri uri = Uri.parse("$baseUrl/products");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductsByCategory(
      {required String category}) async {
    Uri url = Uri.parse(
      category.isNotEmpty
          ? '$baseUrl/products/category/$category'
          : "$baseUrl/products",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }


  Future<UniversalResponse> getProductsByLimit({required String limit}) async {
    Uri uri = Uri.parse("$baseUrl/products?limit=$limit");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductsById({required String id}) async {
    Uri uri = Uri.parse("$baseUrl/products/$id");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> sortProducts(String sortType) async {
    Uri uri = Uri.parse("$baseUrl/products?sort=$sortType");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  //-------------------------------post response--------------------------------


  Future<UniversalResponse> addProduct(ProductModel product) async {
    Uri url = Uri.parse('$baseUrl/products');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(product.toJson()),
      );
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: ProductModel.fromJson(jsonDecode(response.body)),
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  //--------------------------------put response--------------------------------



  Future<UniversalResponse> updateProduct(ProductModel productModel) async {
    Uri uri = Uri.parse("$baseUrl/auth/login");

    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode(productModel.toJson()),
      );
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  //--------------------------------delete response-----------------------------



  Future<UniversalResponse> deleteProduct(String id) async {
    Uri uri = Uri.parse("$baseUrl/products/$id");
    try {
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }




  //--------------------------------User Response-------------------------------

  Future<UniversalResponse> getAllUsers() async {
    Uri uri = Uri.parse("$baseUrl/users");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => UserModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }




  //----------------------------Category Response-------------------------------

  Future<UniversalResponse> getAllCategories() async {
    Uri uri = Uri.parse("$baseUrl/products/categories");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => e as String)
              .toList(),
        );
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
