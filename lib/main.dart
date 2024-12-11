import 'package:THATGIRL/View/product_page.dart';
import 'package:THATGIRL/utils/local_strings.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,
      home: ProductPage(),
      title: LocalStrings.appName,
      theme: ThemeData(
        fontFamily: "theme",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

