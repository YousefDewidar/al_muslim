import 'package:al_muslim/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  final double myFont;
  CustomThemeData(this.myFont);
  ThemeData darkData(context) {
    return ThemeData(
      scaffoldBackgroundColor: Constants.kBgColDark,
      // ###################
      // ###################
      textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(color: Colors.white),
              bodyLarge: const TextStyle(color: Colors.white),
              headlineMedium: const TextStyle(color: Colors.white),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.white),
              // $$$$$$$$$$$$$$$$$$$$$$$$$$$
              labelLarge: const TextStyle(color: Colors.white)
                  .copyWith(fontFamily: 'IBMPlex', fontSize: myFont),
            ),
      ),

      // ###################
      cardTheme: CardTheme(
        elevation: 2.1,
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
      primaryIconTheme:const IconThemeData(color: Colors.white),

      // ###################
      iconTheme: const IconThemeData(color: Colors.white),
    );
    //####################
  }

// =========================================================================
  ThemeData lightData(context) {
    return ThemeData(
      scaffoldBackgroundColor: Constants.kBgColLight,
      // ###################
      textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),

              // $$$$$$$$$$$$$$$$$$$$$$$$$$$
              labelLarge: const TextStyle(color: Colors.black)
                  .copyWith(fontFamily: 'IBMPlex', fontSize: myFont),
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
        elevation: 2.1,
        color: Constants.kPrimaryColLight,
      ),

      // ###################
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
      primaryIconTheme:const IconThemeData(color: Colors.white),

      // ###################
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
