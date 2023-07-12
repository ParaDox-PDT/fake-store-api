import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/network/repositories/login_repo.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/network/providers/api_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.loginRepo});

  final LoginRepo loginRepo;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiProvider apiProvider = ApiProvider();
  bool isVisible = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLogin = false;

  _login() async {
    isLogin = await widget.loginRepo.loginUser(
        username: _userNameController.text, password: _passwordController.text);
  }

  @override
  void initState() {
    _login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: Theme.of(context).textTheme.titleLarge),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            isVisible = !isVisible;
                          },
                        );
                      },
                      icon: Icon(
                          !isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ],
            ),
            ZoomTapAnimation(
              onTap: () async{
                await _login();
                setState(() {

                });
                {
                  isLogin
                      ? {
                    StorageRepository.putString("username", _userNameController.text),
                    StorageRepository.putString("password", _passwordController.text),
                    Navigator.pushReplacementNamed(
                        context, RouteNames.tabBoxScreen,
                        arguments: ApiProvider()),
                  }
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Login or Password incorrect!!!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        );
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
