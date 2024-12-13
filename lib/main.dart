import 'package:flutter/material.dart';
import 'package:flutter_food/pages/HomePage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(fontFamily: 'Ariel', hintColor: const Color(0xFFd0cece)),
      home: const HomePage(),
    ));
