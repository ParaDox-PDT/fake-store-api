import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';
import 'package:flutter_defualt_project/data/network/repositories/login_repo.dart';
import 'package:flutter_defualt_project/data/network/repositories/user_repo.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.userRepo});
  final UserRepo userRepo;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final LoginRepo loginRepo=LoginRepo(apiProvider: ApiProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Screen",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            onTap: (){
              StorageRepository.deleteString("token");
              Navigator.pushReplacementNamed(context, RouteNames.loginScreen,arguments:loginRepo );
            },
            child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: Colors.blue),
            child: Center(
              child: Text(
                "Log out",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),)
        ],
      ),
    );
  }
}
