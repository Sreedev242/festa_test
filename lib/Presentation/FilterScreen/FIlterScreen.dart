import 'package:festa_test/Presentation/FilterScreen/Filter_mob.dart';
import 'package:festa_test/Presentation/FilterScreen/Filter_tab.dart';
import 'package:festa_test/Presentation/HomeScreen/Home_mob.dart';
import 'package:festa_test/Presentation/HomeScreen/Home_tab.dart';
import 'package:festa_test/Presentation/LoginScreen/Login_mob.dart';
import 'package:festa_test/Presentation/LoginScreen/Login_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile:(context) {
        ScreenUtil.init(context,designSize: const Size(412 , 870));
        return const FilterMobScreen();
      },
      tablet: (contaxt) {
        ScreenUtil.init(context,designSize: const Size(600 , 1024));

      return  const FilterTabScreen();
      },
    );
  }
}