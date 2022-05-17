import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xffFFFFFF),
          onPrimary: const Color(0xFFFFFFE6),
          secondary: const Color(0xff8764B8),
          tertiary: const Color(0xffE5E5E5),
          background: const Color(0xff000000),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xffFFFFFF)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff8764B8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
          ),
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFFFFFFE6),
          ),
          labelMedium: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: 'Challenger',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
