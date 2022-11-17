import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/Categories.dart';
import '../../models/CategoriesChoice.dart';
import '../Screen/Expenses.dart';
import '../Widgets/CustomeCategoriesAppBar.dart';
import '../Widgets/SelectCategory.dart';

class CategoryScreen extends StatelessWidget implements PreferredSizeWidget {
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CsutomeCategoryAppBar('إضافة فئة', 'ExpensesScreen'),
      body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 8.0,
          children: List.generate(choices.length, (index) {
            return Ink(
                child: InkWell(
                    child: Center(child: SelectCard(choice: choices[index]))));
          })),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 831);
}
