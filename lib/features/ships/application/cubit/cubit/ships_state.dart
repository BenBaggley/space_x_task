part of 'ships_cubit.dart';

/// States for the ships feature
@freezed
class ShipsState with _$ShipsState {
  /// Initial state
  const factory ShipsState.initial() = ShipsInitial;

  /// Loading state
  const factory ShipsState.loading() = ShipsLoading;

  /// Loaded state
  const factory ShipsState.data(List<Ship> ships) = ShipsData;

  /// Error state
  const factory ShipsState.failure(String message) = ShipsFailure;
}
