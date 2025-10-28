import 'package:flutter/material.dart';
import '../routes.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2E6AA7);

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
                _TabBtn('ALTYAPI', () {
                  Navigator.pushNamed(context, Routes.infrastructure);
                }),
                _TabBtn('DERSLER', () {}),
              ],
            ),
          ),
          const Expanded(
            child: Center(child: Text('Dersler yakında eklenecek.')),
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
