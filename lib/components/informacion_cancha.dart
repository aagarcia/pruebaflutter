import 'package:flutter/material.dart';

class InformacionCancha extends StatelessWidget {
  const InformacionCancha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Epic Box',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Cancha tipo A',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Disponible',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.circle, color: Color(0xFF346BC3), size: 12),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '7:00 am a 4:00 pm',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'Via Av. Caracas y Av. P.º Caroni',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$25',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Por hora',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.cloud, color: Colors.grey, size: 16),
                SizedBox(width: 4),
                Text(
                  '30 %',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
