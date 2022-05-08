import 'package:flutter/material.dart';
import 'package:map_navigator/src/pages/home_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Map navigatoe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
    
  }
}
