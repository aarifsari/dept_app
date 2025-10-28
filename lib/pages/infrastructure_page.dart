import 'package:flutter/material.dart';
import '../routes.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  static const _classrooms = [
    {'name': 'Derslik-B1', 'capacity': 36, 'img': 'assets/images/sinif.jpg'},
    {'name': 'Derslik-B2', 'capacity': 30, 'img': 'assets/images/sinif2.jpg'},
    {'name': 'Derslik-B3', 'capacity': 15, 'img': 'assets/images/sinif3.jpeg'},
    {'name': 'Derslik-B4', 'capacity': 18, 'img': 'assets/images/sinif4.jpg'},
    {'name': 'Derslik-B5', 'capacity': 24, 'img': 'assets/images/sinif.jpg'},
    {'name': 'Derslik-B6', 'capacity': 18, 'img': 'assets/images/sinif2.jpg'},
    {'name': 'Derslik-B7', 'capacity': 54, 'img': 'assets/images/sinif4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2E6AA7);
    const bg = Color(0xFFF6F5F9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text('Department Application'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TabBtn('HAKKINDA', () {
                  Navigator.pushNamed(context, Routes.about);
                }),
                _TabBtn('KİŞİLER', () {
                  Navigator.pushNamed(context, Routes.instructors);
                }),
                _TabBtn('ALTYAPI', () {}),
                _TabBtn('DERSLER', () {
                  Navigator.pushNamed(context, Routes.courses);
                }),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _classrooms.length,
              itemBuilder: (context, i) {
                final c = _classrooms[i];
                return Card(
                  color: bg,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Image.asset(
                      c['img'].toString(),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text(
                      c['name'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Kapasite: ${c['capacity']}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.imageView,
                        arguments: {'imagePath': c['img'], 'title': c['name']},
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _TabBtn(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
