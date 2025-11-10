import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Exam> getExams() {
    var lab = 'лаб';
    return [
      Exam(name: "Веб програмирање", dateTime: DateTime(2025, 12, 1, 9, 0), rooms: ["лаб 2", "лаб 3"]),
      Exam(name: "Бази на податоци", dateTime: DateTime(2025, 12, 12, 10, 0), rooms: ["лаб 200в"]),
      Exam(name: "Мобилни инфромациски системи", dateTime: DateTime(2025, 12, 4, 12, 0), rooms: ["лаб 1"]),
      Exam(name: "Оперативни системи", dateTime: DateTime(2025, 11, 30, 9, 0), rooms: ["лаб 215"]),
      Exam(name: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 28, 11, 0), rooms: ["лаб 138"]),
      Exam(name: "Компјутерски Мрежи", dateTime: DateTime(2025, 11, 29, 8, 0), rooms: ["лаб 138"]),
      Exam(name: "Мрежна безбедност", dateTime: DateTime(2025, 11, 20, 10, 0), rooms: ["лаб 200аб"]),
      Exam(name: "Алгоритми и податочни структури", dateTime: DateTime(2025, 12, 12, 9, 0), rooms: ["лаб 200в"]),
      Exam(name: "Компјутерска графика", dateTime: DateTime(2025, 11, 11, 12, 0), rooms: ["лаб 215"]),
      Exam(name: "Интернет технологии", dateTime: DateTime(2025, 12, 12, 8, 30), rooms: ["лаб 2"]),
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
