import 'package:client/orders/all_orders.dart';
import 'package:client/reg/forgot_password.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';

class EntranceWidget extends StatelessWidget {
  const EntranceWidget({super.key});

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
          const Align(
            alignment: FractionalOffset(0.5, 0.2),
            child: Text(
              'FREELANCEFINDER',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
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
                  color: Color(0xFF7B9B6B),
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
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0.03,
                letterSpacing: -0.50,
                decoration: TextDecoration.none
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
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.08,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.16, 0.4),
            child: SizedBox(
              child: Text(
                'Логин или Email',
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
          const Align(
            alignment: FractionalOffset(0.13, 0.52),
            child: SizedBox(
              child: Text(
                'Пароль',
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
              alignment: const FractionalOffset(0.5, 0.57),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.08,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          Align(
            alignment: const FractionalOffset(0.13, 0.64),
            child: Material(
                color: const Color(0xFFD8DEC6),
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
                alignment: const FractionalOffset(0.5, 0.73),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllOrders()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.6,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF7B9B6B)),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.5, 0.8),
            child: Material(
                color: const Color(0xFFD8DEC6),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationWidget()),
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
}
