import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:client/integration/rest/freelance_finder/dto/create_claim_request.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/my_profile.dart';
import 'package:client/providers/token_provider.dart';
import 'package:client/reg/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../complaints/all_complaints.dart';
import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../integration/rest/freelance_finder/dto/order.dart';
import '../models/user_role.dart';
import '../providers/user_id_provider.dart';
import '../providers/user_role_provider.dart';

class ViewOrderWidget extends StatelessWidget {
  final Order order;

  const ViewOrderWidget(this.order, {super.key});

  void _showComplaintDialog(BuildContext context, String token) {
    final TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
                color: AppColors.primaryColor,
                width: 4), // Increase the border width
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {},
                    controller: feedbackController,
                    decoration: const InputDecoration(
                      hintText: "Введите текст жалобы",
                      hintStyle: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    style: const TextStyle(
                      color: AppColors.blackTextColor,
                      // Make the text color black
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Add some space between the text field and the buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text(
                          'Отправить',
                          style: TextStyle(
                            color: AppColors.blackTextColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          final request = CreateClaimRequest(
                            orderId: order.id,
                            description: feedbackController.text
                          );
                          FreelanceFinderService.instance.createClaim(token, request);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Отмена',
                          style: TextStyle(
                            color: AppColors.blackTextColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserIdProvider>(context).userId;
    final userRole = Provider.of<UserRoleProvider>(context).userRole;
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
              alignment: const FractionalOffset(0.5, 0.0875),
              child: SizedBox(
                child: Text(
                  order.title,
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
          Align(
            alignment: const FractionalOffset(0.5, 0.1125),
            child: Text(
              "#${order.id}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.hintColor,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.16),
            child: Text(
              'Дата размещения: ${order.creationDate}',
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
            alignment: const FractionalOffset(0.5, 0.2),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.1,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.1,
                      top: constraints.maxHeight * 0.055,
                      child: Text(
                        '${order.responsesCount} откликов',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.backgroundColor,
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
                      top: constraints.maxHeight * 0.055,
                      child: SizedBox(
                        child: Text(
                          "${order.price} ₽",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 22,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          userRole == UserRole.Admin
              ? LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment:
                const FractionalOffset(0.9, 0.88),
                child: ElevatedButton(
                  onPressed: () async {
                    FreelanceFinderService.instance
                        .deleteOrder(order.id, token!);
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
                    'Удалить заказ',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ));
          })
              : const SizedBox.shrink(),
          Align(
            alignment: const FractionalOffset(0.5, 0.36),
            child: LayoutBuilder(builder: (context, constraints) {
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
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      right: order.skills.isNotEmpty
                          ? constraints.maxWidth * 0.68
                          : constraints.maxWidth * 0.73,
                      top: constraints.maxHeight * 0.08,
                      child: SizedBox(
                        child: Text(
                          order.skills.isNotEmpty ? order.skills[0] : '—',
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
                      top: constraints.maxHeight * 0.08,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: SizedBox(
                        child: Text(
                          order.skills.length >= 2 ? order.skills[1] : '—',
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
                      )),
                    ),
                    Positioned(
                      left: order.skills.length >= 3
                          ? constraints.maxWidth * 0.625
                          : constraints.maxWidth * 0.725,
                      top: constraints.maxHeight * 0.08,
                      child: SizedBox(
                        child: Text(
                          order.skills.length >= 3 ? order.skills[2] : '—',
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
                                color: AppColors.primaryColor,
                                width: 1.5,
                                strokeAlign: BorderSide.strokeAlignCenter,
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
                                color: AppColors.primaryColor,
                                width: 1.5,
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
          const Align(
            alignment: FractionalOffset(0.5, 0.5),
            child: Text(
              'Описание',
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
          ),
          userRole != UserRole.Guest && userRole != UserRole.Admin && order.orderer.id != userId
              ? Align(
                  alignment: const FractionalOffset(0.9, 0.5),
                  child: GestureDetector(
                    onTap: () {
                      _showComplaintDialog(context, token!);
                    },
                    behavior: HitTestBehavior.translucent,
                    // Include the padding area in the tap area
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      // Add padding around the text
                      child: Text(
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
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Align(
            alignment: const FractionalOffset(0.5, 0.615),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                order.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.50,
                  decoration: TextDecoration.none,
                ),
                maxLines: 7,
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
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: userRole == UserRole.Freelancer
                ? const FractionalOffset(0.5, 0.865)
                : const FractionalOffset(0.5, 0.8),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                  child: Material(
                      child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfileWidget(userId, order.orderer, null, order)),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.13,
                      decoration: ShapeDecoration(
                        color: AppColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.1,
                      top: constraints.maxHeight * 0.065,
                      child: SizedBox(
                        child: Text(
                          order.orderer.username,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF1B53C1),
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.5,
                      top: constraints.maxHeight * 0.0425,
                      child: const SizedBox(
                        child: Text(
                          'Средняя оценка',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.blackTextColor,
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.04,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.65,
                      top: constraints.maxHeight * 0.0675,
                      width: 40,
                      height: 40,
                      child: SizedBox(
                          child: Material(
                              color: AppColors.backgroundColor,
                              child: InkWell(
                                  splashColor: Colors.transparent,
                                  child: Stack(children: [
                                    Transform.scale(
                                      scale: 0.8,
                                      alignment: Alignment.center,
                                      child:
                                          Image.asset('assets/images/mark.png'),
                                    )
                                  ])))),
                    ),
                    Positioned(
                      right: constraints.maxWidth * 0.24,
                      top: constraints.maxHeight * 0.092,
                      child: SizedBox(
                        child: Text(
                          order.orderer.rating != null
                              ? order.orderer.rating.toString()
                              : '— ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.blackTextColor,
                              fontSize: 28,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0.04,
                              letterSpacing: -0.50,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              )));
            }),
          ),
          userRole == UserRole.Freelancer
              ? LayoutBuilder(builder: (context, constraints) {
                  return ResponseButton(orderId: order.id);
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
                                  builder: (context) => const AllOrders()),
                            );
                          },
                          splashColor: Colors.transparent,
                          child: Stack(children: [
                            Transform.scale(
                              scale: 0.8,
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/back.png'),
                            )
                          ])))),
            ),
          ),
        ]));
  }
}

class ResponseButton extends StatefulWidget {
  final int orderId;

  const ResponseButton({Key? key, required this.orderId}) : super(key: key);

  @override
  _ResponseButtonState createState() => _ResponseButtonState();
}

class _ResponseButtonState extends State<ResponseButton> {
  bool _isResponded = false;
  bool _isResponsedBefore = false;

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<TokenProvider>(context).token;
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: const FractionalOffset(0.5, 0.725),
        child: ElevatedButton(
          onPressed: _isResponded
              ? null
              : () async {
                  setState(() {
                    _isResponded = true;
                  });
                  try {
                    await FreelanceFinderService.instance
                        .sendRequestToCreateFreelancerRequest(
                            widget.orderId.toString(), token!);
                  } catch (e) {
                    print("123");
                    _isResponsedBefore = true;
                  }
                },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                constraints.maxWidth * 0.5,
                constraints.maxHeight * 0.05,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(_isResponded
                ? AppColors.backgroundColor
                : AppColors.primaryColor),
            side: MaterialStateProperty.all(const BorderSide(
              color: AppColors.primaryColor,
              width: 3,
            )),
          ),
          child: Text(
            _isResponsedBefore
                ? 'Вы уже откликались'
                : _isResponded
                    ? 'Вы откликнулись'
                    : 'Откликнуться',
            style: TextStyle(
              color: _isResponded
                  ? AppColors.primaryColor
                  : AppColors.backgroundColor,
            ),
          ),
        ),
      );
    });
  }
}
