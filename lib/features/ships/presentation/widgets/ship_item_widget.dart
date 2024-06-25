import 'package:flutter/material.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';

/// {@template ship_item}
/// List item for a ship
/// {@endtemplate}
class ShipItemWidget extends StatelessWidget {
  /// {@macro ship_item}
  const ShipItemWidget({
    super.key,
    required this.ship,
  });

  /// The ship to display
  final Ship ship;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.network(
                  ship.image,
                  width: 100,
                  height: 75,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    ship.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
