import 'package:flutter/material.dart';
import 'package:turaiev_test/screens/profile/screen.dart';

void main() {
  runApp(const TuraievApp());
}

class TuraievApp extends StatelessWidget {
  const TuraievApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turaiev Test',
      home: Navigator(
        onPopPage: (route, result) {
          return true;
        },
        pages: [
          ProfileScreen.buildPage(),
        ],
      ),
    );
  }
}