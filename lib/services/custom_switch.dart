import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double thumbSize;
  final Color borderColor;
  final double borderWidth;

  const CustomSwitch({
    required this.value,
    required this.onChanged,
    this.activeColor = CupertinoColors.activeGreen,
    this.inactiveColor = CupertinoColors.activeGreen, // Цвет фона всегда зеленый
    this.thumbSize = 16,
    this.borderColor = CupertinoColors.systemGrey, // Цвет обводки
    this.borderWidth = 1, // Толщина обводки
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _isOn;
  late double _position;

  @override
  void initState() {
    super.initState();
    _isOn = widget.value;
    _position = _isOn ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
          _position = _isOn ? 1 : 0;
          widget.onChanged(!_isOn);
        });
      },
      child: Container(
        width: 44,
        height: 24,
        decoration: BoxDecoration(
          color: widget.inactiveColor, // Цвет фона всегда зеленый
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: widget.borderColor, // Обводка
            width: widget.borderWidth,
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: Alignment(2 * _position - 1, 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: widget.thumbSize,
                height: widget.thumbSize,
                decoration: const BoxDecoration(
                  color: Colors.white, // Шарик всегда белый
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}