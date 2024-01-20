import 'package:api_with_dio/layout/cubit/cubit.dart';
import 'package:api_with_dio/layout/cubit/state.dart';
import 'package:api_with_dio/layout/new_layout.dart';
import 'package:api_with_dio/shared/network/remote/dio_helper.dart';
import 'package:api_with_dio/shared/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  Diohelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getGeneralDate(),
        child: BlocConsumer<NewsCubit, NewsState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                scaffoldBackgroundColor: Color.fromARGB(255, 27, 26, 26),
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.black,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle()),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  showUnselectedLabels: false,
                ),
              ),
              themeMode: NewsCubit.get(context).isdark!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                primarySwatch: primary,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle()),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  showUnselectedLabels: false,
                  elevation: 0.0,
                ),
              ),
              home: Directionality(
                  textDirection: TextDirection.ltr, child: News_layout()),
            );
          },
          listener: (context, state) {},
        ));
  }
}
