import 'package:flutter/material.dart';

class ButtonGreen extends StatelessWidget {
  final String textButton;
  final VoidCallback? onPressed;
  const ButtonGreen(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF82BC00),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: textButton == 'Programar reserva'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  textButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          : Text(
              textButton,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
    );
  }
}
