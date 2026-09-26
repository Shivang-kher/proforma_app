import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ── Surfaces & ink ────────────────────────────────────────
const kGround  = Color(0xFFF4F3F1); // page background
const kCard    = Color(0xFFFFFFFF); // content cards
const kTrack   = Color(0xFFEDEBE8); // segmented control track
const kFill    = Color(0xFFE6E3DF); // secondary button fill
const kInk     = Color(0xFF1C1B1A); // primary text
const kMuted   = Color(0xFF696561); // secondary text (4.7:1 on ground)
const kFaint   = Color(0xFFA8A49F); // tertiary text / timestamps
const kDisabled = Color(0xFFC9C5C0); // out-of-month dates
const kHairline = Color(0x121C1B1A); // 7% ink — dividers inside cards

// ── Module accents ────────────────────────────────────────
const kClinical = Color(0xFFEC3013);
const kExercise = Color(0xFF12785F);
const kStudy    = Color(0xFF4F46E5);

// ── Category accents (Study module) ───────────────────────
const kCatStudy    = Color(0xFF4F46E5);
const kCatWork     = Color(0xFFB35309);
const kCatPersonal = Color(0xFF12785F);
const kOverdue     = Color(0xFFC2410C);

Color categoryColor(String category) => switch (category) {
      'work' => kCatWork,
      'personal' => kCatPersonal,
      _ => kCatStudy,
    };

// ── Radius scale ──────────────────────────────────────────
const kRadChip  = 10.0;
const kRadField = 14.0;
const kRadCard  = 16.0;
const kRadPanel = 22.0;
const kRadSheet = 28.0;
const kRadPill  = 999.0;

// ── Type ──────────────────────────────────────────────────
TextStyle kArchivo({
  double size = 14,
  FontWeight weight = FontWeight.w400,
  double? letterSpacing,
  Color color = kInk,
  double? height,
  TextDecoration? decoration,
}) =>
    GoogleFonts.archivo(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      color: color,
      height: height,
      decoration: decoration,
    );

/// Screen title — "September", "Tasks", "Stats"
TextStyle kDisplay({Color color = kInk}) =>
    kArchivo(size: 28, weight: FontWeight.w700, letterSpacing: -0.9, height: 1.15, color: color);

/// Sheet / section heading
TextStyle kTitle({Color color = kInk}) =>
    kArchivo(size: 22, weight: FontWeight.w700, letterSpacing: -0.6, color: color);

/// Primary row text
TextStyle kRow({Color color = kInk, bool strike = false}) => kArchivo(
      size: 14,
      weight: FontWeight.w500,
      color: color,
      decoration: strike ? TextDecoration.lineThrough : null,
    );

/// Secondary detail under a row
TextStyle kMetaText({Color color = kMuted}) => kArchivo(size: 12.5, color: color);

/// Field label above an input
TextStyle kFieldLabel({Color color = kMuted}) =>
    kArchivo(size: 12, weight: FontWeight.w600, color: color);

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: kGround,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: kInk,
        onPrimary: kCard,
        primaryContainer: kCard,
        onPrimaryContainer: kInk,
        secondary: kMuted,
        onSecondary: kCard,
        secondaryContainer: kTrack,
        onSecondaryContainer: kInk,
        tertiary: kStudy,
        onTertiary: kCard,
        tertiaryContainer: kCard,
        onTertiaryContainer: kInk,
        error: kOverdue,
        onError: kCard,
        errorContainer: kCard,
        onErrorContainer: kOverdue,
        surface: kGround,
        onSurface: kInk,
        surfaceContainerHighest: kCard,
        surfaceContainerHigh: kCard,
        surfaceContainer: kCard,
        surfaceContainerLow: kTrack,
        surfaceContainerLowest: kGround,
        onSurfaceVariant: kMuted,
        outline: kFaint,
        outlineVariant: kHairline,
        shadow: Colors.black,
        scrim: Color(0xCC2A2825),
        inverseSurface: kInk,
        onInverseSurface: kGround,
        inversePrimary: kCard,
        surfaceTint: Colors.transparent,
      ),
      textTheme: GoogleFonts.archivoTextTheme(base.textTheme).apply(
        bodyColor: kInk,
        displayColor: kInk,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: kGround,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: kInk),
        actionsIconTheme: const IconThemeData(color: kInk),
        titleTextStyle: GoogleFonts.archivo(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.9,
          color: kInk,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: kCard,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadCard)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadField),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadField),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadField),
          borderSide: const BorderSide(color: kInk, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadField),
          borderSide: const BorderSide(color: kOverdue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadField),
          borderSide: const BorderSide(color: kOverdue, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        hintStyle: GoogleFonts.archivo(fontSize: 14, color: kFaint),
        labelStyle: GoogleFonts.archivo(fontSize: 14, color: kMuted),
        floatingLabelStyle: GoogleFonts.archivo(fontSize: 13, color: kMuted),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: kInk,
          foregroundColor: kCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadCard)),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: const Size(0, 50),
          textStyle: GoogleFonts.archivo(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: kInk,
          backgroundColor: kFill,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadCard)),
          minimumSize: const Size(0, 50),
          textStyle: GoogleFonts.archivo(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kMuted,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadField)),
          textStyle: GoogleFonts.archivo(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
      dividerTheme: const DividerThemeData(color: kHairline, thickness: 1, space: 1),
      chipTheme: ChipThemeData(
        backgroundColor: kCard,
        selectedColor: kInk,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        showCheckmark: false,
        // The label colour MUST resolve per state. Left unset, Material picks
        // it off the colour scheme and lands on white for both states, which
        // renders unselected chips as blank white pills.
        labelStyle: GoogleFonts.archivo(
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected) ? kCard : kInk,
          ),
        ),
        secondaryLabelStyle: GoogleFonts.archivo(
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: kCard,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: kGround,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(kRadSheet)),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: kCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadPanel)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: kInk,
        contentTextStyle: GoogleFonts.archivo(fontSize: 13, color: kGround),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadField)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: kGround,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        height: 64,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: const WidgetStatePropertyAll(IconThemeData(size: 20)),
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.archivo(fontSize: 10.5, fontWeight: FontWeight.w500),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? kCard : kCard,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? kStudy : kDisabled,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
