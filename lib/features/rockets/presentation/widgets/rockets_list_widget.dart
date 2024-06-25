import 'package:flutter/material.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/presentation/widgets/rocket_item_widget.dart';

/// {@template rockets_list}
/// Displays rockets in a list
/// {@endtemplate}
class RocketsListWidget extends StatelessWidget {
  /// {@macro rockets_list}
  const RocketsListWidget(this.rockets, {super.key});

  /// Rockets to display
  final List<Rocket> rockets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: rockets.length,
      itemBuilder: (context, index) {
        return RocketItemWidget(
          rocket: rockets[index],
        );
      },
    );
  }
}
