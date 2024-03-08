part of 'app.dart';

/// App theme
ThemeData buildTheme(ThemeData base) {
  return base.copyWith(
    textTheme: GoogleFonts.barlowTextTheme(base.textTheme),
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColor(base.brightness),
      secondary: secondaryColor,
      background: surfaceColor(base.brightness),
      surface: surfaceColor(base.brightness),
      onSurface: textAccentColor(base.brightness),
      onPrimary: textAccentColor(base.brightness),
    ),
    scaffoldBackgroundColor: backgroundColor(base.brightness),
    cardColor: surfaceColor(base.brightness),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: kPrimaryColor,
      titleTextStyle: GoogleFonts.barlow(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textAccentColor(base.brightness),
      ),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textAccentColor(base.brightness),
        backgroundColor: primaryColor(base.brightness),
        textStyle: GoogleFonts.barlow(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        minimumSize: const Size.fromHeight(44),
      ),
    ),
  );
}
