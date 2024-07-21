import 'package:flutter/material.dart';

class CardProgress extends StatelessWidget {
  final String textIndicator;
  const CardProgress({super.key, required this.textIndicator});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Center(
        child: textIndicator == ''
            ? const CircularProgressIndicator()
            : Text(
                textIndicator,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
      ),
    );
  }
}
