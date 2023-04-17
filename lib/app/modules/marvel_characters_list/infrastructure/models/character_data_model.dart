import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_thumbnail.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comics.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/events.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/series.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/stories.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/url_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/character_thumbnail_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/comics_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/events_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/series_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/stories_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/url_list_model.dart';

class CharacterDataModel extends CharacterData {
  const CharacterDataModel({
    required int id,
    required String name,
    required String description,
    required String modified,
    required CharacterThumbnail thumbnail,
    required String resourceURI,
    required Comics comics,
    required Series series,
    required Stories stories,
    required Events events,
    required UrlList urls,
  }) : super(
          name: name,
          resourceURI: resourceURI,
          urls: urls,
          id: id,
          comics: comics,
          description: description,
          events: events,
          modified: modified,
          series: series,
          stories: stories,
          thumbnail: thumbnail,
        );

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) =>
      CharacterDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        modified: json['modified'],
        thumbnail: CharacterThumbnailModel.fromJson(json['thumbnail']),
        resourceURI: json['resourceURI'],
        comics: ComicsModel.fromJson(json['comics']),
        series: SeriesModel.fromJson(json['series']),
        stories: StoriesModel.fromJson(json['stories']),
        events: EventsModel.fromJson(json['events']),
        urls: UrlListModel.fromJson(json['urls']),
      );
}
