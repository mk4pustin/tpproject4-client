import 'package:client/orders/all_orders.dart';
import 'package:flutter/material.dart';

import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../reg/registration.dart';

class FreelancerFiltersWidget extends StatelessWidget {
  const FreelancerFiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isDevelopment = false;
    var isTesting = false;
    var isAdmin = false;
    var isDesign = false;
    var isContent = false;
    var isMarketing = false;
    var isMiscellaneous = false;

    var hasResponse = false;
    var hasPrice = false;
    var hasInfo = false;

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
                                  builder: (
                                      context) => const AllFreelancersWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.center,
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
                                  builder: (
                                      context) => RegistrationWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/profile_icon.png'),
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
              alignment: FractionalOffset(0.5, 0.087),
              child: SizedBox(
                child: Text(
                  'Фильтры',
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
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.55,
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
          const Align(
              alignment: FractionalOffset(0.5, 0.63),
              child: Text(
                'Дополнительно',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.03,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              )),
          Align(
              alignment: const FractionalOffset(0.05, 0.68),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: hasResponse,
                    onChanged: (value) {
                      setState(() {
                        hasResponse = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.38, 0.68),
            child: Text(
              'От имеющих отзывы',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.73),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: hasPrice,
                    onChanged: (value) {
                      setState(() {
                        hasPrice = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.53, 0.728),
            child: Text(
              'С указанной стоимостью',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.78),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: hasPrice,
                    onChanged: (value) {
                      setState(() {
                        hasPrice = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.25, 0.773),
            child: Text(
              'С портфолио',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.73),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: hasInfo,
                    onChanged: (value) {
                      setState(() {
                        hasInfo = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
              alignment: FractionalOffset(0.5, 0.18),
              child: SizedBox(
                width: 291,
                height: 36,
                child: Text(
                  'Сфера деятельности',
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
          Align(
              alignment: const FractionalOffset(0.05, 0.2),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isDevelopment,
                    onChanged: (value) {
                      setState(() {
                        isDevelopment = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.23, 0.228),
            child: Text(
              'Разработка',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.25),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isTesting,
                    onChanged: (value) {
                      setState(() {
                        isTesting = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.25, 0.275),
            child: Text(
              'Тестирование',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.3),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isAdmin,
                    onChanged: (value) {
                      setState(() {
                        isAdmin = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.38, 0.323),
            child: Text(
              'Администрирование',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.35),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isDesign,
                    onChanged: (value) {
                      setState(() {
                        isDesign = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.2, 0.368),
            child: Text(
              'Дизайн',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.4),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isContent,
                    onChanged: (value) {
                      setState(() {
                        isContent = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.2, 0.416),
            child: Text(
              'Контент',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.45),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isMarketing,
                    onChanged: (value) {
                      setState(() {
                        isMarketing = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.23, 0.464),
            child: Text(
              'Маркетинг',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.05, 0.5),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Material(
                  color: AppColors.backgroundColor,
                  child: Checkbox(
                    value: isMiscellaneous,
                    onChanged: (value) {
                      setState(() {
                        isMiscellaneous = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.208, 0.51),
            child: Text(
              'Разное',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.85),
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
                        constraints.maxWidth * 0.5,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Применить',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.05, 0.05),
            child: SizedBox(
                child: Material(
                    color: AppColors.backgroundColor,
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
                            scale: 0.8,
                            child: Image.asset('assets/images/back.png'),
                          )
                        ])))),
          ),
        ]));
  }
}
