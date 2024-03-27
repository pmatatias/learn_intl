import 'package:flutter/material.dart';

class BtnN extends StatelessWidget {
  const BtnN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10), // Add this for rounded corners
      ),
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // This creates a 3D effect
        ..rotateX(0.01) // Add this to rotate the button slightly on the X axis
        ..rotateY(0.01), // And this to rotate it on the Y axis
      child: const Text(
        '0',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
