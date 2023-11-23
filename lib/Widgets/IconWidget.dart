import 'package:festa_test/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWidget extends StatefulWidget {

// const IconWidget({Key? key, required this.Index, required this.firstLine, required this.secondLine,}) : super(key: key);
  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  int selectedIconIndex = 0;

  void selectIcon(int index) {
    if (index == 0) {
      print('First icon clicked!');
    }

    setState(() {
      selectedIconIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          IconData icon;
          switch (index) {
            case 0:
              icon = Icons.person_outline_sharp;
              break;
            case 1:
              icon = Icons.email_outlined;
              break;
            case 2:
              icon = Icons.calendar_month;
              break;
            case 3:
              icon = Icons.home;
              break;
            case 4:
              icon = Icons.phone;
              break;
            default:
              icon = Icons.error;
          }
    
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  selectIcon(index);
                },
                child: Icon(size:34.dm,
                  icon,
                  color: index == selectedIconIndex
                      ? Constants.appThemeColor
                      : Colors.grey,
                ),
              ),
              SizedBox(width: 25.w,)
            ],
          );
        },
      ),
    );
  }
}
