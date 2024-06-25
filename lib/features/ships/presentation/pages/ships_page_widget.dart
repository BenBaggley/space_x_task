import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:space_x/core/widgets/loading_indicator.dart';
import 'package:space_x/features/ships/application/cubit/cubit/ships_cubit.dart';
import 'package:space_x/features/ships/presentation/widgets/ships_list_widget.dart';

/// {@template ships_page}
/// Page that displays a list of ships
/// {@endtemplate}
class ShipsPageWidget extends StatelessWidget {
  /// {@macro ships_page}
  const ShipsPageWidget({super.key});

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
            loading: () => const LoadingIndicator(),
            data: (ships) => ShipsListWidget(ships),
            orElse: () => throw UnimplementedError(),
          );
        },
      ),
    );
  }
}
