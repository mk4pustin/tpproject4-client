import 'package:client/orders/all_orders.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const AllOrders()),
            );
          }
        },
        child: Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFD7DEC6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(children: [
              const Align(
                alignment: FractionalOffset(0.5, 0.45),
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
                alignment: const FractionalOffset(0.63, 0.55),
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
                alignment: FractionalOffset(0.5, 0.8),
                child: SizedBox(
                  width: 253,
                  height: 40,
                  child: Text(
                    'Свайпните вверх, чтобы начать',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF696969),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              )
            ])
        )
    );
  }
}
