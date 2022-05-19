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
          onTertiary: const Color(0xff5C5A5A),
          background: const Color(0xff000000),
        ),
        toggleableActiveColor: const Color(0xff8764B8),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xffFFFFFF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff8764B8),
            ),
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
            color: Color(0xFFFFFFFF),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color(0xFFFFFFFF),
          ),
          labelMedium: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Color(0xff8764B8),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardColor: const Color(0xff5C5A5A).withOpacity(.9),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xff171717),
          selectedIconTheme: const IconThemeData(color: Color(0xffFFFFFF)),
          unselectedIconTheme: const IconThemeData(color: Color(0xff929292)),
          selectedLabelStyle: const TextStyle(fontSize: 12),
          selectedItemColor: const Color(0xffE5E5E5),
          unselectedItemColor: const Color(0xffE5E5E5).withOpacity(.7),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
        ),
      ),
      title: 'Challenger',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
