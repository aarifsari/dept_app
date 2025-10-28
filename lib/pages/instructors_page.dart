import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routes.dart';

class InstructorsPage extends StatelessWidget {
  const InstructorsPage({super.key});

  static const _items = [
    {
      'name': 'Dr. Öğr. Üyesi Murat ÖZTÜRK',
      'email': 'murat.ozturk@eskisehir.edu.tr',
      'phone': '+905054128736',
      'photo': 'assets/images/1.png',
    },
    {
      'name': 'Doç. Dr. Emre KARAHAN',
      'email': 'emre.karahan@eskisehir.edu.tr',
      'phone': '+905334209683',
      'photo': 'assets/images/2.png',
    },
    {
      'name': 'Dr. Öğr. Üyesi Hakan YILDIZ',
      'email': 'hakan.yildiz@eskisehir.edu.tr',
      'phone': '+905412987632',
      'photo': 'assets/images/3.png',
    },
    {
      'name': 'Prof. Dr. Serkan DEMİRCİ',
      'email': 'serkan.demirci@eskisehir.edu.tr',
      'phone': '+905054188407',
      'photo': 'assets/images/4.png',
    },
  ];

  Future<void> _confirmAndCall(
    BuildContext context,
    String name,
    String phone,
  ) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Dial a Number'),
        content: Text('Would you like to call $name?\nGSM: $phone'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    if (ok == true) {
      final uri = Uri(scheme: 'tel', path: phone);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2E6AA7);
    const cardColor = Color(0xFFF6F5F9);

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
                _TabBtn('KİŞİLER', () {}),
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
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final it = _items[i];
                return Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              it['photo']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  it['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Mail: ${it['email']!}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'GSM: ${it['phone']!}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => _confirmAndCall(
                            context,
                            it['name']!,
                            it['phone']!,
                          ),
                          child: const Text('CALL'),
                        ),
                      ),
                    ],
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
