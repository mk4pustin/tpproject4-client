import 'package:client/constants/AppColors.dart';
import 'package:client/orders/all_orders.dart';
import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {

    AppMetrica.activate(AppMetricaConfig("045e79e7-d746-49e7-8d17-e4f2e0aab027"));
    AppMetrica.reportEvent('Установка');
    AppMetrica.reportEvent('Запуск');
    AppMetrica.reportEvent('Event1');
    AppMetrica.reportEvent('Event2');
    AppMetrica.reportEvent('Event3');

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
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(children: [
              const Align(
                alignment: FractionalOffset(0.5, 0.5),
                child: Text(
                  'FREELANCEFINDER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blackTextColor,
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
                alignment: const FractionalOffset(0.625, 0.6),
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-3.14),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const ShapeDecoration(
                      color: AppColors.primaryColor,
                      shape: StarBorder.polygon(side: BorderSide(width: 1), sides: 3),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: FractionalOffset(0.5, 0.9),
                child: SizedBox(
                  width: 253,
                  height: 40,
                  child: Text(
                    'Свайпните вверх, чтобы начать',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.hintColor,
                      fontSize: 14,
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
                alignment: const FractionalOffset(0.7, 0.95),
                child: SizedBox(
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                    },
                    child: CustomPaint(
                      size: const Size(150, 50),
                      painter: ArrowPainter(),
                    ),
                  ),
                ),
              )
            ])
        )
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.hintColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const horizontalPadding = 1 / 1000;
    final arrowLength = size.height / 3;
    final arrowWidth = size.width / 3;

    canvas.drawLine(Offset(horizontalPadding, arrowLength / 2),
        Offset(arrowWidth / 2, 0), paint);
    canvas.drawLine(Offset(arrowWidth - horizontalPadding, arrowLength / 2),
        Offset(arrowWidth / 2, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
