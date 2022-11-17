import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/CategoriesChoice.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width:
            choice.title != 'أكثر' && choice.title != 'خلق' ? 150.0.w : 100.w,
        height:
            choice.title != 'أكثر' && choice.title != 'خلق' ? 150.0.h : 100.h,
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, choice.colorsValues['r']!,
              choice.colorsValues['g']!, choice.colorsValues['b']!)!,
        ),
        child: Center(
          child: ClipOval(
              child: Image.asset(
            choice.icon,
            width:
                choice.title != 'أكثر' && choice.title != 'خلق' ? 90.0.w : 75.w,
            height:
                choice.title != 'أكثر' && choice.title != 'خلق' ? 90.0.h : 75.h,
          )),
        ),
      ),
      Text(choice.title,
          style: TextStyle(
              color: choice.title != 'أكثر' && choice.title != 'خلق'
                  ? Color.fromARGB(255, choice.colorsValues['r']!,
                      choice.colorsValues['g']!, choice.colorsValues['b']!)
                  : Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Noto Naskh Arabic",
              fontSize: 24.0)),
    ]);
  }
}
