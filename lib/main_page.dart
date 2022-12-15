import 'package:flutter/material.dart';
import 'package:flutter_turorial/async/async_page.dart';

import 'youtube/youtube_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メイン画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _AsyncButton(),
            _YouTubeButton(),
          ],
        ),
      ),
    );
  }
}

class _AsyncButton extends StatelessWidget {
  const _AsyncButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          AsyncPage.route(),
        );
      },
      child: const Text('Async'),
    );
  }
}

class _YouTubeButton extends StatelessWidget {
  const _YouTubeButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          YouTubePage.route(),
        );
      },
      child: const Text('YouTube'),
    );
  }
}
