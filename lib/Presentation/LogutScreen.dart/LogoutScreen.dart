import 'dart:ffi';

import 'package:festa_test/Application/Home_bloc/bloc/home_bloc.dart';
import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Presentation/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.started());
    return Scaffold(
      backgroundColor: Constants.appThemeColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Constants.appThemeColor,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.isError
              ? Center(child:
                   Column(mainAxisAlignment: MainAxisAlignment.center,
                  
                    children: [
                      Text(
                        'Something went wrong !',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),SizedBox(height: 6.h,),
                      Icon(Icons.error_outline_rounded,color: Colors.white,size: 44.dm,)
                    ],
                  )
                )
              : state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 110.r,
                            child: CircleAvatar(
                              radius: 100.r,
                              backgroundImage: NetworkImage(state
                                  .resultList.results![0].picture!.medium!),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Text(
                            "${state.resultList.results![0].name!.firstName!} ${state.resultList.results![0].name!.lastName!}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            'Email : ${state.resultList.results![0].email!}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Text(
                            'phone : ${state.resultList.results![0].phoneNumber!}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: SizedBox(
                            height: 100.h,
                            width: 200.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 300),
                                        type: PageTransitionType.leftToRight,
                                        child: LoginScreen()));
                              },
                              child: Text(
                                'LOG OUT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Constants.appThemeColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
        },
      ),
    );
  }
}
