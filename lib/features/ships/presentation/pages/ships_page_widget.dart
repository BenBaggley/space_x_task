import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:space_x/features/ships/application/cubit/cubit/ships_cubit.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';
import 'package:space_x/features/ships/presentation/widgets/ship_item_widget.dart';

/// {@template ships_page}
/// Page that displays a list of ships
/// {@endtemplate}
class ShipsPageWidget extends StatefulWidget {
  /// {@macro ships_page}
  const ShipsPageWidget({super.key});

  @override
  State<ShipsPageWidget> createState() => _ShipsPageWidgetState();
}

class _ShipsPageWidgetState extends State<ShipsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShipsCubit>(
      create: (_) => GetIt.I()..loadShips(),
      child: BlocConsumer<ShipsCubit, ShipsState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            ),
            orElse: () {},
          );
        },
        buildWhen: (_, state) => state is! ShipsFailure,
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox(),
            loading: () => buildLoading(context),
            data: (ships) => buildShips(context, ships),
            orElse: () => throw UnimplementedError(),
          );
        },
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget buildShips(BuildContext context, List<Ship> ships) {
    return ListView.builder(
      itemCount: ships.length,
      itemBuilder: (context, index) {
        return ShipItemWidget(
          ship: ships[index],
        );
      },
    );
  }
}
