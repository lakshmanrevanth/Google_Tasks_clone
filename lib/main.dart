import 'package:flutter/material.dart';
import 'package:google_tasks/screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

// way of initializing of a custom theme...
ThemeData buildTheme() {
  var basetheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red, brightness: Brightness.dark),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.0, // Your desired default text size
      ),
    ),
  );

  return basetheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(basetheme.textTheme));
}

// another way of using the custom theme initialization...
// var theme = ThemeData(
//   colorScheme:
//       ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
//   textTheme: GoogleFonts.latoTextTheme(),
// );
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const HomeScreen(),
    );
  }
}
