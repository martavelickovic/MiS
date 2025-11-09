import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final Color backgroundColor;

  const ExamCard({
    super.key,
    required this.exam,
    required this.backgroundColor,
  });

  bool get isPast => exam.dateTime.isBefore(DateTime.now());
  bool get isToday {
    final now = DateTime.now();
    return exam.dateTime.year == now.year &&
           exam.dateTime.month == now.month &&
           exam.dateTime.day == now.day;
  }

  String get formattedDateTime =>
      "${exam.dateTime.day.toString().padLeft(2, '0')}.${exam.dateTime.month.toString().padLeft(2, '0')}.${exam.dateTime.year} "
      "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}";

  String get timeLeft {
    if (isPast) return "Испитот е поминат";
    final diff = exam.dateTime.difference(DateTime.now());
    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    return "$days дена, $hours часа преостануваат";
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isPast ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
      ),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(textColor),
              const SizedBox(height: 8),
              _buildRow(Icons.calendar_month, formattedDateTime, textColor),
              _buildRow(Icons.meeting_room, exam.rooms.join(", "), textColor),
              const SizedBox(height: 6),
              Text(
                timeLeft,
                style: TextStyle(
                  color: textColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(Color textColor) {
    return Text(
      exam.name,
      style: TextStyle(
        color: textColor,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRow(IconData icon, String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
