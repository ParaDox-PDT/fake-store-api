import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';

class CategoriesItems extends StatefulWidget {
  const CategoriesItems({super.key, required this.onCategorySelected, required this.categories});
  final ValueChanged<String> onCategorySelected;
  final List<String> categories;

  @override
  State<CategoriesItems> createState() => _CategoriesItemsState();
}

class _CategoriesItemsState extends State<CategoriesItems> {
  int categoryIndex=-1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ZoomTapAnimation(
              onTap:(){
                widget.onCategorySelected.call("");
                categoryIndex=-1;
                setState(() {

                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:6.w),
                padding:
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:categoryIndex==-1?Colors.lightBlue: AppColors.C_F1F1F1,
                ),
                child: Center(child: Text("All",style: Theme.of(context).textTheme.labelLarge,)),
              ),
            ),
            ...List.generate(widget.categories.length, (index) => ZoomTapAnimation(
              onTap: (){
                widget.onCategorySelected.call(widget.categories[index]);
                categoryIndex=index;
                setState(() {

                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:6.w),
                padding:
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:categoryIndex==index?Colors.lightBlue: AppColors.C_F1F1F1,
                ),
                child: Center(child: Text(widget.categories[index],style: Theme.of(context).textTheme.labelLarge)),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
