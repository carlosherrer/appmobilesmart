import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntervalCard extends StatelessWidget {
  final List<Map<String, String>> intervals; //Lista de intervalos

  const IntervalCard({super.key, required this.intervals});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 243, 243),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Intervalos",
            style: TextStyle(
              color: Color(0xFF465499),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: intervals.map((interval) {
                  final start = DateTime.parse(interval['start']!);
                  final end = DateTime.parse(interval['end']!);
                  final duration = end.difference(start);

                  final formattedDuration =
                      '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

                  return Text(
                    "${DateFormat('HH:mm:ss').format(start)} - ${DateFormat('HH:mm:ss').format(end)} | $formattedDuration",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
