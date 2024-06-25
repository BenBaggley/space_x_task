// coverage:ignore-file
// ignore_for_file:public_member_api_docs

part of 'app.dart';

const kPrimaryColor = Colors.black;
const kTextAccentColor = Colors.white;
const kAccentColor = Colors.white;
final kPrimaryDarkColor = Colors.grey.shade300;
const kSurfaceColor = Colors.white;
const kSurfaceDarkColor = Colors.black;
const kCardColor = Colors.white;
final kCardDarkColor = Colors.grey.shade900;

Color primaryColor(Brightness brightness) =>
    brightness == Brightness.light ? kPrimaryColor : kPrimaryDarkColor;
Color backgroundColor(Brightness brightness) =>
    brightness == Brightness.light ? kPrimaryDarkColor : kPrimaryColor;
Color get secondaryColor => kAccentColor;
Color textAccentColor(Brightness brightness) =>
    brightness == Brightness.light ? kTextAccentColor : kAccentColor;
Color surfaceColor(Brightness brightness) =>
    brightness == Brightness.light ? kSurfaceColor : kSurfaceDarkColor;
Color cardColor(Brightness brightness) =>
    brightness == Brightness.light ? kCardColor : kCardDarkColor;
Color statusBarColor(Brightness brightness) =>
    brightness == Brightness.light ? Colors.white : Colors.transparent;
