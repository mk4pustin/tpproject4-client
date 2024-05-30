import 'package:client/UserRoleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'start_page.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => UserRoleProvider(),
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FreelanceFinder',
      home: StartPage(),
    );
  }
}