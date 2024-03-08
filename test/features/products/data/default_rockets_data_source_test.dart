import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/data/data_sources/default_rockets_data_source.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';

import '../../../common.dart';
import '../../../fixtures/fixtures.dart';

void main() {
  group(DefaultRocketsDataSource, () {
    late MockDio dio;
    late DefaultRocketsDataSource dataSource;

    setUp(() {
      dio = MockDio();
      dataSource = DefaultRocketsDataSource(dio);
    });

    group('getRockets', () {
      test('success', () async {
        final json = jsonFixture('rockets.json');
        final jsonArray = json['docs'] as List<dynamic>;
        final rockets = jsonArray.map((j) => Rocket.fromJson(j)).toList();

        when(() => dio.post<Map<String, dynamic>>('/rockets/query',
            data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/rockets'),
            data: json,
          ),
        );

        final result = await dataSource.getRockets();

        expect(result.getOrElse(() => []), containsAll(rockets));
      });
      test('failure', () async {
        when(() => dio.post<Map<String, dynamic>>('/rockets/query',
            data: any(named: 'data'))).thenAnswer(
          (_) => Future.error(dioError()),
        );

        final result = await dataSource.getRockets();

        expect(result, equals(left(const Failure(message: 'message'))));
      });
    });
  });
}
