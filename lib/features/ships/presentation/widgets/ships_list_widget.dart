import 'package:flutter/material.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';
import 'package:space_x/features/ships/presentation/widgets/ship_item_widget.dart';

/// {@template ships_list}
/// Displays ships in a list
/// {@endtemplate}
class ShipsListWidget extends StatelessWidget {
  /// {@macro ships_list}
  const ShipsListWidget(this.ships, {super.key});

  /// Ships to display
  final List<Ship> ships;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: ships.length,
      itemBuilder: (context, index) {
        return ShipItemWidget(
          ship: ships[index],
        );
      },
    );
  }
}
