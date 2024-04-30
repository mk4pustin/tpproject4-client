import 'package:client/complaints/view_complaint.dart';
import 'package:client/freelancers/all_freelancers.dart';
import 'package:flutter/material.dart';

class AllComplaints extends StatelessWidget {
  const AllComplaints({super.key});

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
                'Обращения',
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
                                builder: (context) =>
                                    const AllComplaints()),
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Stack(children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Image.asset('assets/images/complaint.png'),
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
            alignment: FractionalOffset(0.15, 0.08),
            child: Text(
              'Обращения: ',
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
            alignment: const FractionalOffset(0.5, 0.25),
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewComplaintWidget()),
                    );
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxHeight * 0.15,
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
                            'Инициатор 1',
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
                            '#11090',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.1,
                          child: const SizedBox(
                            child: Text(
                              'Заказ оскорбляет чувства верующих',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0.03,
                                  letterSpacing: -0.50,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                  //       Positioned(
                  //         left: 0.05,
                  //         height: 0.05,
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  // // Navigator.push(
                  //             // context,
                  //             // MaterialPageRoute(
                  //             // builder: (context) => const AllOrders()),
                  //             // );
                  //           },
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //     MaterialStateProperty.all(const Color(0xFF7B9B6B)),
                  //   ),
                  //   child: const Text(
                  //     'Откликнуться',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  //       )
                      ],
                    ),
                  ));
            }),
          ),
        ]));
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
