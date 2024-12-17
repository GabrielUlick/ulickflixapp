import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();

  static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Metropolis',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
