import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/products/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      color: AppColors.C_F1F1F1,
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          CachedNetworkImage(
            imageUrl: product.image,
            height: 110.h,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            product.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 18.h,
          ),
          ZoomTapAnimation(
            onTap: () {},
            child: Column(
              children: [
                Text(
                  "SHOP NOW",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Divider(thickness: 2, color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
