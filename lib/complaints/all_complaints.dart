import 'package:client/complaints/view_complaint.dart';
import 'package:client/integration/rest/freelance_finder/dto/complaint.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../orders/all_orders.dart';

class AllComplaints extends StatefulWidget {
  final String token;

  const AllComplaints(this.token, {super.key});

  @override
  _AllComplaintsState createState() => _AllComplaintsState();
}

class _AllComplaintsState extends State<AllComplaints> {
  late Future<List<Complaint>?> _complaintsFuture;

  @override
  void initState() {
    super.initState();
    _complaintsFuture = _fetchComplaints();
  }

  Future<List<Complaint>?> _fetchComplaints() async {
    try {
      final orders =
          await FreelanceFinderService.instance.getComplaints(widget.token);
      return orders;
    } catch (e) {
      return null;
    }
  }

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
          const Align(
            alignment: FractionalOffset(0.5, 0.1),
            child: SizedBox(
              child: Text(
                'Обращения',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 24,
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
            alignment: const FractionalOffset(0, 1),
            child: Container(
              height: 90,
              decoration: const ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
              ),
            ),
          ),
          FutureBuilder(
              future: _complaintsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                } else if (snapshot.hasError) {
                  return const SizedBox.shrink();
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox.shrink();
                } else {
                  final complaints = snapshot.data!;
                  return ListView.builder(
                      itemCount: complaints.length,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.125),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: AspectRatio(
                                aspectRatio: 3 / 1,
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: constraints.maxWidth * 0.1,
                                          top: constraints.maxHeight * 0.25,
                                          child: Text(
                                            complaints[index].initiator.username,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.blackTextColor,
                                                fontSize: 22,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                height: 0.08,
                                                letterSpacing: -0.50,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        Positioned(
                                          right: constraints.maxWidth * 0.1,
                                          top: constraints.maxHeight * 0.25,
                                          child: SizedBox(
                                            child: Text(
                                              '#' + complaints[index].id.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.hintColor,
                                                  fontSize: 22,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.09,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: constraints.maxWidth * 0.1,
                                          top: constraints.maxHeight * 0.7,
                                          child: SizedBox(
                                            child: Text(
                                              complaints[index].description,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontSize: 16,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.03,
                                                  letterSpacing: -0.50,
                                                  decoration:
                                                      TextDecoration.none),
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
                                                        ViewComplaintWidget(
                                                            complaints[index]),
                                                  ));
                                            })),
                                      ],
                                    ),
                                  );
                                })));
                      });
                }
              }),
          Align(
            alignment: const FractionalOffset(0.95, 0.1),
            child: GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AllOrders()));
              },
              behavior: HitTestBehavior.translucent,
              // Include the padding area in the tap area
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                // Add padding around the text
                child: Text(
                  'Выйти',
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
              ),
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
                                    builder: (context) => const AllOrders()),
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
        ]));
  }
}
