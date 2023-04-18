import 'package:desafio_marvel/app/core/shared/modules/domain/entities/marvel_thumbnail.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comics.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/events.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/series.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/stories.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/url_list.dart';

class CharacterData {
  final int id;
  final String name;
  final String description;
  final String modified;
  final MarvelThumbnnail thumbnail;
  final String resourceURI;
  final Comics comics;
  final Series series;
  final Stories stories;
  final Events events;
  final UrlList urls;

  const CharacterData(
      {required this.id,
      required this.name,
      required this.description,
      required this.modified,
      required this.thumbnail,
      required this.resourceURI,
      required this.comics,
      required this.series,
      required this.stories,
      required this.events,
      required this.urls});
}
