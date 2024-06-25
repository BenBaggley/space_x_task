// ignore_for_file:public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/app/app.config.dart';
import 'package:space_x/app/routes.dart';
import 'package:space_x/l10n/l10n.dart';

part 'app_theme.dart';
part 'colors.dart';

class SpaceX extends StatefulWidget {
  const SpaceX({super.key});

  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    _initializeDependencies();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const SpaceX());
  }

  @override
  State<SpaceX> createState() => _SpaceXState();
}

class _SpaceXState extends State<SpaceX> {
  final router = GoRouter(routes: appRoutes);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      theme: buildTheme(ThemeData.light()),
      darkTheme: buildTheme(ThemeData.dark()),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

@injectableInit
void _initializeDependencies() => GetIt.I.init();
