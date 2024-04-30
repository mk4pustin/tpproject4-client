import 'dart:convert';

import 'package:client/freelancers/all_freelancers.dart';
import 'package:client/orders/add_order.dart';
import 'package:client/orders/order_filters.dart';
import 'package:client/orders/view_order.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';

import 'models/order.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
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
                              builder: (
                                  context) => const AllFreelancersWidget()),
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
                                builder: (context) => const RegistrationWidget()),
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
            alignment: FractionalOffset(0.05, 0.18),
            child: SizedBox(
              width: 140,
              height: 32,
              child: Text(
                'Заказы:',
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
          ),
          Align(
            alignment: const FractionalOffset(0.97, 0.05),
            child: SizedBox(
                child: Material(
                    color: const Color(0xFFD8DEC6),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddOrderWidget()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Image.asset('assets/images/add_order.png'),
                          )
                        ])))),
          ),
          const Align(
              alignment: FractionalOffset(0.85, 0.18),
              child: SizedBox(
                width: 121,
                height: 40,
                child: Text(
                  'Фильтр',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none),
                ),
              )),
          Align(
            alignment: const FractionalOffset(0.95, 0.145),
            child: SizedBox(
                child: Material(
                    color: const Color(0xFFD8DEC6),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrderFiltersWidget()),
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
            alignment: const FractionalOffset(0.5, 0.25),
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
                          height: constraints.maxHeight * 0.2,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
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
                          left: constraints.maxWidth * 0.65,
                          top: constraints.maxHeight * 0.05,
                          child: const SizedBox(
                            child: Text(
                              '50\$',
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
                          left: constraints.maxWidth * 0.02,
                          top: constraints.maxHeight * 0.1,
                          child: const SizedBox(
                            child: Text(
                              '15 Просмотров',
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
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.5,
                          top: constraints.maxHeight * 0.085,
                          child: const Text(
                            'Дата размещения:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
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
                                color: Colors.black,
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
                          top: constraints.maxHeight * 0.16,
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
                          top: constraints.maxHeight * 0.16,
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
          Align(
            alignment: const FractionalOffset(0.5, 0.55),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.2,
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
                        'Сервер аренды книг',
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
                      left: constraints.maxWidth * 0.65,
                      top: constraints.maxHeight * 0.05,
                      child: const SizedBox(
                        child: Text(
                          '1150\$',
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
                      left: constraints.maxWidth * 0.02,
                      top: constraints.maxHeight * 0.1,
                      child: const SizedBox(
                        child: Text(
                          '10 Просмотров',
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
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.5,
                      top: constraints.maxHeight * 0.085,
                      child: const Text(
                        'Дата размещения:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
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
                        '21.11.2024',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
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
                      top: constraints.maxHeight * 0.16,
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
                      top: constraints.maxHeight * 0.16,
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
              );
            }),
          ),
          Align(
              alignment: const FractionalOffset(0.2, 0.055),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.01,
                                  left: constraints.maxWidth * 0.05),
                              hintText: 'Найти: ',
                              border: const OutlineInputBorder()),
                        )));
              })),
        ]));
  }

  List<Order> fetchOrders() {
    const responseBody =
        '[{"title": "Order 1", "price": "100\$", "responses": 10, "postDate": "2024-04-29", "tags": ["Tag1", "Tag2"]}, {"title": "Order 2", "price": "150\$", "responses": 15, "postDate": "2024-04-28", "tags": ["Tag3", "Tag4"]}]';

    List jsonResponse = json.decode(responseBody);
    return jsonResponse.map((data) => Order.fromJson(data)).toList();
  }
}

// class OrderWidget extends StatelessWidget {
//   // final double left;
//   // final double top;
//   // final double width;
//   // final double height;
//
//   final Order orderData;
//
//   const OrderWidget({super.key,
//     required this.orderData,
//     // required this.left,
//     // required this.top,
//     // required this.width,
//     // required this.height
//     });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width * 0.9,
//           height: MediaQuery.of(context).size.height * 0.3,
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 24,
//                 top: 200,
//                 child: Container(
//                   width: 302,
//                   height: 140,
//                   decoration: ShapeDecoration(
//                     color: Color(0xFFD9D9D9),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 12,
//                 top: 10,
//                 child: SizedBox(
//                   width: 140,
//                   height: 32,
//                   child: Text(
//                     orderData.title,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.08,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 175,
//                 top: 10,
//                 child: SizedBox(
//                   width: 140,
//                   height: 32,
//                   child: Text(
//                     orderData.price,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.08,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 34,
//                 child: SizedBox(
//                   width: 94,
//                   height: 55,
//                   child: Text(
//                     orderData.responses.toString(),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.03,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 54,
//                 top: 47,
//                 child: SizedBox(
//                   width: 83,
//                   height: 29,
//                   child: Text(
//                     'Откликов',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.09,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 183,
//                 top: 47,
//                 child: Text(
//                   'Дата размещения: ${orderData.postDate}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w400,
//                     height: 0.09,
//                     letterSpacing: -0.50,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 32,
//                 top: 82,
//                 child: SizedBox(
//                   width: 88,
//                   height: 58,
//                   child: Text(
//                     orderData.tags.isNotEmpty ? orderData.tags[0] : '-',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.04,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 130,
//                 top: 81,
//                 child: SizedBox(
//                   width: 88,
//                   height: 58,
//                   child: Text(
//                     orderData.tags.length > 1 ? orderData.tags[1] : '-',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.04,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 228,
//                 top: 82,
//                 child: SizedBox(
//                   width: 88,
//                   height: 58,
//                   child: Text(
//                     orderData.tags.length > 2 ? orderData.tags[2] : '-',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       height: 0.04,
//                       letterSpacing: -0.50,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 124,
//                 top: 91,
//                 child: Transform(
//                   transform: Matrix4.identity()
//                     ..translate(0.0, 0.0)
//                     ..rotateZ(1.57),
//                   child: Container(
//                     width: 40,
//                     decoration: ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 1,
//                           strokeAlign: BorderSide.strokeAlignCenter,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 223,
//                 top: 91,
//                 child: Transform(
//                   transform: Matrix4.identity()
//                     ..translate(0.0, 0.0)
//                     ..rotateZ(1.57),
//                   child: Container(
//                     width: 40,
//                     decoration: ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 1,
//                           strokeAlign: BorderSide.strokeAlignCenter,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
