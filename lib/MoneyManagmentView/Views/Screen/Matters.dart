import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/CategoryScreen.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/calculater.dart';
import 'package:helloworld/MoneyManagmentView/models/CategoriesChoice.dart';

import '../../data/Categories.dart';
import '../Widgets/MattersCustomeBar.dart';
import '../Widgets/SelectCategory.dart';
import 'Expenses.dart';

class MattersScreen extends StatefulWidget {
  static late TabController tabController;

  @override
  State<MattersScreen> createState() => _MattersScreenState();
}

class _MattersScreenState extends State<MattersScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  late DateTime today;

  initalizeTabController() {
    MattersScreen.tabController = TabController(length: 2, vsync: this);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
    today = DateTime.now();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MattersScreen.tabController.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != today) {
      setState(() {
        today = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MattersBarScreen(),
        body: SingleChildScrollView(
          child: Container(
              height: 2000.h,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Center(
                    child: Row(children: [
                  SizedBox(width: 108.w),
                  //متغيرة حسب المستخدم البيانات المخزنة في قاعدة البيانات

                  Ink(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => Calculater(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "image/Calculater.png",
                            fit: BoxFit.cover,
                            height: 80.h,
                          ))),

                  Text(' ILS',
                      style: new TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Noto Naskh Arabic",
                          fontSize: 32.0)),
                  Expanded(
                      child: Form(
                          child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        controller.text = '0';
                        return 'أدخل مبلغ المعاملة';
                      }
                    },
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
                SizedBox(height: 63.h),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('حساب\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    Text('رئيسي\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 50, 136, 99),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 28.0)),
                    Text('الفئات\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    SizedBox(
                        height: 443.h,
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2.0,
                            children:
                                List.generate(choices.length - 6, (index) {
                              if (index == 3) {
                                return Ink(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) => CategoryScreen(),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: SelectCard(
                                              choice: Choice(
                                                  title: 'أكثر',
                                                  icon: 'image/plus.png',
                                                  colorsValues: {
                                                'r': 164,
                                                'g': 183,
                                                'b': 177
                                              })),
                                        )));
                              }
                              return Center(
                                child: SelectCard(choice: choices[index]),
                              );
                            }))),
                    SizedBox(
                        child: Row(
                          children: [
                            Ink(
                                child: InkWell(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Image.asset('image/Calender.png'))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(today.month!.toString() +
                                        '/' +
                                        today.day!.toString()))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(today.month!.toString() +
                                        '/' +
                                        (today.day! - 1).toString()))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(today.month!.toString() +
                                        '/' +
                                        (today.day! - 1).toString()))),
                          ],
                        ),
                        width: double.infinity),
                    Expanded(child: SizedBox())
                  ],
                ))
              ])),
        ));
  }
}
