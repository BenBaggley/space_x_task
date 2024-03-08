import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/data/network_utils.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/data_sources/rockets_data_source.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';

/// {@template default_rockets_data_source}
/// Default implementation of [RocketsDataSource] using [Dio]
/// {@endtemplate}
@Injectable(as: RocketsDataSource)
class DefaultRocketsDataSource implements RocketsDataSource {
  final Dio _dio;

  /// {@macro default_rockets_data_source}
  DefaultRocketsDataSource(this._dio);

  @override
  Future<Either<Failure, List<Rocket>>> getRockets() async {
    return catchFailure(() async {
      final query = {
        'query': {
          'flickrImages': {
            "\$nin": [null, []]
          },
        },
        'options': {
          'limit': 100,
          'select': [
            'id',
            'name',
            'description',
            'flickr_images',
          ]
        }
      };
      final response =
          await _dio.post<Map<String, dynamic>>('/rockets/query', data: query);

      final rockets = response.data!['docs'] as List<dynamic>;

      return rockets.map((json) => Rocket.fromJson(json)).toList();
    });
  }
}
