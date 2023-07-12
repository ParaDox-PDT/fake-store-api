
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/ui/home/home_screen.dart';
import 'package:flutter_defualt_project/ui/product_add/product_add_screen.dart';
import 'package:flutter_defualt_project/ui/tab_box/wdigets/search_view_items.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/products/product_model.dart';
import '../../data/network/providers/api_provider.dart';
import '../../data/network/repositories/category_repo.dart';
import '../../data/network/repositories/product_repo.dart';
import '../../data/network/repositories/user_repo.dart';
import '../users/users_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key, required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  ApiProvider provider = ApiProvider();
  String activeCategoryName = "";
  List<Widget> screens = [];
  int activePage = 0;
  late List<ProductModel> products;
  bool isLoading = false;
  List<String> likes = StorageRepository.getList("likes");

  late ProductRepo productRepo = ProductRepo(apiProvider: provider);
  late UserRepo userRepo;
  late CategoryRepo categoryRepo;

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    products = await productRepo.getProductsByCategory(activeCategoryName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    categoryRepo = CategoryRepo(apiProvider: widget.apiProvider);
    userRepo = UserRepo(apiProvider: widget.apiProvider);
    screens.add(HomeScreen(
      productRepo: productRepo,
      categoryRepo: categoryRepo,
    ));
    screens.add(UsersScreen(
      userRepo: userRepo,
    ));
    screens.add(ProductAddScreen(productRepo: productRepo));
    _updateProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: activePage,
            children: screens,
          ),
          Container(
            height: 65.h,
            width: 351.w,
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70.r),
              color: AppColors.white,
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ZoomTapAnimation(
                    onTap: () {
                      activePage = 0;
                      setState(() {});
                    },
                    child: SvgPicture.asset(AppIcons.home)),
                ZoomTapAnimation(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: ProductSearchView(products: products));
                    },
                    child: SvgPicture.asset(AppIcons.search)),
                ZoomTapAnimation(
                    onTap: () {
                      activePage=2;
                      setState(() {});
                    },
                    child: Icon(Icons.add,size: 28.w,)),
                // ZoomTapAnimation(
                //     onTap: () {
                //       activePage = 4;
                //       setState(() {});
                //     },
                //     child: SvgPicture.asset(AppIcons.cart)),
                ZoomTapAnimation(
                    onTap: () {
                      activePage = 1;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.person,
                      size: 28.w,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
