import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/home/home_screen.dart';
import 'package:flutter_app_news_c11_fri/my_bloc_observer.dart';
import 'package:flutter_app_news_c11_fri/my_theme_data.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
