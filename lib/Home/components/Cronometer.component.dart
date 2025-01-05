import 'package:flutter/material.dart';
import 'dart:async';

class Cronometer extends StatefulWidget {
  const Cronometer({super.key});

  @override
  _CronometroState createState() => _CronometroState();
}

class _CronometroState extends State<Cronometer> {
  // Variables para el cronómetro
  int _seconds = 0;
  late Timer _timer;
  bool _isRunning = false;

  // Iniciar o reanudar el cronómetro
  void _startTimer() {
    if (!_isRunning) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  // Detener el cronómetro
  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  // Formatear el tiempo en horas:minutos:segundos
  String _formatTime() {
    int hours = _seconds ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int seconds = _seconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: const Color(0xFF77DEA2),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Usamos un Row para alinear el cronómetro y el botón en una línea
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Mostrar el tiempo en formato horas:minutos:segundos
                Text(
                  _formatTime(),
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A8751) // Texto blanco
                      ),
                ),
                const SizedBox(
                    width: 8), // Espacio entre el cronómetro y el botón

                // Mostrar "Iniciar" solo cuando el cronómetro esté en 0
                if (_seconds == 0)
                  ElevatedButton.icon(
                    onPressed: _startTimer,
                    label: const Text(
                      'Iniciar',
                      style: TextStyle(color: Color(0xFF2A8751), fontSize: 28),
                    ),
                    icon:
                        const Icon(Icons.play_arrow, color: Color(0xFF2A8751)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Fondo transparente
                      shadowColor: Colors.transparent, // Sin sombra
                    ),
                  ),

                // Mostrar "Reanudar" solo cuando el cronómetro sea mayor a 0
                if (!_isRunning && _seconds > 0)
                  ElevatedButton.icon(
                    onPressed: _startTimer,
                    label: const Text(
                      'Continuar',
                      style: TextStyle(color: Color(0xFF2A8751), fontSize: 28),
                    ),
                    icon:
                        const Icon(Icons.play_arrow, color: Color(0xFF2A8751)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Fondo transparente
                      shadowColor: Colors.transparent, // Sin sombra
                    ),
                  ),

                // Mostrar "Pausar" solo cuando el cronómetro esté en ejecución
                if (_isRunning && _seconds > 0)
                  ElevatedButton.icon(
                    onPressed: _pauseTimer,
                    label: const Text(
                      'Pausar',
                      style: TextStyle(color: Color(0xFF2A8751), fontSize: 28),
                    ),
                    icon: const Icon(Icons.pause, color: Color(0xFF2A8751)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
