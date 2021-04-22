import 'package:flutter/material.dart';

import 'example_state_machine.dart';

void main() => runApp(MaterialApp(
  title: 'Navigation Basics',
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rive Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Animate Cricket Ball'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>  MyRiveAnimation(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}