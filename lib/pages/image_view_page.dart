import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({
    super.key,
    required this.imagePath,
    this.title,
    this.heroTag,
  });

  final String imagePath;
  final String? title;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final img = Image.asset(imagePath, fit: BoxFit.contain);
    return Scaffold(
      appBar: AppBar(title: Text(title ?? 'Görsel')),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          minScale: 0.8,
          maxScale: 4,
          child: heroTag == null ? img : Hero(tag: heroTag!, child: img),
        ),
      ),
    );
  }
}
