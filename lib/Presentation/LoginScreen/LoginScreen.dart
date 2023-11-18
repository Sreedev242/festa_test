import 'package:festa_test/Presentation/LoginScreen/Login_mob.dart';
import 'package:festa_test/Presentation/LoginScreen/Login_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile:(context) {
        ScreenUtil.init(context,designSize:  const Size(412 , 870));
        return const Login_mobScreen();
      },
      tablet: (contaxt) {
        ScreenUtil.init(context,designSize: const Size(600 , 1024));

      return  const Login_tabScreen();
      },
    );
  }
}