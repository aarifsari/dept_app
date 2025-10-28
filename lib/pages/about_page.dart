import 'package:flutter/material.dart';
import '../routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                _TabBtn('HAKKINDA', () {}),
                _TabBtn('KİŞİLER', () {
                  Navigator.pushNamed(context, Routes.instructors);
                }),
                _TabBtn('ALTYAPI', () {
                  Navigator.pushNamed(context, Routes.infrastructure);
                }),
                _TabBtn('DERSLER', () {
                  Navigator.pushNamed(context, Routes.courses);
                }),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bölüm Hakkında',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Eskişehir Teknik Üniversitesi Bilgisayar Mühendisliği ',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'İletişim: bm@eskisehir.edu.tr • estu.edu.tr',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
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
