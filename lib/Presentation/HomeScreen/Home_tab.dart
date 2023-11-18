import 'package:festa_test/Application/Home_bloc/bloc/home_bloc.dart';
import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Presentation/LogutScreen.dart/LogoutScreen.dart';
import 'package:festa_test/Widgets/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class HOme_tabScreen extends StatelessWidget {
  const HOme_tabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.started());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.isError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Something went wrong !',
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Icon(
                          Icons.error_outline_rounded,
                          color: Colors.grey,
                          size: 44.dm,
                        )
                      ],
                    ),
                  )
                : state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Constants.appThemeColor,
                        ),
                      )
                    : Expanded(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Container(
                            height: double.infinity,
                            color: Constants.appThemeColor,
                            width: 170.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 110.r,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(state
                                            .resultList
                                            .results![0]!
                                            .picture!
                                            .medium!),
                                        radius: 100.r,
                                      )),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Center(
                                  child: Text(
                                    state.resultList.results![0]!.name!
                                        .firstName!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Text(
                                    'Email :  ${state.resultList.results![0].email!}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Text(
                                    'phone : ${state.resultList.results![0].phoneNumber!} ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Center(
                                  child: SizedBox(
                                      height: 90.h,
                                      width: 150.w,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(255, 255,
                                                          255, 255))),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    type: PageTransitionType
                                                        .leftToRight,
                                                    child: LogOutScreen()));
                                          },
                                          child: Text(
                                            'LOG OUT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                              color: Constants.appThemeColor,
                                            ),
                                          ))),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          SingleChildScrollView(
                            child: Expanded(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: state.resultList!.results!
                                    .length, // Replace with the number of items you have
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: (MediaQuery.of(context)
                                                .size
                                                .width -
                                            200) /
                                        2, // Divide available width by 2 for 2 items in a row
                                    child: List_ItemWidget(
                                      index: index,
                                    ), // Replace with your ListItem widget
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
          },
        ),
      ),
    );
  }
}
