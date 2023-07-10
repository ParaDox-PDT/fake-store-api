import 'package:flutter/material.dart';

import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';
import '../../models/products/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiRepository cardRepository =
  ApiRepository(apiProvider: ApiProvider());
  List<ProductModel> products=[];

  _fetchData()async{
    products = await cardRepository.fetchProductsById("5");
    for (var element in products) {
      print(element.title);
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
    );
  }
}
