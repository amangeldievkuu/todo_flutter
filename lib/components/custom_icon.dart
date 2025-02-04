import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(255, 224, 240, 255),
            spreadRadius: 1.2,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon, color: color),
    );
  }
}
