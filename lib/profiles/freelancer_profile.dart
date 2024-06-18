import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/edit_profile.dart';
import 'package:client/reg/registration.dart';
import 'package:client/services/orders/orders_service.dart';
import 'package:flutter/material.dart';

import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../orders/view_order.dart';

class FreelancerProfileWidget extends StatelessWidget {
  const FreelancerProfileWidget({super.key});

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
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                  'assets/images/freelancers_icon.png'),
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
                                  builder: (context) =>
                                      RegistrationWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child:
                                  Image.asset('assets/images/profile_icon.png'),
                            )
                          ])))),
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
                            child: Stack(children: [
                              Transform.scale(
                                scale: 1,
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                    'assets/images/orders_icon.png'),
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
          const Align(
              alignment: FractionalOffset(0.5, 0.0925),
              child: SizedBox(
                child: Text(
                  'Игорь Игоревич',
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
            alignment: FractionalOffset(0.5, 0.11),
            child: Text(
              'в сети',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.15),
            child: Text(
              'Дата регистрации: 22.11.2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.2),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.05,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.1,
                      top: constraints.maxHeight * 0.035,
                      child: const Text(
                        '8 заказов',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                            letterSpacing: -0.50,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.37,
                      top: constraints.maxHeight * 0.035,
                      child: const SizedBox(
                        child: Text(
                          '5 оценка',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.65,
                      top: constraints.maxHeight * 0.035,
                      child: const Text(
                        '50\$/час',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                            letterSpacing: -0.50,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.3),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.15,
                      decoration: ShapeDecoration(
                        color: AppColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.1,
                      top: constraints.maxHeight * 0.08,
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
                      left: constraints.maxWidth * 0.4,
                      top: constraints.maxHeight * 0.08,
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
                      top: constraints.maxHeight * 0.08,
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
                      top: constraints.maxHeight * 0.05,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.57),
                        child: Container(
                          width: 40,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.6,
                      top: constraints.maxHeight * 0.05,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.57),
                        child: Container(
                          width: 40,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.45),
            child: Text(
              'Обо мне',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.9, 0.45),
            child: Text(
              'Жалоба',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C85C5),
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.49),
            child: Text(
              'Разрабатываю тг ботов на Java',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.58,
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
            alignment: FractionalOffset(0.5, 0.62),
            child: Text(
              'Текущий заказ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.74),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewOrderWidget(OrdersService().getOrders()[0])),
                    );
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.2,
                          decoration: ShapeDecoration(
                            color: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 3, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.05,
                          child: const Text(
                            'ТГ-бот',
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
                          left: constraints.maxWidth * 0.65,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '50\$',
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
                          left: constraints.maxWidth * 0.02,
                          top: constraints.maxHeight * 0.1,
                          child: const SizedBox(
                            child: Text(
                              '15 Просмотров',
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
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.5,
                          top: constraints.maxHeight * 0.085,
                          child: const Text(
                            'Дата размещения:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.115,
                          child: const Text(
                            '22.11.2024',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.16,
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
                          top: constraints.maxHeight * 0.16,
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
                          top: constraints.maxHeight * 0.16,
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
                          top: constraints.maxHeight * 0.13,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.13,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.57),
                            child: Container(
                              width: 40,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
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
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.55),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationWidget()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.5,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Предложить заказ',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ));
          }),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.87),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationWidget()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.5,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Обратная связь',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ));
          }),
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
          false ? Align(
            alignment: const FractionalOffset(0.9, 0.065),
            child: SizedBox(
                child: Material(
                    color: AppColors.backgroundColor,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 1,
                            child:
                                Image.asset('assets/images/edit_profile.png'),
                          )
                        ])))),
          ) : const SizedBox.shrink(),
        ]));
  }
}
