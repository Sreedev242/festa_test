import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Presentation/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Login_mobScreen extends StatelessWidget {
  const Login_mobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.appThemeColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 400.h,
          width: 300.w,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Constants.appThemeColor,
                        fontSize: 28.sp),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w),
                  child: SizedBox(
                    height: 56.h,
                    child: TextField(
                      // cursorHeight: 25.h,
                      decoration: InputDecoration(hintText: 'email',
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor: Constants.appThemeColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w),
                  child: SizedBox(
                    height: 56.h,
                    child: TextField(
                      
                      // cursorHeight: 35.h,
                      decoration: InputDecoration(hintText: 'password',
                        prefixIcon: Icon(Icons.password_outlined),
                        prefixIconColor: Constants.appThemeColor,
                        suffixIcon: Icon(Icons.visibility),
                        suffixIconColor: Constants.appThemeColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Constants.appThemeColor)),
                        onPressed: () {
                          Navigator.push(context, PageTransition(
                            duration: Duration(milliseconds: 400),
                            type: PageTransitionType.fade, child: HomeScreen()));
                        },
                        child: Text(
                          'LOG IN',
                          style: TextStyle(fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ))),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255))),
                        onPressed: () {Navigator.push(context, PageTransition(
                            duration: Duration(milliseconds: 400),
                            type: PageTransitionType.fade, child: HomeScreen()));},
                        child: Text(
                          'Sign in with google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Constants.appThemeColor,
                          ),
                        )))
              ]),
        ),
      ),
    );
  }
}
