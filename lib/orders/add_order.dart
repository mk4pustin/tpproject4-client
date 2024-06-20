import 'package:client/integration/rest/freelance_finder/dto/create_order_request.dart';
import 'package:client/integration/rest/freelance_finder/dto/order.dart';
import 'package:client/orders/all_orders.dart';
import 'package:client/profiles/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppColors.dart';
import '../freelancers/all_freelancers.dart';
import '../integration/rest/freelance_finder/client/client.dart';
import '../providers/token_provider.dart';

class AddOrderWidget extends StatefulWidget {
  const AddOrderWidget({super.key});

  @override
  _AddOrderWidgetState createState() => _AddOrderWidgetState();
}

class _AddOrderWidgetState extends State<AddOrderWidget> {
  final TextEditingController _titleTextFieldController =
      TextEditingController();
  final TextEditingController _descTextFieldController =
      TextEditingController();
  final TextEditingController _skillsTextFieldController =
      TextEditingController();
  final TextEditingController _priceTextFieldController =
      TextEditingController();

  String? dropdownValue;

  String? _titleTextFieldError;
  String? _descTextFieldError;
  String? _skillsRepeatTextFieldError;
  String? _priceTextFieldError;
  String? _dropdownFieldError;

  @override
  Widget build(BuildContext context) {
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
                                      const MyProfileWidget()),
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
          const Align(
              alignment: FractionalOffset(0.5, 0.087),
              child: SizedBox(
                child: Text(
                  'Размещение заказа',
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
          const Align(
            alignment: FractionalOffset(0.15, 0.17),
            child: SizedBox(
              child: Text(
                'Название заказа',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.2),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _titleTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05,
                              top: 0,
                              bottom: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _titleTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _titleTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _titleTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _titleTextFieldError != null,
                            child: Text(
                              _titleTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.13, 0.28),
            child: SizedBox(
              child: Text(
                'Описание',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.365),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.15,
                        child: TextField(
                          controller: _descTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.black,
                          maxLines: 6,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05,
                              top: 8.0,
                              bottom: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _descTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _descTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _descTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _descTextFieldError != null,
                            child: Text(
                              _descTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.2, 0.5),
            child: SizedBox(
              child: Text(
                'Сфера деятельности',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.57),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.85,
                      height: constraints.maxHeight * 0.05,
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.01,
                            left: constraints.maxWidth * 0.3,
                          ),
                          hintText: 'Выберите...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: _dropdownFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: _dropdownFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: _dropdownFieldError != null
                                  ? AppColors.errorColor
                                  : AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.errorColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.errorColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        items: <String>[
                          'Разработка',
                          'Тестирование',
                          'Администрирование',
                          'Маркетинг'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: SizedBox(
                        height: 16,
                        child: Visibility(
                          visible: _dropdownFieldError != null,
                          child: Text(
                            _dropdownFieldError ?? '',
                            style: const TextStyle(
                              color: AppColors.errorColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ));
              })),
          const Align(
            alignment: FractionalOffset(0.18, 0.62),
            child: SizedBox(
              child: Text(
                'Ключевые навыки',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.7),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _skillsTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05,
                              top: 0,
                              bottom: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _skillsRepeatTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _skillsRepeatTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _skillsRepeatTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _skillsRepeatTextFieldError != null,
                            child: Text(
                              _skillsRepeatTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          const Align(
            alignment: FractionalOffset(0.14, 0.74),
            child: SizedBox(
              child: Text(
                'Стоимость',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.50,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Align(
              alignment: const FractionalOffset(0.5, 0.83),
              child: LayoutBuilder(builder: (context, constraints) {
                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.05,
                        child: TextField(
                          controller: _priceTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05,
                              top: 0,
                              bottom: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: _priceTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _priceTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _priceTextFieldError != null
                                    ? AppColors.errorColor
                                    : AppColors.primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.errorColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 16,
                          child: Visibility(
                            visible: _priceTextFieldError != null,
                            child: Text(
                              _priceTextFieldError ?? '',
                              style: const TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              })),
          LayoutBuilder(builder: (context, constraints) {
            return Align(
                alignment: const FractionalOffset(0.5, 0.87),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _titleTextFieldError =
                          _titleTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _descTextFieldError =
                          _descTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _skillsRepeatTextFieldError =
                          _skillsTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _priceTextFieldError =
                          _priceTextFieldController.text.trim().isEmpty
                              ? "Поле пустое"
                              : null;
                      _dropdownFieldError =
                          dropdownValue == null ? "Поле пустое"
                              : null;
                    });

                    if (_titleTextFieldError != null ||
                        dropdownValue == null ||
                        _descTextFieldError != null ||
                        _skillsRepeatTextFieldError != null ||
                        _priceTextFieldError != null) {
                      return;
                    }

                    final Map<String, String> valueMapping = {
                      'Разработка': 'Сайты под ключ',
                      'Тестирование': 'Сайты',
                      'Администрирование': 'Серверы',
                      'Маркетинг': 'SMM'
                    };

                    try {
                      final order = CreateOrderRequest(
                          title: _titleTextFieldController.text,
                          description: _descTextFieldController.text,
                          skills: _skillsTextFieldController.text,
                          scopes: [valueMapping[dropdownValue]!],
                          price: double.parse(_priceTextFieldController.text));
                      print(order);

                      await FreelanceFinderService.instance.createOrder(order, token!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllOrders()),
                      );
                    } catch (e) {
                      print(111);
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(
                        constraints.maxWidth * 0.5,
                        constraints.maxHeight * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  child: const Text(
                    'Создать',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ));
          }),
          Align(
            alignment: const FractionalOffset(0.05, 0.05),
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
