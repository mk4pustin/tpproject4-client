import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:client/reg/registration.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../integration/rest/freelance_finder/dto/registration_request.dart';
import '../integration/rest/freelance_finder/dto/update_request.dart';
import '../models/user_role.dart';
import '../providers/token_provider.dart';
import '../providers/user_id_provider.dart';
import '../providers/user_role_provider.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final _usernameController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _aboutController = TextEditingController();
  final _contactInfoController = TextEditingController();
  final _priceController = TextEditingController();

  String? _usernameError;
  String? _currentPasswordError;
  String? _newPasswordError;
  String? _aboutError;
  String? _contactInfoError;
  String? _priceError;

  @override
  Widget build(BuildContext context) {
    AppMetrica.activate(
        const AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
    AppMetrica.reportEvent('Изменение профиля');
    final userRoleProvider = Provider.of<UserRoleProvider>(context);
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final tokenProvider = Provider.of<TokenProvider>(context);

    return Material(
        child: Container(
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
              Align(
                alignment: const FractionalOffset(0, 1),
                child: Container(
                  height: 90,
                  decoration: const ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(0.5, 1.01),
                child: SizedBox(
                  width: 110,
                  height: 17,
                  child: Text(
                    'Фрилансеры',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.525, 0.97),
                child: SizedBox(
                  child: SizedBox(
                    width: 80,
                    height: 60,
                    child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const AllFreelancersWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                  'assets/images/freelancers_icon.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(1, 1.01),
                child: SizedBox(
                  width: 110,
                  height: 18,
                  child: Text(
                    'Профиль',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.98, 0.97),
                child: SizedBox(
                  child: SizedBox(
                    width: 80,
                    height: 60,
                    child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child:
                              Image.asset('assets/images/profile_icon.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.08, 0.97),
                child: SizedBox(
                  child: SizedBox(
                    width: 80,
                    height: 60,
                    child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllOrders()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child:
                              Image.asset('assets/images/orders_icon.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(0, 1.01),
                child: SizedBox(
                  width: 113,
                  height: 18,
                  child: Text(
                    'Заказы',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(0.6, 0.087),
                child: SizedBox(
                  child: Text(
                    'Изменение профиля',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.03,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(0.2, 0.15),
                child: SizedBox(
                  child: Text(
                    'Имя пользователя',
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
                alignment: const FractionalOffset(0.5, 0.19),
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
                            controller: _usernameController,
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
                                  color: _usernameError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _usernameError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _usernameError != null
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
                              visible: _usernameError != null,
                              child: Text(
                                _usernameError ?? '',
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
                alignment: FractionalOffset(0.17, 0.25),
                child: SizedBox(
                  child: Text(
                    'Текущий пароль',
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
                alignment: const FractionalOffset(0.5, 0.3),
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
                            controller: _currentPasswordController,
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
                                  color: _currentPasswordError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _currentPasswordError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _currentPasswordError != null
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
                              visible: _currentPasswordError != null,
                              child: Text(
                                _currentPasswordError ?? '',
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
                alignment: FractionalOffset(0.16, 0.36),
                child: SizedBox(
                  child: Text(
                    'Новый пароль',
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
                alignment: const FractionalOffset(0.5, 0.42),
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
                            controller: _newPasswordController,
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
                                  color: _newPasswordError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _newPasswordError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _newPasswordError != null
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
                              visible: _newPasswordError != null,
                              child: Text(
                                _newPasswordError ?? '',
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
                alignment: FractionalOffset(0.13, 0.47),
                child: SizedBox(
                  child: Text(
                    'Обо мне',
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
                alignment: const FractionalOffset(0.5, 0.61),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Material(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.85,
                          height: constraints.maxHeight * 0.15,
                          child: TextField(
                            controller: _aboutController,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.black,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.05,
                                right: constraints.maxWidth * 0.05,
                                top: 8.0,
                                bottom: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: _aboutError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _aboutError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _aboutError != null
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
                              visible: _aboutError != null,
                              child: Text(
                                _aboutError ?? '',
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
                alignment: FractionalOffset(0.28, 0.66),
                child: SizedBox(
                  child: Text(
                    'Контактная информация',
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
                alignment: const FractionalOffset(0.5, 0.75),
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
                            controller: _contactInfoController,
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
                                  color: _contactInfoError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _contactInfoError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _contactInfoError != null
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
                              visible: _contactInfoError != null,
                              child: Text(
                                _contactInfoError ?? '',
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
                alignment: FractionalOffset(0.35, 0.75),
                child: SizedBox(
                  child: Text(
                    'Желаемый заработок(в час)',
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
                alignment: const FractionalOffset(0.5, 0.85),
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
                            controller: _priceController,
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
                                  color: _priceError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _priceError != null
                                      ? AppColors.errorColor
                                      : AppColors.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _priceError != null
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
                              visible: _priceError != null,
                              child: Text(
                                _priceError ?? '',
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
              LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: const FractionalOffset(0.5, 0.88),
                    child: ElevatedButton(
                      onPressed: () async {
                        AppMetrica.activate(const AppMetricaConfig(
                            "045e79e7-d746-49e7-8d17-e4f2e0aab027"));
                        AppMetrica.reportEvent('Запуск');
                        AppMetrica.reportEvent('Установка');
                        AppMetrica.reportEvent('Переход в аккаунт');
                        AppMetrica.reportEvent('Регистрация');
                        AppMetrica.reportEvent('Авторизация');

                        setState(() {

                          if (_currentPasswordError == null &&
                              _newPasswordError != null) {
                             {
                              _currentPasswordError = "Пароли не совпадают";
                            }
                          }

                        });

                        if (_usernameError != null ||
                            _currentPasswordError != null ||
                            _newPasswordError != null ||
                            _aboutError != null ||
                            _contactInfoError != null ||
                            _priceError != null) {
                          return;
                        }

                        try {
                          final user = UpdateRequestDTO(
                              username: _usernameController.text,
                              password: _newPasswordController.text,
                              aboutMe: _aboutController.text,
                              contact: _contactInfoController.text,
                              price: _priceController.text);

                          await FreelanceFinderService.instance
                              .updateUser(user, tokenProvider.token.toString());
                          updateProvidersInfo(
                              userRoleProvider, userIdProvider, tokenProvider);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllOrders()),
                          );
                        } catch (e) {
                          print(123);
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
                        'Сохранить',
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
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
                alignment: const FractionalOffset(0.05, 0.055),
                child: SizedBox(
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Material(
                          color: AppColors.backgroundColor,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const AllFreelancersWidget()),
                                );
                              },
                              splashColor: Colors.transparent,
                              child: Stack(children: [
                                Transform.scale(
                                  scale: 0.8,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/images/back.png'),
                                )
                              ])))),
                ),
              ),
            ])));
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
}