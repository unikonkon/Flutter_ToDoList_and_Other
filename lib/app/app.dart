import 'package:flutter/material.dart';
import 'package:flutter_app_todolist/bottombar/bottombar.dart';
import 'package:flutter_app_todolist/personal_data/bloc/personal_bloc.dart';
import 'package:flutter_app_todolist/personal_data/data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalBloc(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
