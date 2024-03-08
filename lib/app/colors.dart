// coverage:ignore-file
// ignore_for_file:public_member_api_docs

part of 'app.dart';

const kPrimaryColor = Colors.black;
const kTextAccentColor = Colors.white;
const kAccentColor = Colors.white;
const kPrimaryDarkColor = Colors.white;
const kSurfaceColor = Colors.white;
const kSurfaceDarkColor = Colors.black;

Color primaryColor(Brightness brightness) =>
    brightness == Brightness.light ? kPrimaryColor : kPrimaryDarkColor;
Color backgroundColor(Brightness brightness) =>
    brightness == Brightness.light ? kPrimaryDarkColor : kPrimaryColor;
Color get secondaryColor => kAccentColor;
Color textAccentColor(Brightness brightness) =>
    brightness == Brightness.light ? kTextAccentColor : kAccentColor;
Color surfaceColor(Brightness brightness) =>
    brightness == Brightness.light ? kSurfaceColor : kSurfaceDarkColor;
