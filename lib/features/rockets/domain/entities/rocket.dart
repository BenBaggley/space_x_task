import 'package:freezed_annotation/freezed_annotation.dart';

part 'rocket.freezed.dart';
part 'rocket.g.dart';

/// {@template rocket}
/// Represents a Space X rocket
/// {@endtemplate}
@freezed
class Rocket with _$Rocket {
  /// {@macro rocket}
  const factory Rocket({
    required String id,
    required String name,
    required String description,
    required List<String> flickrImages,
  }) = _Rocket;

  /// Creates a [Rocket] from a JSON object
  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
}

/// Extension on [Rocket] providing the thumbnail
extension RocketThumbnail on Rocket {
  /// Image to be used as a thumbnail
  String get thumbnail => flickrImages.first;
}
