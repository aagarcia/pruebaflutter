import 'package:flutter/material.dart';

class CourtCard extends StatelessWidget {
  final String courtName;
  final String courtType;
  final String date;
  final String availability;
  final String time;
  final String imageUrl;
  final int progress;
  final String iconUrl;
  final VoidCallback? onPressed;

  const CourtCard({
    super.key,
    required this.courtName,
    required this.courtType,
    required this.date,
    required this.availability,
    required this.time,
    required this.imageUrl,
    required this.progress,
    required this.iconUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: SizedBox(
        height: 325,
        width: 245,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.asset(
                imageUrl,
                height: 137,
                width: 245,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          courtName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.network(
                        iconUrl,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 4),
                      Text('$progress %'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(courtType, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 13),
                      const SizedBox(width: 8),
                      Text(date, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(availability, style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 4),
                      Icon(Icons.circle,
                          color: availability == 'Disponible'
                              ? Colors.blue
                              : const Color(0xFF9B9C9D),
                          size: 8),
                      const SizedBox(width: 4),
                      availability == 'Disponible'
                          ? const Icon(Icons.access_time, size: 12)
                          : Container(),
                      const SizedBox(width: 4),
                      availability == 'Disponible'
                          ? Text(time, style: const TextStyle(fontSize: 12))
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF82BC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: Text(
                          'Reservar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
