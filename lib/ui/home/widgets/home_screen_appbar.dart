import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/icons.dart';
import '../../../utils/images.dart';

class HomeScreenAppbar extends StatelessWidget  implements PreferredSize{
  const HomeScreenAppbar({super.key, required this.onMenuTap});


  final ValueChanged<int> onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: PopupMenuButton<int>(
          icon:SvgPicture.asset(AppIcons.menu),
          onSelected: onMenuTap,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 1,
              child: Text('Sort by A-Z'),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text('Sort by Z-A'),
            ),const PopupMenuItem<int>(
              value: 3,
              child: Text('Get by limit'),
            ),
          ]
      ),
      title: Text(
        "products",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        ZoomTapAnimation(
          onTap: () {},
          child: Image.asset(
            AppImages.userImg,
            width: 32.w,
          ),
        ),
        SizedBox(
          width: 12.w,
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
