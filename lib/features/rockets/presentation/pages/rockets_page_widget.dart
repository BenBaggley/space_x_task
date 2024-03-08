import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:space_x/features/rockets/application/cubit/cubit/rockets_cubit.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/presentation/widgets/rocket_item_widget.dart';

/// {@template rockets_page}
/// Page that displays a list of rockets
/// {@endtemplate}
class RocketsPageWidget extends StatefulWidget {
  /// {@macro rockets_page}
  const RocketsPageWidget({super.key});

  @override
  State<RocketsPageWidget> createState() => _RocketsPageWidgetState();
}

class _RocketsPageWidgetState extends State<RocketsPageWidget> {
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
            loading: () => buildLoading(context),
            data: (rockets) => buildRockets(context, rockets),
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

  Widget buildRockets(BuildContext context, List<Rocket> rockets) {
    return ListView.builder(
      itemCount: rockets.length,
      itemBuilder: (context, index) {
        return RocketItemWidget(
          rocket: rockets[index],
        );
      },
    );
  }
}
