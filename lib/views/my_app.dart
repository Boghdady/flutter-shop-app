import 'package:flutter/material.dart';
import 'package:flutter_shop_app/views/firebase_auth_test.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuthTest(),
    );
  }
}
