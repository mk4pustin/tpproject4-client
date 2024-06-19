import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppMetrica.activate(
        const AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
    AppMetrica.reportEvent('Установка');
    AppMetrica.reportEvent('Запуск');
    AppMetrica.reportEvent('Регистрация');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ));
    });

    return MaterialApp(
      title: 'FreelanceFinder',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          body: const StartPage(),
        ),
      ),
    );
  }
}