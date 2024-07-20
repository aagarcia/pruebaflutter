import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final String courtName;
  final String date;
  final String user;
  final String duration;
  final String price;
  final String imageUrl;
  final String userImageUrl;

  const ReservationCard({
    super.key,
    required this.courtName,
    required this.date,
    required this.user,
    required this.duration,
    required this.price,
    required this.imageUrl,
    required this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF4F7FC),
      child: ListTile(
        leading:
            Image.asset(imageUrl, fit: BoxFit.cover, width: 50, height: 50),
        title: Text(
          courtName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 13),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'Reservado por: ',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  backgroundImage: AssetImage(userImageUrl),
                  radius: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  user,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 13),
                const SizedBox(width: 4),
                Text(
                  duration,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 8),
                const Text(' | '),
                const SizedBox(width: 8),
                Text(
                  price,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
