import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final remaining = exam.dateTime.isAfter(now)
        ? "${diff.inDays} дена, ${diff.inHours.remainder(24)} часа"
        : "Испитот е поминат";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Детали за испит"),
        backgroundColor: const Color(0xFF1D2A44),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetail("Име на предмет", exam.name),
            _buildDetail("Датум и време",
                "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
            _buildDetail("Простории", exam.rooms.join(", ")),
            const SizedBox(height: 8),
            Text(
              "Преостанато време: $remaining",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: const TextStyle(
              color: Color.fromARGB(255, 12, 12, 12), fontWeight: FontWeight.bold, fontSize: 16),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                  color: Color.fromARGB(221, 7, 7, 7),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
