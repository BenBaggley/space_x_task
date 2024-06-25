import 'package:flutter/material.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';

/// {@template rocket_item}
/// List item for a rocket
/// {@endtemplate}
class RocketItemWidget extends StatelessWidget {
  /// {@macro rocket_item}
  const RocketItemWidget({
    super.key,
    required this.rocket,
  });

  /// The rocket to display
  final Rocket rocket;

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
                  rocket.thumbnail,
                  width: 100,
                  height: 75,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    rocket.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              rocket.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
