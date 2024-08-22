import 'package:al_muslim/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  static ThemeData darkData(context) {
    return ThemeData(
        scaffoldBackgroundColor: Constants.kBgColDark,
        // ###################
        textTheme: GoogleFonts.amiriTextTheme(
          Theme.of(context).textTheme.copyWith(
                headlineSmall: const TextStyle(color: Colors.white),
                bodyLarge: const TextStyle(color: Colors.white),
                headlineMedium: const TextStyle(color: Colors.white),
                titleLarge: const TextStyle(color: Colors.black),
              ),
        ),

        // ###################
        cardTheme: CardTheme(
          color: Constants.kPrimaryColDark,
        ),

        // ###################
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(
              Constants.kButtonCol,
            ),
          ),
        ),

        // ###################
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),
        ),

        // ###################
        iconTheme: const IconThemeData(color: Colors.white));
        //####################
  }

// =========================================================================
  static ThemeData lightData(context) {
    return ThemeData(
      scaffoldBackgroundColor: Constants.kBgColLight,
      // ###################
      textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
            ),
      ),

      // ###################
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(Constants.kGreenCol),
        ),
      ),

      // ###################
      cardTheme: CardTheme(
        color: Constants.kPrimaryColLight,
      ),

      // ###################
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Constants.kGreenCol),
        ),
      ),

      // ###################
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
