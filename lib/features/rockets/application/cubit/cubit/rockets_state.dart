part of 'rockets_cubit.dart';

/// States for the rockets feature
@freezed
class RocketsState with _$RocketsState {
  /// Initial state
  const factory RocketsState.initial() = RocketsInitial;

  /// Loading state
  const factory RocketsState.loading() = RocketsLoading;

  /// Loaded state
  const factory RocketsState.data(List<Rocket> rockets) = RocketsData;

  /// Error state
  const factory RocketsState.failure(String message) = RocketsFailure;
}
