import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:client/integration/rest/freelance_finder/client/client.dart';
import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';
import 'package:client/models/user_role.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/edit_profile.dart';
import 'package:client/providers/token_provider.dart';
import 'package:client/providers/user_id_provider.dart';
import 'package:client/providers/user_role_provider.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../complaints/all_complaints.dart';
import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/dto/order.dart';
import '../orders/view_order.dart';

class MyProfileWidget extends StatefulWidget {
  final int? currentUserId;
  final RegistrationResponseDTO? user;
  final bool? isMyProfile;
  final Order? activeOrder;

  const MyProfileWidget(
      this.currentUserId, this.user, this.isMyProfile, this.activeOrder,
      {super.key});

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  late Future<RegistrationResponseDTO?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture =
        widget.user != null ? Future.value(widget.user!) : _fetchUser();
  }

  Future<RegistrationResponseDTO?> _fetchUser() async {
    final user = await FreelanceFinderService.instance
        .getUserById(widget.currentUserId!);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final currentRole = Provider.of<UserRoleProvider>(context).userRole;
    final token = Provider.of<TokenProvider>(context).token;

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
          FutureBuilder(
              future: _userFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                } else if (snapshot.hasError) {
                  return const SizedBox.shrink();
                } else if (!snapshot.hasData) {
                  return const SizedBox.shrink();
                } else {
                  final user = snapshot.data!;
                  final userRole = getUserRoleFromString(user.role.name);
                  final isMyProfile = user.id == widget.currentUserId;
                  final activeOrder =
                      widget.activeOrder ?? findActiveOrder(user.orders);
                  final currentUserRole =
                      Provider.of<UserRoleProvider>(context).userRole;

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
                          return Scaffold(
                            body: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: constraints.maxHeight * 0.125),
                                height: 1.0,
                                width: constraints.maxWidth * 0.95,
                                color: AppColors.hintColor,
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
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1)),
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
                                            alignment: Alignment.topCenter,
                                            child: Image.asset(
                                                'assets/images/freelancers_icon.png'),
                                          )
                                        ])))),
                          ),
                        ),
                        currentUserRole != UserRole.Admin
                            ? const Align(
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
                              )
                            : const Align(
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
                        currentUserRole != UserRole.Admin
                            ? Align(
                                alignment: const FractionalOffset(0.98, 0.97),
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
                                                      builder: (context) =>
                                                          !isMyProfile
                                                              ? widget.currentUserId ==
                                                                      null
                                                                  ? const RegistrationWidget()
                                                                  : MyProfileWidget(
                                                                      widget
                                                                          .currentUserId,
                                                                      null,
                                                                      true,
                                                                      null)
                                                              : MyProfileWidget(
                                                                  widget
                                                                      .currentUserId,
                                                                  null,
                                                                  null,
                                                                  null)),
                                                );
                                              },
                                              splashColor: Colors.transparent,
                                              child: Stack(children: [
                                                Transform.scale(
                                                  scale: 1,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Image.asset(
                                                      'assets/images/profile_icon.png'),
                                                )
                                              ])))),
                                ),
                              )
                            : Align(
                                alignment: const FractionalOffset(0.99, 0.97),
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
                                                      builder: (context) =>
                                                          AllComplaints(token!)),
                                                );
                                              },
                                              splashColor: Colors.transparent,
                                              child: Stack(children: [
                                                Transform.scale(
                                                  scale: 1,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Image.asset(
                                                      'assets/images/complaint.png'),
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
                                                  builder: (context) =>
                                                      const AllOrders()),
                                            );
                                          },
                                          splashColor: Colors.transparent,
                                          child: Stack(children: [
                                            Transform.scale(
                                              scale: 1,
                                              alignment: Alignment.topCenter,
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
                        Align(
                            alignment: const FractionalOffset(0.5, 0.0925),
                            child: SizedBox(
                              child: Text(
                                user.username,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
                          alignment: FractionalOffset(0.5, 0.11),
                          child: Text(
                            'в сети',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Align(
                          alignment: const FractionalOffset(0.5, 0.15),
                          child: Text(
                            'Дата регистрации: ${user.registrationDate}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Align(
                          alignment: const FractionalOffset(0.5, 0.175),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return SizedBox(
                              child: Stack(
                                children: [
                                  Container(
                                    width: constraints.maxWidth * 0.9,
                                    height: constraints.maxHeight * 0.08,
                                    decoration: ShapeDecoration(
                                      color: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 3,
                                            color: AppColors.primaryColor),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: constraints.maxWidth * 0.1,
                                    top: constraints.maxHeight * 0.044,
                                    child: Text(
                                      user.ordersCount.toString() + ' заказов',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.backgroundColor,
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          height: 0.08,
                                          letterSpacing: -0.50,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                  Positioned(
                                    right: constraints.maxWidth * 0.1,
                                    top: constraints.maxHeight * 0.044,
                                    child: SizedBox(
                                      child: Text(
                                        user.rating == null
                                            ? 'нет рейтинга'
                                            : user.rating.toString() +
                                                ' рейтинг',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColors.backgroundColor,
                                            fontSize: 16,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.08,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ),
                                  userRole == UserRole.Freelancer
                                      ? Positioned(
                                          left: constraints.maxWidth * 0.37,
                                          top: constraints.maxHeight * 0.044,
                                          child: Text(
                                            "${user.price == null
                                                    ? '— '
                                                    : user.price.toString()} ₽",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color:
                                                    AppColors.backgroundColor,
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                height: 0.08,
                                                letterSpacing: -0.50,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          }),
                        ),
                        userRole == UserRole.Freelancer
                            ? Align(
                                alignment: const FractionalOffset(0.5, 0.3),
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  return SizedBox(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: constraints.maxWidth * 0.9,
                                          height: constraints.maxHeight * 0.15,
                                          decoration: ShapeDecoration(
                                            color: AppColors.backgroundColor,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 3,
                                                  color:
                                                      AppColors.primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: user.skills.isNotEmpty
                                              ? constraints.maxWidth * 0.7
                                              : constraints.maxWidth * 0.8,
                                          top: constraints.maxHeight * 0.08,
                                          child: SizedBox(
                                            child: Text(
                                              user.skills.isNotEmpty
                                                  ? user.skills[0]
                                                  : '—',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontSize: 22,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.04,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: constraints.maxHeight * 0.08,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: SizedBox(
                                              child: Text(
                                                user.skills.length >= 2
                                                    ? user.skills[1]
                                                    : '—',
                                                style: const TextStyle(
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontSize: 22,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.04,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: user.skills.length >= 3
                                              ? constraints.maxWidth * 0.675
                                              : constraints.maxWidth * 0.775,
                                          top: constraints.maxHeight * 0.08,
                                          child: SizedBox(
                                            child: Text(
                                              user.skills.length >= 3
                                                  ? user.skills[2]
                                                  : '—',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontSize: 22,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.04,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: constraints.maxWidth * 0.3,
                                          top: constraints.maxHeight * 0.05,
                                          child: Transform(
                                            transform: Matrix4.identity()
                                              ..translate(0.0, 0.0)
                                              ..rotateZ(1.57),
                                            child: Container(
                                              width: 40,
                                              decoration: const ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
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
                                          left: constraints.maxWidth * 0.6,
                                          top: constraints.maxHeight * 0.05,
                                          child: Transform(
                                            transform: Matrix4.identity()
                                              ..translate(0.0, 0.0)
                                              ..rotateZ(1.57),
                                            child: Container(
                                              width: 40,
                                              decoration: const ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1.5,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignCenter,
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
                              )
                            : const SizedBox.shrink(),
                        Align(
                          alignment: userRole == UserRole.Freelancer
                              ? const FractionalOffset(0.5, 0.45)
                              : const FractionalOffset(0.5, 0.3),
                          child: const Text(
                            'Обо мне',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Align(
                            alignment: userRole == UserRole.Freelancer
                                ? const FractionalOffset(0.5, 0.49)
                                : const FractionalOffset(0.5, 0.35),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                user.aboutMe == null
                                    ? 'Тут пока пусто...'
                                    : user.aboutMe!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.blackTextColor,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                    letterSpacing: -0.50,
                                    decoration: TextDecoration.none),
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        !isMyProfile && currentUserRole != UserRole.Admin
                            ? Align(
                                alignment: userRole == UserRole.Freelancer
                                    ? const FractionalOffset(0.9, 0.45)
                                    : const FractionalOffset(0.9, 0.3),
                                child: const Text(
                                  'Жалоба',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF6C85C5),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                      letterSpacing: -0.50,
                                      decoration: TextDecoration.none),
                                ),
                              )
                            : const SizedBox.shrink(),
                        isMyProfile && activeOrder != null ? Align(
                          alignment: userRole == UserRole.Freelancer
                              ? const FractionalOffset(0.9, 0.55)
                              : const FractionalOffset(0.9, 0.55),
                          child: const Text(
                            'Отклики',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF6C85C5),
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                                letterSpacing: -0.50,
                                decoration: TextDecoration.none),
                          ),
                        ) : const SizedBox.shrink(),
                        activeOrder != null
                            ? Align(
                                alignment: userRole == UserRole.Freelancer
                                    ? const FractionalOffset(0.5, 0.55)
                                    : const FractionalOffset(0.5, 0.55),
                                child: const Text(
                                  'Текущий заказ',
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
                              )
                            : const SizedBox.shrink(),
                        activeOrder != null
                            ? Align(
                                alignment: userRole == UserRole.Freelancer
                                    ? const FractionalOffset(0.5, 0.625)
                                    : const FractionalOffset(0.5, 0.75),
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewOrderWidget(activeOrder)),
                                        );
                                      },
                                      child: SizedBox(
                                          child: Stack(children: [
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 20.0),
                                            child: AspectRatio(
                                                aspectRatio: 2 / 1,
                                                child: LayoutBuilder(builder:
                                                    (context, constraints) {
                                                  return SizedBox(
                                                      child: Stack(children: [
                                                    Container(
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: AppColors
                                                            .backgroundColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side:
                                                              const BorderSide(
                                                            width: 3,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left:
                                                          constraints.maxWidth *
                                                              0.1,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.22,
                                                      child: Text(
                                                        activeOrder.title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .blackTextColor,
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.08,
                                                            letterSpacing:
                                                                -0.50,
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right:
                                                          constraints.maxWidth *
                                                              0.1,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.25,
                                                      child: SizedBox(
                                                        child: Text(
                                                          "${activeOrder.price} ₽",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .blackTextColor,
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0.08,
                                                              letterSpacing:
                                                                  -0.50,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left:
                                                          constraints.maxWidth *
                                                              0.1,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.475,
                                                      child: SizedBox(
                                                        child: Text(
                                                          "${activeOrder.responsesCount} откликов",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .blackTextColor,
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0.03,
                                                              letterSpacing:
                                                                  -0.50,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right:
                                                          constraints.maxWidth *
                                                              0.1,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.475,
                                                      child: Text(
                                                        activeOrder
                                                            .creationDate,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .blackTextColor,
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.09,
                                                            letterSpacing:
                                                                -0.50,
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: constraints
                                                              .maxHeight *
                                                          0.78,
                                                      right: activeOrder
                                                              .skills.isNotEmpty
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.75
                                                          : constraints
                                                                  .maxWidth *
                                                              0.8,
                                                      child: SizedBox(
                                                        child: Text(
                                                          activeOrder.skills
                                                                  .isNotEmpty
                                                              ? activeOrder
                                                                  .skills[0]
                                                              : '—',
                                                          style:
                                                              const TextStyle(
                                                            color: AppColors
                                                                .blackTextColor,
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.04,
                                                            letterSpacing:
                                                                -0.50,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: constraints
                                                              .maxHeight *
                                                          0.78,
                                                      left: 0,
                                                      right: 0,
                                                      child: Center(
                                                        child: SizedBox(
                                                          child: Text(
                                                            activeOrder.skills
                                                                        .length >=
                                                                    2
                                                                ? activeOrder
                                                                    .skills[1]
                                                                : '—',
                                                            style:
                                                                const TextStyle(
                                                              color: AppColors
                                                                  .blackTextColor,
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0.04,
                                                              letterSpacing:
                                                                  -0.50,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: activeOrder.skills
                                                                  .length >=
                                                              3
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.7
                                                          : constraints
                                                                  .maxWidth *
                                                              0.8,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.78,
                                                      child: SizedBox(
                                                        child: Text(
                                                          activeOrder.skills
                                                                      .length >=
                                                                  3
                                                              ? activeOrder
                                                                  .skills[2]
                                                              : '—',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .blackTextColor,
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0.04,
                                                              letterSpacing:
                                                                  -0.50,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left:
                                                          constraints.maxWidth *
                                                              0.35,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.65,
                                                      child: Transform(
                                                        transform:
                                                            Matrix4.identity()
                                                              ..translate(
                                                                  0.0, 0.0)
                                                              ..rotateZ(1.57),
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                width: 1.5,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left:
                                                          constraints.maxWidth *
                                                              0.66,
                                                      top: constraints
                                                              .maxHeight *
                                                          0.65,
                                                      child: Transform(
                                                        transform:
                                                            Matrix4.identity()
                                                              ..translate(
                                                                  0.0, 0.0)
                                                              ..rotateZ(1.57),
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                width: 1.5,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                        color:
                                                            Colors.transparent,
                                                        child:
                                                            InkWell(onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ViewOrderWidget(
                                                                        activeOrder),
                                                              ));
                                                        })),
                                                  ]));
                                                })))
                                      ])));
                                }))
                            : const SizedBox.shrink(),
                        userRole == UserRole.Freelancer &&
                                currentRole == UserRole.Customer &&
                                activeOrder == null
                            ? LayoutBuilder(builder: (context, constraints) {
                                return Align(
                                    alignment: userRole == UserRole.Freelancer
                                        ? const FractionalOffset(0.5, 0.85)
                                        : const FractionalOffset(0.5, 0.55),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistrationWidget()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(constraints.maxWidth * 0.5,
                                                constraints.maxHeight * 0.05)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor),
                                      ),
                                      child: const Text(
                                        'Предложить заказ',
                                        style: TextStyle(
                                          color: AppColors.backgroundColor,
                                        ),
                                      ),
                                    ));
                              })
                            : const SizedBox.shrink(),
                        canLeaveFeedback(activeOrder, userRole, currentUserRole,
                                widget.currentUserId)
                            ? LayoutBuilder(builder: (context, constraints) {
                                return Align(
                                    alignment:
                                        const FractionalOffset(0.5, 0.87),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistrationWidget()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(constraints.maxWidth * 0.5,
                                                constraints.maxHeight * 0.05)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor),
                                      ),
                                      child: const Text(
                                        'Обратная связь',
                                        style: TextStyle(
                                          color: AppColors.backgroundColor,
                                        ),
                                      ),
                                    ));
                              })
                            : const SizedBox.shrink(),
                        isMyProfile
                            ? LayoutBuilder(builder: (context, constraints) {
                                return Align(
                                    alignment:
                                        const FractionalOffset(0.1, 0.86),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        await prefs.clear();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllOrders()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(constraints.maxWidth * 0.35,
                                                constraints.maxHeight * 0.05)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor),
                                      ),
                                      child: const Text(
                                        'Выйти',
                                        style: TextStyle(
                                          color: AppColors.backgroundColor,
                                        ),
                                      ),
                                    ));
                              })
                            : const SizedBox.shrink(),
                        isMyProfile || currentUserRole == UserRole.Admin
                            ? LayoutBuilder(builder: (context, constraints) {
                                return Align(
                                    alignment:
                                        const FractionalOffset(0.9, 0.86),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                        await SharedPreferences
                                            .getInstance();
                                        final token = prefs.getString(
                                            'token');
                                        if (currentUserRole != UserRole.Admin) {
                                          await prefs.clear();
                                        }
                                        FreelanceFinderService.instance
                                            .deleteUser(user.id, token!);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllOrders()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(constraints.maxWidth * 0.35,
                                                constraints.maxHeight * 0.05)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor),
                                      ),
                                      child: const Text(
                                        'Удалить аккаунт',
                                        style: TextStyle(
                                          color: AppColors.backgroundColor,
                                        ),
                                      ),
                                    ));
                              })
                            : const SizedBox.shrink(),
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
                                            child: Image.asset(
                                                'assets/images/back.png'),
                                          )
                                        ])))),
                          ),
                        ),
                        isMyProfile || currentUserRole == UserRole.Admin
                            ? Align(
                                alignment: const FractionalOffset(0.9, 0.065),
                                child: SizedBox(
                                    child: Material(
                                        color: AppColors.backgroundColor,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EditProfileWidget()),
                                              );
                                            },
                                            splashColor: Colors.transparent,
                                            child: Stack(children: [
                                              Transform.scale(
                                                scale: 1,
                                                child: Image.asset(
                                                    'assets/images/edit_profile.png'),
                                              )
                                            ])))),
                              )
                            : const SizedBox.shrink(),
                      ]));
                }
              })
        ]));
  }

  Order? findActiveOrder(List<Order>? orders) {
    if (orders == null) return null;

    try {
      return orders.firstWhere(
          (order) => order.status == "Active" || order.status == "Requested");
    } catch (e) {
      return null;
    }
  }

  bool canLeaveFeedback(Order? activeOrder, UserRole userRole,
      UserRole? currentUserRole, int? currentUserId) {
    if (activeOrder == null || activeOrder.status != "Requested") return false;

    if (currentUserId == null || currentUserRole == null) return false;

    if (userRole == UserRole.Freelancer &&
        currentUserRole == UserRole.Customer) {
      return activeOrder.orderer.id == currentUserId;
    }

    if (currentUserRole == UserRole.Freelancer &&
        userRole == UserRole.Customer) {
      return activeOrder.orderer.id == currentUserId;
    }

    return false;
  }
}
