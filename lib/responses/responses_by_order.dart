import 'package:client/complaints/all_complaints.dart';
import 'package:client/integration/rest/freelance_finder/dto/response.dart';
import 'package:client/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:provider/provider.dart';
import '../constants/AppColors.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../models/user_role.dart';
import '../orders/all_orders.dart';
import '../profiles/my_profile.dart';
import '../providers/user_id_provider.dart';
import '../providers/user_role_provider.dart';
import '../reg/registration.dart';

class ResponsesWidget extends StatefulWidget {
  final int orderId;
  final String token;

  const ResponsesWidget(this.token, this.orderId, {super.key});

  @override
  _ResponsesState createState() => _ResponsesState();
}

class _ResponsesState extends State<ResponsesWidget> {
  late Future<List<Response>?> _freelancersFuture;

  @override
  void initState() {
    super.initState();
    _freelancersFuture = _fetchFreelancers();
  }

  Future<List<Response>?> _fetchFreelancers() async {
    try {
      final freelancers =
      await FreelanceFinderService.instance.fetchOrderFreelancers(widget.token, widget.orderId);
      return freelancers;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRole = Provider.of<UserRoleProvider>(context).userRole;
    final userId = Provider.of<UserIdProvider>(context).userId;
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
            alignment: FractionalOffset(0.05, 0.1),
            child: SizedBox(
              width: 140,
              height: 32,
              child: Text(
                'Отклики',
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
          FutureBuilder(
            future: _freelancersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.shrink();
              } else if (snapshot.hasError) {
                return const SizedBox.shrink();
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SizedBox.shrink();
              } else {
                final freelancers = snapshot.data!;
                return ListView.builder(
                  itemCount: freelancers.length,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 5 / 4,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: AppColors.backgroundColor,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 3,
                                          color: AppColors.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: constraints.maxWidth * 0.05,
                                    top: constraints.maxHeight * 0.15,
                                    child: Text(
                                      freelancers[index].user.username,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: AppColors.blackTextColor,
                                        fontSize: 22,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        height: 0.08,
                                        letterSpacing: -0.50,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: constraints.maxWidth * 0.05,
                                    top: constraints.maxHeight * 0.15,
                                    child: SizedBox(
                                      child: Text(
                                        "${freelancers[index].user.price ?? '-'} ₽/час",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: AppColors.blackTextColor,
                                          fontSize: 22,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          height: 0.08,
                                          letterSpacing: -0.50,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: constraints.maxWidth * 0.05,
                                    top: constraints.maxHeight * 0.315,
                                    child: SizedBox(
                                      child: Text(
                                        "${freelancers[index].user.ordersCount} заказов",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: AppColors.blackTextColor,
                                          fontSize: 22,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          height: 0.03,
                                          letterSpacing: -0.50,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: constraints.maxWidth * 0.05,
                                    top: constraints.maxHeight * 0.28,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Средняя',
                                          style: TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.09,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        const Text(
                                          'оценка',
                                          style: TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.09,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                freelancers[index].user.rating !=
                                                    null
                                                    ? freelancers[index].user
                                                    .rating
                                                    .toString()
                                                    : '—',
                                                style: const TextStyle(
                                                  color:
                                                  AppColors.blackTextColor,
                                                  fontSize: 22,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                  TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'assets/images/mark.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: constraints.maxHeight * 0.52,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Обо мне:',
                                          style: TextStyle(
                                            color: AppColors.blackTextColor,
                                            fontSize: 22,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            height: 0.04,
                                            letterSpacing: -0.50,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        Text(
                                          freelancers[index].user.aboutMe ?? '-',
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
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: constraints.maxHeight * 0.9,
                                    left: constraints.maxWidth * 0.15,
                                    child: SizedBox(
                                      child: Text(
                                        freelancers[index].user.skills.isNotEmpty
                                            ? freelancers[index].user.skills[0]
                                            : '-',
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
                                    top: constraints.maxHeight * 0.9,
                                    left: constraints.maxWidth * 0.45,
                                    child: SizedBox(
                                      child: Text(
                                        freelancers[index].user.skills.length > 1
                                            ? freelancers[index].user.skills[1]
                                            : '-',
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
                                    top: constraints.maxHeight * 0.9,
                                    left: constraints.maxWidth * 0.75,
                                    child: SizedBox(
                                      child: Text(
                                        freelancers[index].user.skills.length > 2
                                            ? freelancers[index].user.skills[2]
                                            : '-',
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
                                    left: constraints.maxWidth * 0.35,
                                    top: constraints.maxHeight * 0.8,
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
                                              strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: constraints.maxWidth * 0.66,
                                    top: constraints.maxHeight * 0.8,
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
                                              strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        FreelanceFinderService.instance.respondToRequest(freelancers[index].id, true, widget.token);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyProfileWidget(
                                                    userId,
                                                    null,
                                                    true,
                                                    null),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
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
                              child:
                              Image.asset('assets/images/orders_icon.png'),
                            )
                          ])))),
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
          userRole != UserRole.Admin
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
          userRole != UserRole.Admin
              ? Align(
            alignment: const FractionalOffset(0.925, 0.97),
            child: SizedBox(
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                          onTap: () {
                            AppMetrica.reportEvent('Авторизация');
                            print(userRole);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  userRole == UserRole.Guest
                                      ? const RegistrationWidget()
                                      : MyProfileWidget(
                                      userId, null, null, null)),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 1,
                              alignment: Alignment.center,
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
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                  'assets/images/complaint.png'),
                            )
                          ])))),
            ),
          ),
        ]));
  }
}
