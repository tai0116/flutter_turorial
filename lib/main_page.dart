import 'package:flutter/material.dart';
import 'package:flutter_turorial/async_page.dart';

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
