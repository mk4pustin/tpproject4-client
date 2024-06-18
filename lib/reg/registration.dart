import 'package:client/providers/UserRoleProvider.dart';
import 'package:client/constants/AppColors.dart';
import 'package:client/integration/rest/freelance_finder/client/client.dart';
import 'package:client/integration/rest/freelance_finder/dto/registration_request.dart';
import 'package:client/orders/all_orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dto/UserRole.dart';
import 'entrance.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController _loginTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();
  final TextEditingController _passwordRepeatTextFieldController =
      TextEditingController();

  String? _loginTextFieldError;
  String? _passwordTextFieldError;
  String? _passwordRepeatTextFieldError;
  String? _emailTextFieldError;

  @override
  Widget build(BuildContext context) {
    final userRoleProvider = Provider.of<UserRoleProvider>(context);

    bool isFreelancer = false;

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
              alignment: FractionalOffset(0.5, 0.1),
              child: SizedBox(
                child: Text(
                  'Регистрация',
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
              )),
          const Align(
            alignment: FractionalOffset(0.1, 0.17),
            child: SizedBox(
              child: Text(
                'Логин',
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
              alignment: const FractionalOffset(0.5, 0.2),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _loginTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            errorText: _loginTextFieldError,
                            contentPadding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.08,
                                left: constraints.maxWidth * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.1, 0.28),
            child: SizedBox(
              child: Text(
                'Email',
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
              alignment: const FractionalOffset(0.5, 0.32),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _emailTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            errorText: _emailTextFieldError,
                            contentPadding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.08,
                                left: constraints.maxWidth * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.1, 0.4),
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
              alignment: const FractionalOffset(0.5, 0.44),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _passwordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: _passwordTextFieldError,
                            contentPadding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.08,
                                left: constraints.maxWidth * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.16, 0.52),
            child: SizedBox(
              child: Text(
                'Повторите пароль',
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
              alignment: const FractionalOffset(0.5, 0.57),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _passwordRepeatTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: _passwordRepeatTextFieldError,
                            contentPadding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.08,
                                left: constraints.maxWidth * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.15, 0.64),
            child: SizedBox(
              child: Text(
                'Выберите роль',
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
              alignment: const FractionalOffset(0.5, 0.7),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                    color: AppColors.backgroundColor,
                    child: Switch(
                      value: isFreelancer,
                      onChanged: (value) {
                        setState(() {
                          isFreelancer = value;
                        });
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.lightGreen,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.withOpacity(0.5),
                    ));
              })),
          const Align(
            alignment: FractionalOffset(0.24, 0.695),
            child: SizedBox(
              child: Text(
                'Заказчик',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.8, 0.695),
            child: SizedBox(
              child: Text(
                'Фрилансер',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.78),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_loginTextFieldController.text.trim() == "") {
                      setState(() {
                        _loginTextFieldError = "Поле пустое";
                      });
                      return;
                    }
                    if (_emailTextFieldController.text.trim() == "") {
                      setState(() {
                        _emailTextFieldError = "Поле пустое";
                      });
                      return;
                    }
                    if (_passwordTextFieldController.text.trim() == "") {
                      setState(() {
                        _passwordTextFieldError = "Поле пустое";
                      });
                      return;
                    }
                    if (_passwordRepeatTextFieldController.text.trim() == "") {
                      setState(() {
                        _passwordRepeatTextFieldError = "Поле пустое";
                      });
                      return;
                    }
                    if (_passwordTextFieldController.text !=
                        _passwordRepeatTextFieldController.text) {
                      setState(() {
                        _passwordTextFieldError = "Пароли не совпадают";
                      });
                      return;
                    }
                    if (!isValidEmail(_emailTextFieldController.text)) {
                      setState(() {
                        _emailTextFieldError = "Неверный формат почты";
                      });
                      return;
                    }
                    try {
                      final user = RegistrationRequestDTO(
                        username: _loginTextFieldController.text,
                        password: _passwordTextFieldController.text,
                        email: _emailTextFieldController.text,
                        role: isFreelancer ? "Freelancer" : "Customer",
                      );

                      FreelanceFinderService.instance.registerUser(user).then((value) =>
                      print(value));
                      userRoleProvider.setUserRole(isFreelancer
                          ? UserRole.freelancer
                          : UserRole.charterer);
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
                        constraints.maxWidth * 0.8,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ));
          }),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.12,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.70,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: const FractionalOffset(0.05, 0.05),
            child: SizedBox(
                child: Material(
                    color: AppColors.backgroundColor,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllOrders()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/images/back.png'),
                          )
                        ])))),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.85),
            child: Material(
                color: AppColors.backgroundColor,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EntranceWidget()),
                      );
                    },
                    splashColor: Colors.transparent,
                    child: const SizedBox(
                        height: 30,
                        child: Text(
                          'Уже есть аккаунт?',
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

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
