import 'package:flutter/material.dart';
import 'package:shop/presentation/screens/home_screen.dart';
import 'package:shop/presentation/screens/update_product_screen.dart';

import 'core/App_styles/themes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'store App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        UpdateProductScreen.routeName:(context)=>UpdateProductScreen(),
      },
    );
  }
}
