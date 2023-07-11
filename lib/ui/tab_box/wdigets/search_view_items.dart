import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/products/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProductSearchView extends SearchDelegate {
  ProductSearchView({required this.products});

  final List<ProductModel> products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> product = products.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: List.generate(
            product.length,
                (index) => ListTile(
              leading: CachedNetworkImage(imageUrl: product[index].image, width: 50.w,),
              title: Text(
                product[index].title,
                overflow: TextOverflow.ellipsis,
              ),
              titleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              subtitle: SizedBox(height: 35.h,child: Text(product[index].description),),
              subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8B8B8B)),
              onTap: (){
              },
            )),
      ),
    );
  }
}