import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListViewCharacterCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final CharacterData characterData;

  const ListViewCharacterCard(
      {Key? key, required this.onTap, required this.characterData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 400,
          width: 400,
          child: Column(
            children: [
              Card(
                color: Colors.black87,
                elevation: 4,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(24)),
                    side: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.5,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CachedNetworkImage(
                      height: 200,
                      width: 200,
                      imageUrl:
                          '${characterData.thumbnail.path}.${characterData.thumbnail.extension}',
                      fit: BoxFit.cover,
                    ),
                    Shimmer.fromColors(
                        highlightColor: Colors.red[800]!,
                        baseColor: Colors.red,
                        child: Container(height: 4, color: Colors.red)),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Shimmer.fromColors(
                        highlightColor: Colors.grey[500]!,
                        baseColor: Colors.grey[100]!,
                        child: Text(
                          textAlign: TextAlign.left,
                          characterData.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 100,
                        child: Shimmer.fromColors(
                          highlightColor: Colors.grey[500]!,
                          baseColor: Colors.grey[100]!,
                          child: Text(
                            characterData.description.toUpperCase(),
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
