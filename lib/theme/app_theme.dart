import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Design tokens
const kDark    = Color(0xFF201E1D);
const kBg      = Color(0xFFF3F2F2);
const kSurface = Color(0xFFEAE9E9);
const kAccent  = Color(0xFFEC3013);
const kDeepRed = Color(0xFFAE1800);
const kDivider = Color(0x66201E1D);
const kMuted   = Color(0x8C201E1D);

TextStyle kArchivo({
  double size = 14,
  FontWeight weight = FontWeight.w400,
  double? letterSpacing,
  Color color = kDark,
  double? height,
}) =>
    GoogleFonts.archivo(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      color: color,
      height: height,
    );

TextStyle kKicker({Color color = kAccent}) => kArchivo(
      size: 10,
      weight: FontWeight.w800,
      letterSpacing: 1.6,
      color: color,
    );

TextStyle kLabel({Color color = kDark, double tracking = 1.2}) => kArchivo(
      size: 11,
      weight: FontWeight.w800,
      letterSpacing: tracking,
      color: color,
    );

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kBg,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kAccent,
          onPrimary: kBg,
          primaryContainer: kSurface,
          onPrimaryContainer: kDark,
          secondary: kDark,
          onSecondary: kBg,
          secondaryContainer: kSurface,
          onSecondaryContainer: kDark,
          tertiary: kDeepRed,
          onTertiary: kBg,
          tertiaryContainer: kBg,
          onTertiaryContainer: kDark,
          error: kDeepRed,
          onError: kBg,
          errorContainer: kBg,
          onErrorContainer: kDeepRed,
          surface: kBg,
          onSurface: kDark,
          surfaceContainerHighest: kSurface,
          surfaceContainerHigh: kSurface,
          surfaceContainer: kSurface,
          surfaceContainerLow: kBg,
          surfaceContainerLowest: kBg,
          onSurfaceVariant: kMuted,
          outline: kDark,
          outlineVariant: kDivider,
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: kDark,
          onInverseSurface: kBg,
          inversePrimary: kBg,
          surfaceTint: Colors.transparent,
        ),
        textTheme: GoogleFonts.archivoTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: kBg,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: kDark),
          actionsIconTheme: const IconThemeData(color: kDark),
          titleTextStyle: GoogleFonts.archivo(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            letterSpacing: -0.96,
            color: kDark,
          ),
        ),
        cardTheme: const CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(),
          color: kBg,
          margin: EdgeInsets.zero,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kSurface,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: kDivider),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: kDivider),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: kDark, width: 1.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: kAccent),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: kAccent, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          labelStyle: GoogleFonts.archivo(
            fontWeight: FontWeight.w800,
            fontSize: 10,
            letterSpacing: 1.1,
            color: kMuted,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: const RoundedRectangleBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            textStyle: GoogleFonts.archivo(fontWeight: FontWeight.w800, fontSize: 14),
            minimumSize: const Size(0, 50),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(),
            side: const BorderSide(color: kDivider),
            textStyle: GoogleFonts.archivo(fontWeight: FontWeight.w800, fontSize: 13),
            minimumSize: const Size(0, 48),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: kDivider,
          thickness: 1,
          space: 1,
        ),
        chipTheme: ChipThemeData(
          shape: const RoundedRectangleBorder(),
          backgroundColor: kSurface,
          side: const BorderSide(color: kDivider),
          labelStyle: GoogleFonts.archivo(fontSize: 11),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: kBg,
          shadowColor: Colors.transparent,
          elevation: 0,
          indicatorColor: Colors.transparent,
          iconTheme: const WidgetStatePropertyAll(IconThemeData(size: 20)),
          labelTextStyle: WidgetStatePropertyAll(
            GoogleFonts.archivo(
              fontWeight: FontWeight.w800,
              fontSize: 9.5,
              letterSpacing: 1.0,
            ),
          ),
        ),
      );
}
