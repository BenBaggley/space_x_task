import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/data/network_utils.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/ships/domain/data_sources/ships_data_source.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';

/// {@template default_ships_data_source}
/// Default implementation of [ShipsDataSource] using [Dio]
/// {@endtemplate}
@Injectable(as: ShipsDataSource)
class DefaultShipsDataSource implements ShipsDataSource {
  final Dio _dio;

  /// {@macro default_ships_data_source}
  DefaultShipsDataSource(this._dio);

  @override
  Future<Either<Failure, List<Ship>>> getShips() async {
    return catchFailure(() async {
      final query = {
        'query': {
          'image': {
            "\$nin": [null, ""]
          },
        },
        'options': {
          'limit': 100,
          'select': [
            'id',
            'name',
            'image',
          ]
        }
      };
      final response =
          await _dio.post<Map<String, dynamic>>('/ships/query', data: query);

      final ships = response.data!['docs'] as List<dynamic>;

      return ships.map((json) => Ship.fromJson(json)).toList();
    });
  }
}
