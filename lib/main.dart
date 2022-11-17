//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:helloworld/MoneyManagmentView/Views/Screen/StartScreen.dart';

import 'MoneyManagmentView/Views/Screen/Account.dart';
import 'MoneyManagmentView/Views/Screen/CategoryScreen.dart';
import 'MoneyManagmentView/Views/Screen/Currency.dart';
import 'MoneyManagmentView/Views/Screen/Expenses.dart';
import 'MoneyManagmentView/Views/Screen/MainScreen.dart';
import 'MoneyManagmentView/Views/Screen/Matters.dart';


void main() {
 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(625, 1151),
        builder: (context, child) {
          return MaterialApp(
            home: MoneyManagement(),
            debugShowCheckedModeBanner: false,
            routes: {
              'StartScreen': (context) => StartScreen(),
              'CurrencyScreen': (context) => Currency(),
              'AccountScreen': (context) => AccountScreen(),
              'ExpensesScreen': (context) => ExpensesScreen(),
              'CategoryScreen': (context) => CategoryScreen(),
               'MattersScreen': (context) => MattersScreen()
            
            },
          );
          //);
        });
  }
}

