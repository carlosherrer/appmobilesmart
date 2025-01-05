import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'components/Welcome.component.dart';
import 'components/Cronometer.component.dart';
import 'components/Publications.component.dart';
import 'components/Intervalos.component.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final List<Map<String, dynamic>> _postData = [
    {
      "user": {
        "details": {
          "url": "https://via.placeholder.com/150",
          "name": "Jazmín Robles",
          "date": "2024-12-28"
        }
      },
      "header": "¡Recuerda que la Evaluación de desempeño empieza en Octubre!",
      "Imgurl": "https://placehold.in/600x200.png/dark"
    },
    {
      "user": {
        "details": {
          "url": "https://via.placeholder.com/150",
          "name": "Laura Valera",
          "date": "2024-12-28"
        }
      },
      "header": "¡Fiesta de celebración para fin de año con Materia Gris!",
      "Imgurl": "https://placehold.in/600x200.png/dark"
    }
  ];

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d \'de\' MMMM \'del\' y', 'es_ES')
        .format(DateTime.now());
    print(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.105,
                width: MediaQuery.of(context).size.width * 0.95,
                child: HelloWorld(
                  userName: 'Valeria',
                  dateText: formattedDate,
                  imageUrl: 'https://via.placeholder.com/150',
                ),
              ),
              const Cronometer(),
              const IntervalCard(),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _postData.length,
                  itemBuilder: (context, index) {
                    final post = _postData[index];
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Publications(postData: post),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
