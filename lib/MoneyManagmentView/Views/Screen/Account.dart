import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 96.h),
        Center(
            child: Text(
          'أدخل حساب الرصيد الرئيسي\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            // color: Color.fromARGB(255, 41, 43, 30),
            fontFamily: 'Noto Naskh Arabic',
          ),
        )),
        Center(
            child: Text(
          'يمكنك إضافة المزيد من الحسابات في قسم الحسابات',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 113, 114, 106),
            fontFamily: 'Noto Naskh Arabic',
          ),
        )),
        SizedBox(
          height: 126.h,
        ),
        Container(
            margin: EdgeInsets.all(25),
            child: Row(children: [
              SizedBox(width: 108.w),
              //متغيرة حسب المستخدم البيانات المخزنة في قاعدة البيانات
              Text('ILS',
                  style: new TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Noto Naskh Arabic",
                      fontSize: 32.0)),
              Expanded(
                  child: Form(
                      child: TextField(
                textAlign: TextAlign.center,
                controller: controller,
                style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Noto Naskh Arabic",
                    fontSize: 28.0),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 50, 136, 99)),
                  ),
                ),
              ))),
              SizedBox(width: 176.w),
            ])),
        SizedBox(
          height: 245.h,
        ),
        Expanded(
            child: Center(
                child: Container(
          width: 409.w,
          height: 89.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(41),
            color: Color.fromARGB(255, 249, 250, 244),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 228, 234, 224),
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(41),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      Color.fromARGB(255, 253, 194, 42), // Background color
                  // Text Color (Foreground color)
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('ExpensesScreen');
                },
                child: Text(
                  'التالي',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 77, 79, 66),
                    fontFamily: 'Noto Naskh Arabic',
                  ),
                ),
              )),
        ))),
        SizedBox(
          height: 35.h,
        )
      ]),
    );
  }
}
