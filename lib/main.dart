import 'package:flutter/material.dart';
import 'package:expense/widgets/expenses.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var kCololorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 223, 166, 146));
var kDarkColorSheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 20, 15, 12),
  brightness: Brightness.dark,
);
void main() {
  runApp(
    MaterialApp(
      locale: Locale('fr'),
      supportedLocales: [Locale('fr'), Locale('en')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSheme,
        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorSheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSheme.primaryContainer,
            foregroundColor: kDarkColorSheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kCololorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kCololorScheme.onPrimaryContainer,
          foregroundColor: kCololorScheme.primaryContainer,
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kCololorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kCololorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kCololorScheme.primaryContainer,
            foregroundColor: kCololorScheme.primary,
          ),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(color: kCololorScheme.onSecondaryContainer, fontSize: 22),
          titleMedium: TextStyle(
            color: kCololorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: kCololorScheme.primary),
          bodyMedium: TextStyle(color: kCololorScheme.primary),
        ),
        inputDecorationTheme: InputDecorationThemeData().copyWith(
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: Expenses(),
    ),
  );
}

/*
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {
    runApp(
      MaterialApp(
        locale: Locale('fr'),
        supportedLocales: [Locale('fr'), Locale('en')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorSheme,
          cardTheme: const CardThemeData().copyWith(
            color: kDarkColorSheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorSheme.primaryContainer,
              foregroundColor: kDarkColorSheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kCololorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kCololorScheme.onPrimaryContainer,
            foregroundColor: kCololorScheme.primaryContainer,
          ),
          snackBarTheme: const SnackBarThemeData().copyWith(
            backgroundColor: kCololorScheme.onPrimaryContainer,
          ),
          cardTheme: const CardThemeData().copyWith(
            color: kCololorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kCololorScheme.primaryContainer,
              foregroundColor: kCololorScheme.primary,
            ),
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(color: kCololorScheme.onSecondaryContainer, fontSize: 22),
            titleMedium: TextStyle(
              color: kCololorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(color: kCololorScheme.primary),
            bodyMedium: TextStyle(color: kCololorScheme.primary),
          ),
          inputDecorationTheme: InputDecorationThemeData().copyWith(
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
        home: Expenses(),
      ),
    );
  });
}
*/
