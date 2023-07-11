import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';
import 'package:flutter_defualt_project/data/network/repositories/category_repo.dart';
import 'package:flutter_defualt_project/data/network/repositories/login_repo.dart';
import 'package:flutter_defualt_project/data/network/repositories/product_repo.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ApiProvider apiProvider = ApiProvider();

  late ProductRepo productRepo = ProductRepo(apiProvider: apiProvider);
  late CategoryRepo categoryRepo = CategoryRepo(apiProvider: apiProvider);
  late String token;

  Future<void> _init() async {
    token = StorageRepository.getString("token");
    await Future.delayed(const Duration(seconds: 3), () {
      token.isNotEmpty
          ? Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen,
              arguments: ApiProvider())
          : Navigator.pushReplacementNamed(context, RouteNames.loginScreen,
              arguments: LoginRepo(apiProvider: apiProvider));
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.black),
        backgroundColor: AppColors.black,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product App\nBy ParaDoxical Team",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.orange)),
            SizedBox(
              height: 20.h,
            ),
            Image.asset(AppImages.logo)
          ],
        ),
      ),
    );
  }
}
