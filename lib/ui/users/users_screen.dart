import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/users/user_model.dart';
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
  final LoginRepo loginRepo = LoginRepo(apiProvider: ApiProvider());

  List<UserModel> users = [];
  bool isLoading = false;
  late UserModel user;
  final String username = StorageRepository.getString("username");
  final String password = StorageRepository.getString("password");

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    users = await widget.userRepo.getAllUsers();
    for (var element in users) {
      if (element.username == username && element.password == password) {
        user = element;
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _updateProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Users Screen",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          elevation: 5,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      size: 100.h,
                    ),
                    Text(
                      "${user.nameModel.firstname} ${user.nameModel.lastname}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 24.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username:${user.username}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 20.sp),
                        ),
                        Text(
                          "Address: ${user.addressModel.city} ${user.addressModel.street} ${user.addressModel.number} ",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 20.sp),
                        ),
                        Text(
                          "Email:${user.email}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 20.sp),
                        ),
                        Text(
                          "Phone number:${user.phone}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    ZoomTapAnimation(
                      onTap: () {
                        StorageRepository.deleteString("token");
                        StorageRepository.deleteString("username");
                        StorageRepository.deleteString("password");
                        Navigator.pushReplacementNamed(
                            context, RouteNames.loginScreen,
                            arguments: loginRepo);
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
                      ),
                    ),
                    SizedBox(height: 100.h,),
                  ],
                ),
              ));
  }
}
