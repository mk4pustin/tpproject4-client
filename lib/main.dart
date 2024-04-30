import 'package:flutter/material.dart';

import 'start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FreelanceFinder',
      home: StartPage(),
    );
  }
}