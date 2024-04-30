import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';

import '../freelancers/all_freelancers.dart';
import '../start_page.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

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
                              builder: (context) =>
                              const AllFreelancersWidget()),
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
                                builder: (context) => const StartPage()),
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
          const Align(
              alignment: FractionalOffset(0.65, 0.087),
              child: SizedBox(
                child: Text(
                  'Редактирование профиля',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.03,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none),
                ),
              )),
          const Align(
            alignment: FractionalOffset(0.15, 0.15),
            child: SizedBox(
              child: Text(
                'Имя пользователя',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.18),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration:
                          InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.08,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.13, 0.25),
            child: SizedBox(
              child: Text(
                'Текущий пароль',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.28),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: constraints.maxHeight * 0.3,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.13, 0.35),
            child: SizedBox(
              child: Text(
                'Новый пароль',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.39),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.01,
                                  left: constraints.maxWidth * 0.01),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.12, 0.47),
            child: SizedBox(
              child: Text(
                'Обо мне',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.54),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.10,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.01,
                              bottom: constraints.maxHeight * 0.06,
                              left: constraints.maxWidth * 0.01),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.2, 0.63),
            child: SizedBox(
              child: Text(
                'Контактная информация',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.68),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.01,
                                  left: constraints.maxWidth * 0.01),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.14, 0.74),
            child: SizedBox(
              child: Text(
                'Стоимость',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
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
              alignment: const FractionalOffset(0.5, 0.8),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration:
                          InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.08,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.87),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationWidget()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.5,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF7B9B6B)),
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                      color: Colors.black,
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
                      color: Color(0xFF9E9E9E),
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
                    color: const Color(0xFFD8DEC6),
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
                            scale: 0.8,
                            child: Image.asset('assets/images/back.png'),
                          )
                        ])))),
          ),
        ]));
  }
}
