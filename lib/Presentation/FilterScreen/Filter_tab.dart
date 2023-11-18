import 'package:festa_test/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTabScreen extends StatefulWidget {
  const FilterTabScreen({super.key});

  @override
  State<FilterTabScreen> createState() => _FilterTabScreenState();
}

class _FilterTabScreenState extends State<FilterTabScreen> {
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
          height: 600.h,
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
              Column(
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
                        ElevatedButton(onPressed: () {
                          
                        Navigator.of(context).pop();

                        }, child: Text('Filter')),
                        ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
              
                        }, child: Text('Cancel')),
                  
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
