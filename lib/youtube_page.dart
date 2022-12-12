import 'package:flutter/material.dart';

class YouTubePage extends StatefulWidget {
  const YouTubePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const YouTubePage(),
    );
  }

  @override
  State<YouTubePage> createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('YouTube'),
          ],
        ),
      ),
    );
  }
}
