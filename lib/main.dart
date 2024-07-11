import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson_75/homework/cubit/product_cubit.dart';
import 'package:flutter_lesson_75/homework/cubit/theme_cubit.dart';

import 'classwork/views/screens/home_screen.dart';
import 'homework/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => ProductCubit())
        ],
        child: BlocBuilder<ThemeCubit, bool>(builder: (context, bool state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
            darkTheme: ThemeData.dark(),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            home: HomeScreen(),
          );
        }));
  }
}
