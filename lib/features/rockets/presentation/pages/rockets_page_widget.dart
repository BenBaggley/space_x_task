import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:space_x/core/widgets/loading_indicator.dart';
import 'package:space_x/features/rockets/application/cubit/cubit/rockets_cubit.dart';
import 'package:space_x/features/rockets/presentation/widgets/rockets_list_widget.dart';

/// {@template rockets_page}
/// Page that displays a list of rockets
/// {@endtemplate}
class RocketsPageWidget extends StatelessWidget {
  /// {@macro rockets_page}
  const RocketsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RocketsCubit>(
      create: (_) => GetIt.I()..loadRockets(),
      child: BlocConsumer<RocketsCubit, RocketsState>(
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
        buildWhen: (_, state) => state is! RocketsFailure,
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox(),
            loading: () => const LoadingIndicator(),
            data: (rockets) => RocketsListWidget(rockets),
            orElse: () => throw UnimplementedError(),
          );
        },
      ),
    );
  }
}
