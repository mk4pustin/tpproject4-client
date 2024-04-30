import 'package:client/freelancers/freelancers_filters.dart';
import 'package:client/orders/view_order.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:flutter/material.dart';

import '../orders/all_orders.dart';

class AllFreelancersWidget extends StatelessWidget {
  const AllFreelancersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFD7DEC6),
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
                color: Color(0xFF7B9B6B),
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
                  color: Colors.black,
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
            alignment: const FractionalOffset(0.49, 0.96),
            child: SizedBox(
              child: Material(
                  color: const Color(0xFF7B9B6B),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllFreelancersWidget()),
                        );
                      },
                      splashColor: Colors.transparent,
                      child: Stack(children: [
                        Transform.scale(
                          scale: 1.1,
                          child:
                          Image.asset('assets/images/freelancers_icon.png'),
                        )
                      ]))),
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
                  color: Colors.black,
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
            alignment: const FractionalOffset(0.91, 0.96),
            child: SizedBox(
                child: Material(
                    color: const Color(0xFF7B9B6B),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FreelancerProfileWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Image.asset('assets/images/profile.png'),
                          )
                        ])))),
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
                  color: Colors.black,
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
            alignment: const FractionalOffset(0.09, 0.96),
            child: SizedBox(
                child: Material(
                    color: const Color(0xFF7B9B6B),
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
                            scale: 1.1,
                            child: Image.asset('assets/images/orders_icon.png'),
                          )
                        ])))),
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
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              );
            },
          ),
          const Align(
            alignment: FractionalOffset(0.15, 0.08),
            child: Text(
                'Фрилансеры:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
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
              alignment: FractionalOffset(0.75, 0.08),
              child: Text(
                  'Фильтр',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none),
              )),
          Align(
            alignment: const FractionalOffset(0.9, 0.048),
            child: SizedBox(
                child: Material(
                    color: const Color(0xFFD8DEC6),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FreelancerFiltersWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 0.6,
                            child:
                            Image.asset('assets/images/order_settings.png'),
                          )
                        ])))),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.2),
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
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.05,
                          top: constraints.maxHeight * 0.05,
                          child: const Text(
                            'Игорь Игоревич',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '50\$/час',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
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
                          left: constraints.maxWidth * 0.65,
                          top: constraints.maxHeight * 0.08,
                          child: SizedBox(
                              child: Material(
                                  color: const Color(0xFFD9D9D9),
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
                                          scale: 0.5,
                                          child:
                                          Image.asset('assets/images/mark.png'),
                                        )
                                      ])))),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.1,
                          child: const Text(
                              '8 заказов',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.03,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        Positioned(
                          left: constraints.maxWidth * 0.62,
                          top: constraints.maxHeight * 0.12,
                          child: const SizedBox(
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
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
                          left: constraints.maxWidth * 0.5,
                          top: constraints.maxHeight * 0.08,
                          child: const SizedBox(
                            child: Text(
                              'Средняя оценка',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
                                color: Colors.black,
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
                                color: Colors.black,
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
          Align(
            alignment: const FractionalOffset(0.5, 0.7),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewOrderWidget()),
                    );
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.3,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.05,
                          top: constraints.maxHeight * 0.05,
                          child: const Text(
                            'Максим Иванович',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.6,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '5000\$/час',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
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
                          left: constraints.maxWidth * 0.65,
                          top: constraints.maxHeight * 0.08,
                          child: SizedBox(
                              child: Material(
                                  color: const Color(0xFFD9D9D9),
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
                                          scale: 0.5,
                                          child:
                                          Image.asset('assets/images/mark.png'),
                                        )
                                      ])))),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.1,
                          child: const Text(
                            '1 заказ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.03,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.62,
                          top: constraints.maxHeight * 0.12,
                          child: const SizedBox(
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
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
                          left: constraints.maxWidth * 0.5,
                          top: constraints.maxHeight * 0.08,
                          child: const SizedBox(
                            child: Text(
                              'Средняя оценка',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
                                color: Colors.black,
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
                                color: Colors.black,
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
        ]));
  }
}