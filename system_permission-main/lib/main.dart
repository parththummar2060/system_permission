import 'package:flutter/material.dart';
import 'package:project42/pages/home_page.dart';
import 'package:project42/pages/second_page..dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomeScreen(),
        'check_permission' : (context) => const permission_page(),
      },
    );
  }
}