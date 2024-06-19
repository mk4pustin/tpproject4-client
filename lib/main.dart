import 'package:client/providers/token_provider.dart';
import 'package:client/providers/user_id_provider.dart';
import 'package:client/providers/user_role_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user_role.dart';
import 'start_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserRoleProvider()),
        ChangeNotifierProvider(create: (_) => UserIdProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRoleProvider = Provider.of<UserRoleProvider>(context);
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final tokenProvider = Provider.of<TokenProvider>(context);
    final sr = SharedPreferences.getInstance();

    sr.then((value) => {
          userRoleProvider
              .setUserRole(getUserRoleFromString(value.getString('role'))),
          userIdProvider.setUserId(value.getInt('id')),
          tokenProvider.setToken(value.getString('token'))
        });

    AppMetrica.activate(
        AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
    AppMetrica.reportEvent('Установка');
    AppMetrica.reportEvent('Запуск');
    AppMetrica.reportEvent('Регистрация');
    return const MaterialApp(
      title: 'FreelanceFinder',
      home: StartPage(),
    );
  }
}
