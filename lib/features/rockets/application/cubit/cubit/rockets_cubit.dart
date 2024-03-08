import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/domain/use_cases/get_rockets.dart';

part 'rockets_cubit.freezed.dart';
part 'rockets_state.dart';

/// {@template rockets_cubit}
/// Cubit for the rockets feature, handling state management
/// {@endtemplate}
@injectable
class RocketsCubit extends Cubit<RocketsState> {
  /// {@macro rockets_cubit}
  RocketsCubit(
    this._getRockets,
  ) : super(const RocketsState.initial());

  final GetRockets _getRockets;

  /// Loads the rockets
  Future<void> loadRockets() async {
    emit(const RocketsState.loading());

    final result = await _getRockets();

    result.fold(
      (failure) => emit(RocketsState.failure(failure.message)),
      (rockets) => emit(RocketsState.data(rockets)),
    );
  }
}
