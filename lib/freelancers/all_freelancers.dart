import 'package:client/freelancers/freelancers_filters.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:provider/provider.dart';
import '../constants/AppColors.dart';
import '../models/user_role.dart';
import '../orders/all_orders.dart';
import '../profiles/my_profile.dart';
import '../providers/user_role_provider.dart';
import '../reg/registration.dart';

class AllFreelancersWidget extends StatelessWidget {
  const AllFreelancersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = Provider.of<UserRoleProvider>(context).userRole;
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
          LayoutBuilder(builder: (context, constraints) {
            return MaterialApp(
              home: Scaffold(
                body: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.125),
                    height: 1.0,
                    width: constraints.maxWidth * 0.95,
                    color: AppColors.hintColor,
                  ),
                ),
              ),
            );
          }),
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
            alignment: const FractionalOffset(0.5, 0.97),
            child: SizedBox(
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/freelancers_icon.png'),
                            )
                          ])))),
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
            alignment: const FractionalOffset(0.925, 0.97),
            child: SizedBox(
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                          onTap: () {
                            AppMetrica.activate(const AppMetricaConfig(
                                "045e79e7-d746-49e7-8d17-e4f2e0aab027"));
                            AppMetrica.reportEvent('Переход в аккаунт');
                            print(userRole);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  userRole == UserRole.Guest
                                      ? const RegistrationWidget()
                                      : const MyProfileWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.center,
                              child:
                              Image.asset('assets/images/profile_icon.png'),
                            )
                          ])))),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.075, 0.97),
              child: SizedBox(
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                        color: AppColors.primaryColor,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const AllOrders()),
                              );
                            },
                            splashColor: Colors.transparent,
                            child: Stack(children: [
                              Transform.scale(
                                scale: 1,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/orders_icon.png'),
                              )
                            ])))),
              )),
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
          const Align(
            alignment: FractionalOffset(0.15, 0.1),
            child: Text(
                'Фрилансеры:',
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
          const Align(
              alignment: FractionalOffset(0.75, 0.1),
              child: Text(
                  'Фильтр',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none),
              )),
          Align(
            alignment: const FractionalOffset(0.9, 0.075),
            child: SizedBox(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Material(
                      color: AppColors.backgroundColor,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FreelancerFiltersWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 0.8,
                              alignment: Alignment.center,
                              child:
                              Image.asset('assets/images/order_settings.png'),
                            )
                          ])))),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.225),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FreelancerProfileWidget()),
                    );
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.3,
                          decoration: ShapeDecoration(
                            color: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 3, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.05,
                          child: const Text(
                            'Игорь Игоревич',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          right: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '50\$/час',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.08,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          right: constraints.maxWidth * 0.05,
                          top: constraints.maxHeight * 0.055,
                          width: 60,
                          height: 60,
                          child: SizedBox(
                              child: Material(
                                  color: AppColors.backgroundColor,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const AllOrders()),
                                        );
                                      },
                                      splashColor: Colors.transparent,
                                      child: Stack(children: [
                                        Transform.scale(
                                          scale: 0.6,
                                          alignment: Alignment.center,
                                          child:
                                          Image.asset('assets/images/mark.png'),
                                        )
                                      ])))),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.1,
                          child: const Text(
                              '8 заказов',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.03,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        Positioned(
                          right: constraints.maxWidth * 0.185,
                          top: constraints.maxHeight * 0.1,
                          child: const SizedBox(
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.35,
                          top: constraints.maxHeight * 0.15,
                          child: const Text(
                            'Обо мне:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.19,
                          child: const Text(
                            'Разрабатываю тг ботов на Java',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              'Spring',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.39,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              'Java',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.7,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              'SQL',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.3,
                          top: constraints.maxHeight * 0.22,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 1.5,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.22,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 1.5,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.7),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ViewOrderWidget(OrdersService().getOrders()[0])),
                    // );
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.3,
                          decoration: ShapeDecoration(
                            color: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 3, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.05,
                          child: const Text(
                            'Максим Иванович',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          right: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '5000\$/час',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.08,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          right: constraints.maxWidth * 0.05,
                          top: constraints.maxHeight * 0.055,
                          width: 60,
                          height: 60,
                          child: SizedBox(
                              child: Material(
                                  color: AppColors.backgroundColor,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const AllOrders()),
                                        );
                                      },
                                      splashColor: Colors.transparent,
                                      child: Stack(children: [
                                        Transform.scale(
                                          scale: 0.6,
                                          alignment: Alignment.center,
                                          child:
                                          Image.asset('assets/images/mark.png'),
                                        )
                                      ])))),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.075,
                          top: constraints.maxHeight * 0.1,
                          child: const Text(
                            '1 заказ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          right: constraints.maxWidth * 0.185,
                          top: constraints.maxHeight * 0.1,
                          child: const SizedBox(
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.35,
                          top: constraints.maxHeight * 0.15,
                          child: const Text(
                            'Обо мне:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.19,
                          child: const Text(
                            'Разрабатываю блокчейн системы',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.08,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              'Golang',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.35,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              'Cosmos',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.7,
                          top: constraints.maxHeight * 0.25,
                          child: const SizedBox(
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.04,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.3,
                          top: constraints.maxHeight * 0.22,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 1.5,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.22,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 1.5,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          ),
        ]));
  }
}