import 'package:flutter/material.dart';
import 'package:learn_multi_ic_launcher/konstan.dart';

class Keye extends StatelessWidget {
  final String char;
  final bool span;
  final bool active;
  bool get spans => span;
  const Keye({
    super.key,
    required this.char,
    this.span = false,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [colorGray100, colorGray300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Center(
          child: Text(
            char,
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}
