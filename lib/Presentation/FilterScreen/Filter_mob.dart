import 'package:festa_test/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class FilterMobScreen extends StatefulWidget {
  const FilterMobScreen({super.key});

  @override
  State<FilterMobScreen> createState() => _FilterMobScreenState();
}

class _FilterMobScreenState extends State<FilterMobScreen> {
  int? selectedGender;
  setSelectedRadio(int val) {
    setState(() {
      selectedGender = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.appThemeColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Constants.appThemeColor,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 500.h,
          width: 300.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Gender',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text('Male'),
                      activeColor: Constants.appThemeColor,
                      value: 1,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Female'),
                      value: 2,
                      activeColor: Constants.appThemeColor,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: () {

                          Navigator.of(context).pop();

                          }, child: Text('Filter')),
                          TextButton(onPressed: () {
                          Navigator.of(context).pop();
              
                          }, child: Text('Cancel')),
                    
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
