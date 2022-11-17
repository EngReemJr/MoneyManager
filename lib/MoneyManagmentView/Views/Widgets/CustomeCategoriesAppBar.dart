import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CsutomeCategoryAppBar extends StatelessWidget with PreferredSizeWidget {
  late String title;
  late String previousPage;
  CsutomeCategoryAppBar(this.title, this.previousPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      height: 140.h,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 99, 159, 134),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                50,
              ),
              bottomLeft: Radius.circular(
                50,
              ))),
      child: Row(
        children: [
          Expanded(child: Center()),
          Center(
            child: Text('$title    ',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Noto Naskh Arabic',
                )),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(previousPage);
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
