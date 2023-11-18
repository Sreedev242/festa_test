import 'package:festa_test/Application/Home_bloc/bloc/home_bloc.dart';
import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Widgets/IconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class List_ItemWidget extends StatelessWidget {
  final int index;
  const List_ItemWidget({
    Key? key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(),
          ),
          height: 390.h,
          width: 350.w,
        ),
        Container(
          height: 100.h,
          width: 350.w,
          color: Constants.appThemeColor,
        ),
        SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.h, left: 120.w),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Constants.appThemeColor,
                      child: CircleAvatar(
                        radius: 45.r,
                      backgroundImage:NetworkImage(state.resultList.results![index]!.picture!.medium!),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130.w),
                    child: Text(
                     "My name is",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.only(left: 130.w),
                    child: Text(
                     "${state.resultList.results![index].name!.firstName!} ${state.resultList.results![index].name!.lastName!}" ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.appThemeColor),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: SizedBox(
                      width: 20.w,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          // right: 50.w,
          bottom: 33.h,
          left: 50.w, top: 300.h,
          child: IconWidget(),
        ),
      ],
    );
  }
}
