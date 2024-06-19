import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:client/integration/rest/freelance_finder/dto/login_request.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/reg/forgot_password.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/AppColors.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../models/user_role.dart';
import '../providers/token_provider.dart';
import '../providers/user_id_provider.dart';
import '../providers/user_role_provider.dart';

class EntranceWidget extends StatefulWidget {
  const EntranceWidget({super.key});

  @override
  _EntranceWidgetState createState() => _EntranceWidgetState();
}

class _EntranceWidgetState extends State<EntranceWidget> {
  final TextEditingController _loginTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  String? _loginTextFieldError;
  String? _passwordTextFieldError;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(children: [
          const Align(
            alignment: FractionalOffset(0.5, 0.2),
            child: Text(
              'FREELANCEFINDER',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 32,
                fontFamily: 'Viga',
                fontWeight: FontWeight.w400,
                height: 0.02,
                letterSpacing: -0.50,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.63, 0.27),
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-3.14),
              child: Container(
                width: 44,
                height: 44,
                decoration: const ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: StarBorder.polygon(sides: 3),
                ),
              ),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.33),
            child: Text(
              'Вход',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.03,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.52),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _loginTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.08,
                              left: constraints.maxWidth * 0.05,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _loginTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _loginTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _loginTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _loginTextFieldError != null,
                            child: Text(
                              _loginTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.1325, 0.45),
            child: SizedBox(
              child: Text(
                'Логин или Email',
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.1, 0.57),
            child: SizedBox(
              child: Text(
                'Пароль',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.65),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _passwordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.02,
                              bottom: constraints.maxHeight * 0.02,
                              left: constraints.maxWidth * 0.05,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _passwordTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _passwordTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _passwordTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.01,
                        ),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _passwordTextFieldError != null,
                            child: Text(
                              _passwordTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          Align(
            alignment: const FractionalOffset(0.89, 0.68),
            child: Material(
                color: AppColors.backgroundColor,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordWidget()),
                      );
                    },
                    splashColor: Colors.transparent,
                    child: const SizedBox(
                        height: 30,
                        child: Text(
                          'Забыли пароль?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF6C85C5),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        )))),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.85),
                child: ElevatedButton(
                  onPressed: () async {
                    AppMetrica.activate(const AppMetricaConfig(
                        "045e79e7-d746-49e7-8d17-e4f2e0aab027"));
                    AppMetrica.reportEvent('Установка');
                    AppMetrica.reportEvent('Запуск');
                    // AppMetrica.reportEvent('Регистрация');
                    // AppMetrica.reportEvent('Авторизация');
                    // AppMetrica.reportEvent('Переход в аккаунт');
                    // AppMetrica.reportEvent('Оценки');

                    setState(() {
                      _loginTextFieldError =
                          _loginTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _passwordTextFieldError =
                          _passwordTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                    });

                    if (_loginTextFieldError != null ||
                        _passwordTextFieldError != null) {
                      return;
                    }

                    try {
                      final user = LoginRequestDTO(
                        username: _loginTextFieldController.text,
                        password: _passwordTextFieldController.text,
                      );

                      FreelanceFinderService.instance
                          .loginUser(user);
                      updateProvidersInfo(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllOrders()),
                      );
                    } catch (e) {
                      print(111);
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.85,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: 14,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.5, 0.925),
            child: Material(
                color: AppColors.backgroundColor,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationWidget()),
                      );
                    },
                    splashColor: Colors.transparent,
                    child: const SizedBox(
                        height: 30,
                        child: Text(
                          'Нет аккаунта?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF6C85C5),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        )))),
          ),
        ]));
  }

  void updateProvidersInfo(BuildContext context) {
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
  }
}
