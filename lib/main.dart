import 'package:flutter/material.dart';
import 'package:passvalidation/landing_page.dart';
import 'package:passvalidation/validation_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/landing': (context) => const LandingPage(),
      },
    ),
  );
}
