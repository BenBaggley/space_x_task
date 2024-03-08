import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship.freezed.dart';
part 'ship.g.dart';

/// {@template ship}
/// Represents a Space X ship
/// {@endtemplate}
@freezed
class Ship with _$Ship {
  /// {@macro ship}
  const factory Ship({
    required String id,
    required String name,
    required String image,
  }) = _Rocket;

  /// Creates a [Ship] from a JSON object
  factory Ship.fromJson(Map<String, dynamic> json) => _$ShipFromJson(json);
}
