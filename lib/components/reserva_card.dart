import 'package:flutter/material.dart';

class ReservaCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String type;
  final String date;
  final String reservedBy;
  final String duration;
  final String price;
  final double progress;
  final String userImageUrl;

  const ReservaCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.date,
    required this.reservedBy,
    required this.duration,
    required this.price,
    required this.progress,
    required this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, fit: BoxFit.cover, width: 80, height: 80),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Column(
                        children: [
                          const Icon(Icons.cloud, size: 16),
                          const SizedBox(width: 4),
                          Text('${(progress * 100).toInt()} %',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(type),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(date),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text('Reservado por: '),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(userImageUrl),
                      ),
                      const SizedBox(width: 8),
                      Text(reservedBy),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(duration),
                      const SizedBox(width: 8),
                      const Text(' | '),
                      const SizedBox(width: 8),
                      Text(price),
                    ],
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
