import 'package:festa_test/Application/Home_bloc/bloc/home_bloc.dart';
import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Presentation/FilterScreen/FIlterScreen.dart';
import 'package:festa_test/Presentation/LogutScreen.dart/LogoutScreen.dart';
import 'package:festa_test/Widgets/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Home_mobScreen extends StatelessWidget {
  const Home_mobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.started());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 300),
                        type: PageTransitionType.leftToRight,
                        child: LogOutScreen()));
              },
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.white,
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 300),
                          type: PageTransitionType.leftToRight,
                          child: FilterScreen()));
                },
                child: Text(
                  'FILTER',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ))
          ],
          backgroundColor: Constants.appThemeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
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
                      : ListView.separated(
                          itemBuilder: (context, index) => List_ItemWidget(
                                index: index,
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 22.h,
                              ),
                          itemCount: state.resultList!.results!.length);
            },
          ),
        ));
  }
}
