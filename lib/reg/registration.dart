import 'package:client/constants/AppColors.dart';
import 'package:client/integration/rest/freelance_finder/client/client.dart';
import 'package:client/integration/rest/freelance_finder/dto/registration_request.dart';
import 'package:client/orders/all_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_role.dart';
import '../providers/token_provider.dart';
import '../providers/user_id_provider.dart';
import '../providers/user_role_provider.dart';
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
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final tokenProvider = Provider.of<TokenProvider>(context);

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
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.2),
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: 0,
                            bottom: 0,
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
                      padding: EdgeInsets.only(
                        top: constraints.maxHeight * 0.01,
                      ),
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
            }),
          ),
          const Align(
            alignment: FractionalOffset(0.1, 0.285),
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
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.327),
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
                        controller: _emailTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: 0,
                            bottom: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: _emailTextFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: _emailTextFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: _emailTextFieldError != null
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
                          visible: _emailTextFieldError != null,
                          child: Text(
                            _emailTextFieldError ?? '',
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
            }),
          ),
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
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.46),
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
                        obscureText: true,
                        controller: _passwordTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: 0,
                            bottom: 0,
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
                      padding: const EdgeInsets.only(top: 4.0),
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
            }),
          ),
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
            alignment: const FractionalOffset(0.5, 0.59),
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
                        obscureText: true,
                        controller: _passwordRepeatTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: 0,
                            bottom: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: _passwordRepeatTextFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: _passwordRepeatTextFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: _passwordRepeatTextFieldError != null
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
                          visible: _passwordRepeatTextFieldError != null,
                          child: Text(
                            _passwordRepeatTextFieldError ?? '',
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
            }),
          ),
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
            child: CustomSwitch(
              value: isFreelancer,
              onChanged: (value) {
                setState(() {
                  isFreelancer = value;
                });
              },
              activeColor: CupertinoColors.activeGreen,
              thumbSize: 15,
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.24, 0.7),
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
            alignment: FractionalOffset(0.8, 0.7),
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
          LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: const FractionalOffset(0.5, 0.78),
                child: ElevatedButton(
                  onPressed: () async {
                    AppMetrica.activate(const AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
                    AppMetrica.reportEvent('Запуск');
                    AppMetrica.reportEvent('Установка');
                    AppMetrica.reportEvent('Переход в аккаунт');
                    AppMetrica.reportEvent('Регистрация');
                    AppMetrica.reportEvent('Авторизация');

                    setState(() {
                      _loginTextFieldError =
                          _loginTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _emailTextFieldError =
                          _emailTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _passwordTextFieldError =
                          _passwordTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _passwordRepeatTextFieldError =
                          _passwordRepeatTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;

                      if (_passwordTextFieldError == null &&
                          _passwordRepeatTextFieldError == null) {
                        if (_passwordTextFieldController.text !=
                            _passwordRepeatTextFieldController.text) {
                          _passwordTextFieldError = "Пароли не совпадают";
                          _passwordRepeatTextFieldError = "Пароли не совпадают";
                        }
                      }

                      if (_emailTextFieldError == null &&
                          !isValidEmail(_emailTextFieldController.text)) {
                        _emailTextFieldError = "Неверный формат почты";
                      }
                    });

                    if (_loginTextFieldError != null ||
                        _emailTextFieldError != null ||
                        _passwordTextFieldError != null ||
                        _passwordRepeatTextFieldError != null) {
                      return;
                    }

                    try {
                      final user = RegistrationRequestDTO(
                          username: _loginTextFieldController.text,
                          password: _passwordTextFieldController.text,
                          email: _emailTextFieldController.text,
                          role: isFreelancer ? "Freelancer" : "Customer");

                      print('Role to be sent: ${user.role}');

                      await FreelanceFinderService.instance.registerUser(user);
                      updateProvidersInfo(
                          userRoleProvider, userIdProvider, tokenProvider);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllOrders()),
                      );
                    } catch (e) {
                      _emailTextFieldError =
                          "На данную почту уже зарегистрирован аккаунт";
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
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: const FractionalOffset(0.045, 0.045),
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

  void updateProvidersInfo(UserRoleProvider userRoleProvider,
      UserIdProvider userIdProvider, TokenProvider tokenProvider) {
    final sr = SharedPreferences.getInstance();

    sr.then((value) => {
          userRoleProvider
              .setUserRole(getUserRoleFromString(value.getString('role'))),
          userIdProvider.setUserId(value.getInt('id')),
          tokenProvider.setToken(value.getString('token'))
        });
  }

  @override
  void initState() {
    super.initState();
    AppMetrica.activate(
        const AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double thumbSize;
  final Color borderColor;
  final double borderWidth;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = CupertinoColors.activeGreen,
    this.inactiveColor = CupertinoColors.activeGreen,
    this.thumbSize = 16,
    this.borderColor = CupertinoColors.systemGrey,
    this.borderWidth = 1,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _isOn;
  late double _position;

  @override
  void initState() {
    super.initState();
    _isOn = widget.value;
    _position = _isOn ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
          _position = _isOn ? 1 : 0;
          widget.onChanged(!_isOn);
        });
      },
      child: Container(
        width: 44,
        height: 24,
        decoration: BoxDecoration(
          color: widget.inactiveColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: Alignment(2 * _position - 1, 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: widget.thumbSize,
                height: widget.thumbSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
