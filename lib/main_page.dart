import 'package:flutter/material.dart';
import 'package:flutter_turorial/async/async_page.dart';

import 'mvvm/qiita_client_screen.dart';

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
            _QiitaButton(),
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

class _QiitaButton extends StatelessWidget {
  const _QiitaButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          QiitaClientScreen.route(),
        );
      },
      child: const Text('Qiita'),
    );
  }
}
