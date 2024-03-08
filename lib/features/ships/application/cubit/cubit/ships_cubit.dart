import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';
import 'package:space_x/features/ships/domain/use_cases/get_ships.dart';

part 'ships_cubit.freezed.dart';
part 'ships_state.dart';

/// {@template ships_cubit}
/// Cubit for the ships feature, handling state management
/// {@endtemplate}
@injectable
class ShipsCubit extends Cubit<ShipsState> {
  /// {@macro ships_cubit}
  ShipsCubit(
    this._getShips,
  ) : super(const ShipsState.initial());

  final GetShips _getShips;

  /// Loads the ships
  Future<void> loadShips() async {
    emit(const ShipsState.loading());

    final result = await _getShips();

    result.fold(
      (failure) => emit(ShipsState.failure(failure.message)),
      (ships) => emit(ShipsState.data(ships)),
    );
  }
}
