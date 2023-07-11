import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/products/product_model.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Expanded(
        child: CarouselSlider(
          items: [
            ...List.generate(
              products.length,
                  (index) => Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: products[index].image,
                    width: 371.w,
                    fit: BoxFit.scaleDown,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 30,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 100.w,
                      color: Colors.white.withOpacity(.6),
                      child: Text(products[index].title,style: Theme.of(context).textTheme.titleSmall,),
                    ),
                  )
                ],
              ),
            ),

          ],
          options: CarouselOptions(
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
