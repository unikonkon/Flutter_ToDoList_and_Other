import 'package:flutter/material.dart';
import 'package:flutter_app_todolist/bottombar/bottombar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              backgroundColor: Color.fromARGB(255, 175, 185, 188),
              scaffoldBackgroundColor: Color.fromARGB(255, 50, 56, 61),
            ),
            home: MyBottomBar(),
          );
        });
  }
}
