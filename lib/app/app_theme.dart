part of 'app.dart';

/// App theme
ThemeData buildTheme(ThemeData base) {
  return base.copyWith(
    textTheme: GoogleFonts.barlowTextTheme(base.textTheme),
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColor(base.brightness),
      secondary: secondaryColor,
      surface: surfaceColor(base.brightness),
      onSurface: textAccentColor(base.brightness),
      onPrimary: textAccentColor(base.brightness),
    ),
    scaffoldBackgroundColor: backgroundColor(base.brightness),
    cardTheme: base.cardTheme.copyWith(
      color: cardColor(base.brightness),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: kPrimaryColor,
      titleTextStyle: GoogleFonts.barlow(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textAccentColor(base.brightness),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: cardColor(base.brightness),
        systemNavigationBarDividerColor: cardColor(base.brightness),
        statusBarColor: Colors.transparent,
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      backgroundColor: cardColor(base.brightness),
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
