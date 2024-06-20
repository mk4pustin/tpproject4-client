import 'package:client/constants/AppColors.dart';
import 'package:client/orders/add_order.dart';
import 'package:client/orders/order_filters.dart';
import 'package:client/orders/view_order.dart';
import 'package:client/profiles/my_profile.dart';
import 'package:client/reg/entrance.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../integration/rest/freelance_finder/dto/order.dart';
import '../models/user_role.dart';
import '../providers/user_role_provider.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  late Future<List<Order>?> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _fetchOrders();
  }

  Future<List<Order>?>  _fetchOrders() async {
    try {
      final orders = await FreelanceFinderService.instance.fetchAllOrders();
      return orders;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRole = Provider.of<UserRoleProvider>(context).userRole;

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
          const Align(
            alignment: FractionalOffset(0.05, 0.18),
            child: SizedBox(
              width: 140,
              height: 32,
              child: Text(
                'Заказы:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackTextColor,
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
          const Align(
              alignment: FractionalOffset(0.85, 0.18),
              child: SizedBox(
                width: 121,
                height: 40,
                child: Text(
                  'Фильтр',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                      letterSpacing: -0.50,
                      decoration: TextDecoration.none),
                ),
              )),
          Align(
            alignment: const FractionalOffset(0.92, 0.15),
            child: SizedBox(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Material(
                      color: AppColors.backgroundColor,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrderFiltersWidget()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 0.8,
                              alignment: Alignment.center,
                              child: Image.asset(
                                  'assets/images/order_settings.png'),
                            )
                          ])))),
            ),
          ),
          FutureBuilder(
              future: _ordersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                } else if (snapshot.hasError) {
                  return const SizedBox.shrink();
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox.shrink();
                } else {
                  final orders = snapshot.data!;
                  return ListView.builder(
                      itemCount: orders.length,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: AspectRatio(
                                aspectRatio: 2 / 1,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  return SizedBox(
                                      child: Stack(children: [
                                    Container(
                                      decoration: ShapeDecoration(
                                        color: AppColors.backgroundColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            width: 3,
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: constraints.maxWidth * 0.1,
                                      top: constraints.maxHeight * 0.22,
                                      child: Text(
                                        orders[index].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.08,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Positioned(
                                      right: constraints.maxWidth * 0.1,
                                      top: constraints.maxHeight * 0.25,
                                      child: SizedBox(
                                        child: Text(
                                          "${orders[index].price} ₽",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColors.blackTextColor,
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
                                      left: constraints.maxWidth * 0.1,
                                      top: constraints.maxHeight * 0.475,
                                      child: SizedBox(
                                        child: Text(
                                          "${orders[index].responsesCount} откликов",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColors.blackTextColor,
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
                                      right: constraints.maxWidth * 0.1,
                                      top: constraints.maxHeight * 0.475,
                                      child: Text(
                                        orders[index].creationDate,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.09,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Positioned(
                                      top: constraints.maxHeight * 0.78,
                                      right: orders[index].skills.isNotEmpty
                                          ? constraints.maxWidth * 0.75
                                          : constraints.maxWidth * 0.8,
                                      child: SizedBox(
                                        child: Text(
                                          orders[index].skills.isNotEmpty
                                              ? orders[index].skills[0]
                                              : '—',
                                          style: const TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.04,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: constraints.maxHeight * 0.78,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: SizedBox(
                                          child: Text(
                                            orders[index].skills.length >= 2
                                                ? orders[index].skills[1]
                                                : '—',
                                            style: const TextStyle(
                                              color: AppColors.blackTextColor,
                                              fontSize: 22,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              height: 0.04,
                                              letterSpacing: -0.50,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: orders[index].skills.length >= 3
                                      ? constraints.maxWidth * 0.7
                                          : constraints.maxWidth * 0.8,
                                      top: constraints.maxHeight * 0.78,
                                      child: SizedBox(
                                        child: Text(
                                          orders[index].skills.length >= 3
                                              ? orders[index].skills[2]
                                              : '—',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColors.blackTextColor,
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
                                      left: constraints.maxWidth * 0.35,
                                      top: constraints.maxHeight * 0.65,
                                      child: Transform(
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 0.0)
                                          ..rotateZ(1.57),
                                        child: Container(
                                          width: 40,
                                          decoration: const ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1.5,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: constraints.maxWidth * 0.66,
                                      top: constraints.maxHeight * 0.65,
                                      child: Transform(
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 0.0)
                                          ..rotateZ(1.57),
                                        child: Container(
                                          width: 40,
                                          decoration: const ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1.5,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                        color: Colors.transparent,
                                        child: InkWell(onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewOrderWidget(
                                                        orders[index]),
                                              ));
                                        })),
                                  ]));
                                })));
                      });
                }
              }),
          userRole == UserRole.Customer || userRole == UserRole.Guest
              ? Align(
                  alignment: const FractionalOffset(0.97, 0.0575),
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
                                            userRole == UserRole.Guest
                                                ? const EntranceWidget()
                                                : const AddOrderWidget()),
                                  );
                                },
                                splashColor: Colors.transparent,
                                child: Stack(children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        'assets/images/add_order.png'),
                                  )
                                ])))),
                  ),
                )
              : const SizedBox.shrink(),
          Align(
              alignment:
                  userRole == UserRole.Customer || userRole == UserRole.Guest
                      ? const FractionalOffset(0.2, 0.06)
                      : const FractionalOffset(0.5, 0.06),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: SizedBox(
                        width: userRole == UserRole.Customer ||
                                userRole == UserRole.Guest
                            ? constraints.maxWidth * 0.8
                            : constraints.maxWidth * 0.95,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: constraints.maxHeight * 0.01,
                                    left: constraints.maxWidth * 0.05),
                                hintText: 'Найти: ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                )))));
              })),
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
                                      userRole == UserRole.Guest
                                          ? const RegistrationWidget()
                                          : const MyProfileWidget()),
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
        ]));
  }
}
