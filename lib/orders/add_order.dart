import 'package:client/orders/all_orders.dart';
import 'package:client/reg/registration.dart';
import 'package:client/services/orders/orders_service.dart';
import 'package:flutter/material.dart';

import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../services/orders/dto/order.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget({super.key});

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
                              alignment: Alignment.center,
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
            alignment: const FractionalOffset(0.925, 0.97),
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
                                  builder: (context) =>
                                      const RegistrationWidget()),
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
                                    builder: (context) => const AllOrders()),
                              );
                            },
                            splashColor: Colors.transparent,
                            child: Stack(children: [
                              Transform.scale(
                                scale: 1,
                                alignment: Alignment.center,
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
              alignment: FractionalOffset(0.5, 0.087),
              child: SizedBox(
                child: Text(
                  'Размещение заказа',
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
            alignment: FractionalOffset(0.15, 0.17),
            child: SizedBox(
              child: Text(
                'Название заказа',
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
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
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
                            ))));
              })),
          const Align(
            alignment: FractionalOffset(0.13, 0.28),
            child: SizedBox(
              child: Text(
                'Описание',
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
              alignment: const FractionalOffset(0.5, 0.36),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.15,
                        child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: constraints.maxHeight * 0.33,
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
                            ))));
              })),
          const Align(
            alignment: FractionalOffset(0.2, 0.5),
            child: SizedBox(
              child: Text(
                'Сфера деятельности',
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
              alignment: const FractionalOffset(0.5, 0.55),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.85,
                    height: constraints.maxHeight * 0.05,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.01,
                          left: constraints.maxWidth * 0.3,
                        ),
                        hintText: 'Выберите...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>[
                        'Разработка',
                        'Тестирование',
                        'Администрирование',
                        'Маркетинг'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {}
                      },
                    ),
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.18, 0.62),
            child: SizedBox(
              child: Text(
                'Ключевые навыки',
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
                            ))));
              })),
          const Align(
            alignment: FractionalOffset(0.14, 0.74),
            child: SizedBox(
              child: Text(
                'Стоимость',
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
              alignment: const FractionalOffset(0.5, 0.8),
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
                            ))));
              })),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.87),
                child: ElevatedButton(
                  onPressed: () {
                    OrdersService().addOrder(Order('Блокчейн система', '2500\$',
                        '0', '29.05.2024', ['Go', 'gRPC', 'Cosmos']));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllOrders()),
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
                    'Создать',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.05, 0.05),
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
                                  builder: (context) => const AllOrders()),
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
        ]));
  }
}
