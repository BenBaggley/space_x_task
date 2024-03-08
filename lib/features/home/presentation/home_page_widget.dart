import 'package:flutter/material.dart';
import 'package:space_x/features/rockets/presentation/pages/rockets_page_widget.dart';
import 'package:space_x/features/ships/presentation/pages/ships_page_widget.dart';
import 'package:space_x/l10n/l10n.dart';

/// {@template home_page}
/// Page that displays the app title, tabs and content
/// {@endtemplate}
class HomePageWidget extends StatefulWidget {
  /// {@macro home_page}
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int selectedIndex = 0;

  final pages = const [
    RocketsPageWidget(),
    ShipsPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
        centerTitle: true,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.rocket),
            label: context.l10n.rocketsTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.water),
            label: context.l10n.shipsTab,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}
