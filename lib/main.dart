import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turaiev_test/global/location/bloc.dart';
import 'package:turaiev_test/global/ui/colors.dart';
import 'package:turaiev_test/global/ui/text_style.dart';
import 'package:turaiev_test/screens/profile/screen.dart';

void main() {
  runApp(const TuraievApp());
}

class TuraievApp extends StatelessWidget {
  const TuraievApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Turaiev Test',
        home: Navigator(
          onPopPage: (route, result) {
            return true;
          },
          pages: [
            ProfileScreen.buildPage(),
          ],
        ),
      ),
    );
  }
}