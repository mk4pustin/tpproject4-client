import 'package:client/providers/UserRoleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'start_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserRoleProvider()),
    ],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    AppMetrica.activate(AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
    AppMetrica.reportEvent('Установка');
    AppMetrica.reportEvent('Запуск');
    AppMetrica.reportEvent('Регистрация');
    return const MaterialApp(
      title: 'FreelanceFinder',
      home: StartPage(),
    );
  }
}