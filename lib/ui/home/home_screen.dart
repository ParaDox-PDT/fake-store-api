import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home/widgets/carousel_image.dart';
import 'package:flutter_defualt_project/ui/home/widgets/categories_items.dart';
import 'package:flutter_defualt_project/ui/home/widgets/grid_view_item.dart';
import 'package:flutter_defualt_project/ui/home/widgets/home_screen_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/products/product_model.dart';
import '../../data/network/repositories/category_repo.dart';
import '../../data/network/repositories/product_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.productRepo, required this.categoryRepo});

  final ProductRepo productRepo;
  final CategoryRepo categoryRepo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeCategoryName = "";

  List<ProductModel> products = [];
  List<String> categories = [];

  bool isLoading = false;
  int pageIndex = 0;
  final PageController pageController = PageController();

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    products =
        await widget.productRepo.getProductsByCategory(activeCategoryName);
    setState(() {
      isLoading = false;
    });
  }

  _init() async {
    categories = await widget.categoryRepo.getAllCategories();
  }

  @override
  void initState() {
    _init();
    _updateProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            CategoriesItems(
                onCategorySelected: (selectedCategory) {
                  activeCategoryName = selectedCategory;
                  _updateProducts();
                },
                categories: categories),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        CarouselImage(products: products),
                        SizedBox(
                          height: 26.h,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 14.w,
                                    childAspectRatio: 0.8),
                            itemBuilder: (context, index) {
                              ProductModel product = products[index];
                              return GridViewItem(product: product);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
