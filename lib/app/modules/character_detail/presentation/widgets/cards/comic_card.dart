import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_entity.dart';
import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {
  final ComicDetailEntity data;

  const ComicCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          child: CachedNetworkImage(
            width: 138,
            height: 224,
            imageUrl: '${data.thumbnail.path}.${data.thumbnail.extension}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
