// ignore_for_file: prefer_const_constructors

import 'package:conversor_moedas/src/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InicialWidget());
}

class InicialWidget extends StatelessWidget {
  const InicialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
