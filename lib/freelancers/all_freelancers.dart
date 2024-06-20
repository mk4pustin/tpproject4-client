import 'package:client/freelancers/freelancers_filters.dart';
import 'package:client/profiles/freelancer_profile.dart';
import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:provider/provider.dart';
import '../constants/AppColors.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../integration/rest/freelance_finder/dto/freelancer.dart';
import '../integration/rest/freelance_finder/dto/registration_response.dart';
import '../models/user_role.dart';
import '../profiles/my_profile.dart';
import '../providers/user_role_provider.dart';
import '../reg/registration.dart';

class AllFreelancersWidget extends StatefulWidget {

  const AllFreelancersWidget({super.key});

  @override
  _AllFreelancersState createState() => _AllFreelancersState();

}

class _AllFreelancersState extends State<AllFreelancersWidget> {
  late Future<List<RegistrationResponseDTO>?> _freelancersFuture;

  @override
  void initState() {
    super.initState();
    _freelancersFuture = _fetchFreelancers();
  }

  Future<List<RegistrationResponseDTO>?> _fetchFreelancers() async {
    try {
      final freelancers = await FreelanceFinderService.instance.fetchAllFreelancers();
      return freelancers;
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
            alignment: FractionalOffset(0.05, 0.1),
            child: SizedBox(
              width: 140,
              height: 32,
              child: Text(
                'Фрилансеры',
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
              alignment: FractionalOffset(0.85, 0.1),
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
            alignment: const FractionalOffset(0.92, 0.07),
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
                                  const FreelancerFiltersWidget()),
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
                                                freelancers[index].username,
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
                                                  "${freelancers[index].id} ₽",
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
                                                  "${freelancers[index].id} заказов",
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
                                                freelancers[index].rating != null ? freelancers[index].rating.toString() : '—',
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
                                              right: freelancers[index].skills != null
                                                  ? constraints.maxWidth * 0.75
                                                  : constraints.maxWidth * 0.8,
                                              child: SizedBox(
                                                child: Text(
                                                  freelancers[index].skills != null && freelancers[index].skills!.isNotEmpty
                                                      ? freelancers[index].skills![0]
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
                                                    freelancers[index].skills != null && freelancers[index].skills!.isNotEmpty
                                                        ? freelancers[index].skills![0]
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
                                              left: freelancers[index].skills!.length >= 3
                                                  ? constraints.maxWidth * 0.7
                                                  : constraints.maxWidth * 0.8,
                                              top: constraints.maxHeight * 0.78,
                                              child: SizedBox(
                                                child: Text(
                                                  freelancers[index].skills != null && freelancers[index].skills!.isNotEmpty
                                                      ? freelancers[index].skills![0]
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
                                                            const FreelancerProfileWidget(),
                                                      ));
                                                })),
                                          ]));
                                    })));
                      });
                }
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
                            AppMetrica.reportEvent('Авторизация');
                            print(userRole);
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