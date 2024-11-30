import 'package:assignment/screens/gender_screen.dart';
import 'package:assignment/utils/media_query_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          // Initialize the MediaQuery object.
          MediaQueryUtil.init(context);
          return GenderScreen();
        },
      ),
    );
  }
}
