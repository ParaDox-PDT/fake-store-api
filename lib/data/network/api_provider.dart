import 'dart:convert';

import 'package:flutter_defualt_project/models/categories/category_model.dart';
import 'package:flutter_defualt_project/models/login/login_model.dart';
import 'package:flutter_defualt_project/models/products/product_model.dart';
import 'package:flutter_defualt_project/models/users/user_model.dart';

import '../../models/universal_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  //Products Response
  //get response

  Future<UniversalResponse> getAllProducts() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
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

  Future<UniversalResponse> getProductsByLimit(String limit) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products?limit=$limit");
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

  Future<UniversalResponse> getProductsById(String id) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
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
    Uri uri = Uri.parse("https://fakestoreapi.com/products?sort=$sortType");
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

  //post response
  Future<UniversalResponse> addProduct(String title, String description,
      num price, String image, String category) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/auth/login");

    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode(
          <String, dynamic>{
            "title": title,
            "price": price,
            "description": description,
            "image": image,
            "category": category
          },
        ),
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

  //put response

  Future<UniversalResponse> updateProduct(String title, String description,
      num price, String image, String category) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/auth/login");

    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode(
          <String, dynamic>{
            "title": title,
            "price": price,
            "description": description,
            "image": image,
            "category": category
          },
        ),
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

  //delete response

  Future<UniversalResponse> deleteProduct(String id)async{
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
    try{
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    }catch(error){
      return UniversalResponse(error: error.toString());
    }
  }

  //User Response

  Future<UniversalResponse> getAllUsers() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/users");
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

  //Category Response

  Future<UniversalResponse> getAllCategories() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (CategoryModel(
                categories: jsonDecode(response.body) as List<String>)));
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductsByCategory(String category) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/category/$category");
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

  // Login Response

  Future<UniversalResponse> postLoginUser(
      String username, String password) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/auth/login");

    try {
      http.Response response = await http.post(uri,
          body: jsonEncode(
              <String, String>{"username": username, "password": password}));
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => LoginModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
