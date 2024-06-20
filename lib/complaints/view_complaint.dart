import 'package:client/complaints/all_complaints.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/orders/view_order.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:flutter/material.dart';

import '../constants/AppColors.dart';

class ViewComplaintWidget extends StatelessWidget {
  const ViewComplaintWidget({super.key});

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
            alignment: const FractionalOffset(0.525, 0.97),
            child: SizedBox(
              child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
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
                'Обращения',
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
            alignment: const FractionalOffset(0.99, 0.97),
            child: SizedBox(
              child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (
                          //             context) => const AllComplaints()),
                          //   );
                          // },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.topCenter,
                              child: Image.asset('assets/images/complaint.png'),
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
                                    builder: (
                                        context) => const AllOrders()),
                              );
                            },
                            splashColor: Colors.transparent,
                            child: Stack(children: [
                              Transform.scale(
                                scale: 1,
                                alignment: Alignment.topCenter,
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
          const Align(
            alignment: FractionalOffset(0.5, 0.0875),
            child: Text(
              'Обращение',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.11),
            child: Text(
              '#1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.hintColor,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.175),
            child: Text(
              'Дата размещения: 22.11.2024',
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
            alignment: FractionalOffset(0.5, 0.275),
            child: Text(
              'Описание',
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
            alignment: FractionalOffset(0.5, 0.35),
            child: Text(
              'Заказ оскорбляет чувства верующих',
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
                height: constraints.maxHeight * 0.7,
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
          Align(
            alignment: const FractionalOffset(0.5, 0.83),
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
                      height: constraints.maxHeight * 0.13,
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
                      top: constraints.maxHeight * 0.075,
                      child: const SizedBox(
                        child: Text(
                          'Максим Иванович',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF1B53C1),
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.5,
                      top: constraints.maxHeight * 0.05,
                      child: const SizedBox(
                        child: Text(
                          'Средняя оценка',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.blackTextColor,
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
                      right: constraints.maxWidth * 0.165,
                      top: constraints.maxHeight * 0.0675,
                      width: 40,
                      height: 40,
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
                                      scale: 0.8,
                                      alignment: Alignment.center,
                                      child:
                                      Image.asset('assets/images/mark.png'),
                                    )
                                  ])))),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.6,
                      top: constraints.maxHeight * 0.102,
                      child: const SizedBox(
                        child: Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.blackTextColor,
                              fontSize: 28,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.04,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            }),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.7,
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
          Align(
            alignment: const FractionalOffset(0.5, 0.6),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ViewOrderWidget(OrdersService().getOrders()[0])),
                  //   );
                  // },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.1,
                          decoration: ShapeDecoration(
                            color: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 3, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.375,
                          top: constraints.maxHeight * 0.06,
                          child: const SizedBox(
                            child: Text(
                              'Заказ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF1B53C1),
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          ),
          ResponseButton(),
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
                                  const AllOrders()),
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

class ResponseButton extends StatefulWidget {
  @override
  _ResponseButtonState createState() => _ResponseButtonState();
}

class _ResponseButtonState extends State<ResponseButton> {
  bool _isResponded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: const FractionalOffset(0.5, 0.45),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _isResponded = true;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                constraints.maxWidth * 0.5,
                constraints.maxHeight * 0.05,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                _isResponded ? AppColors.backgroundColor : AppColors.primaryColor
            ),
            side: MaterialStateProperty.all(
                const BorderSide(
                  color: AppColors.primaryColor,
                  width: 3,
                )
            ),
          ),
          child: Text(
            _isResponded ? 'Решено' : 'Решить',
            style: TextStyle(
              color: _isResponded ? AppColors.primaryColor : AppColors.backgroundColor,
            ),
          ),
        ),
      );
    });
  }
}
