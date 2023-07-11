import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home/home_screen.dart';

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
  List<Widget> screens = [];
  int activePage = 0;

  late ProductRepo productRepo;
  late UserRepo userRepo;
  late CategoryRepo categoryRepo;

  @override
  void initState() {
    productRepo = ProductRepo(apiProvider: widget.apiProvider);
    categoryRepo = CategoryRepo(apiProvider: widget.apiProvider);
    userRepo = UserRepo(apiProvider: widget.apiProvider);
    screens.add(HomeScreen(
      productRepo: productRepo,
      categoryRepo: categoryRepo,
    ));
    screens.add(UsersScreen(
      userRepo: userRepo,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activePage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: Colors.black,
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            label: "Users",
          ),
        ],
      ),
    );
  }
}
