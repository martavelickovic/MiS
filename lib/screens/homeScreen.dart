import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Exam> getExams() {
    return [
      Exam(name: "Веб програмирање", dateTime: DateTime(2025, 2, 1, 9, 0), rooms: ["LAB 2", "LAB 3"]),
      Exam(name: "Бази на податоци", dateTime: DateTime(2025, 2, 3, 10, 0), rooms: ["LAB 200в"]),
      Exam(name: "Мобилни апликации", dateTime: DateTime(2025, 2, 5, 12, 0), rooms: ["LAB 1"]),
      Exam(name: "Оперативни системи", dateTime: DateTime(2025, 2, 7, 9, 0), rooms: ["LAB 215"]),
      Exam(name: "Вештачка интелигенција", dateTime: DateTime(2025, 2, 9, 11, 0), rooms: ["LAB 138"]),
      Exam(name: "Компјутерски Мрежи", dateTime: DateTime(2025, 2, 11, 8, 0), rooms: ["LAB 138"]),
      Exam(name: "Мрежна безбедност", dateTime: DateTime(2025, 2, 13, 10, 0), rooms: ["LAB 200аб"]),
      Exam(name: "Алгоритми и податочни структури", dateTime: DateTime(2025, 1, 15, 9, 0), rooms: ["LAB 200в"]),
      Exam(name: "Компјутерска графика", dateTime: DateTime(2025, 2, 16, 12, 0), rooms: ["LAB 215"]),
      Exam(name: "Интернет технологии", dateTime: DateTime(2025, 1, 10, 8, 30), rooms: ["LAB 2"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Exam> exams = getExams();

    // Подреди ги испитите хронолошки
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 223178"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: exams.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final exam = exams[index];
            final now = DateTime.now();
            final backgroundColor =
                exam.dateTime.isBefore(now) ? Colors.grey.shade400 : Colors.blue.shade100;

            return ExamCard(exam: exam, backgroundColor: backgroundColor);
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF1D2A44),
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
