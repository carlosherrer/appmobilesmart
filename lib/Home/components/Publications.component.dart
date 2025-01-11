import 'package:flutter/material.dart';

class Publications extends StatelessWidget {
  final Map<String, dynamic> postData;
  const Publications({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                const Icon(
                  Icons.chat,
                  color: Colors.blue,
                ),
                const SizedBox(width: 12),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    postData['header'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(postData['user']['details']['url']),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  postData['user']['details']['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF465499),
                  ),
                ),
                Text(
                  postData['user']['details']['date'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                postData['Imgurl'],
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 16.0, bottom: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Ver Detalle',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF465499),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
