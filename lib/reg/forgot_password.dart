import 'package:client/complaints/all_complaints.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';

import '../constants/AppColors.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

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
            alignment: FractionalOffset(0.5, 0.25),
            child: Text(
              'Восстановление доступа',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
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
                                  top: constraints.maxHeight * 0.08,
                                  left: constraints.maxWidth * 0.05),
                              border: const OutlineInputBorder()),
                        )));
              })),
          const Align(
            alignment: FractionalOffset(0.16, 0.35),
            child: SizedBox(
              child: Text(
                'Логин или Email',
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
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.46),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const AllOrders()),
                    // );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Отправить код',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 14,
                    ),
                  ),
                ));
          }),
          const Align(
            alignment: FractionalOffset(0.13, 0.54),
            child: SizedBox(
              child: Text(
                'Код из Email',
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
            alignment: FractionalOffset(0.13, 0.65),
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
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.7),
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
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.79),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllComplaints()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 14,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.5, 0.85),
            child: Material(
                color: AppColors.backgroundColor,
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
