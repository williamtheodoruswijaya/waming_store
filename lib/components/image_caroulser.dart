import 'dart:async';

import 'package:flutter/material.dart';

class ImageCaroulser extends StatefulWidget {
  const ImageCaroulser({super.key});

  @override
  State<ImageCaroulser> createState() => _ImageCaroulserState();
}

class _ImageCaroulserState extends State<ImageCaroulser> {
  int _currentIndex = 0;
  final List<String> _imagePath = [
    "images/image1.png",
    "images/image2.png",
    "images/image3.png"
  ];

  Timer? _timer; // Digunakan untuk Autoplay image
  final PageController _pageController =
      PageController(initialPage: 1000); // Buat mindah-mindahin image

  @override
  void initState() {
    // Tempat pemanggilan start timer untuk memulai autoplay
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // Digunakan untuk membuat timer tidak berubah ketika penggeseran halaman dilakukan
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 3),
        (Timer timer) => setState(() => (
              _currentIndex = (_currentIndex + 1) % _imagePath.length,
              _pageController.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut)
            ))); // curve buat animasi
  }

  void goToPage(int index) {
    _timer = Timer.periodic(
        const Duration(seconds: 3),
        (Timer timer) => setState(() => (
              _currentIndex = index,
              _pageController.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut)
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePath.length *
                  2000, // dikali 2000 untuk memberikan efek looping
              onPageChanged: (index) {
                setState(() => _currentIndex = index % _imagePath.length);
              },
              itemBuilder: (context, index) => Image.asset(
                _imagePath[index % _imagePath.length],
                fit: BoxFit.cover,
              ),
            ))
      ],
    );
  }
}
