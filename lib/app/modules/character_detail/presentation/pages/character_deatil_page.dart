import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetailPage extends StatefulWidget {
  final CharacterData? characterData;

  const CharacterDetailPage({Key? key, this.characterData}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.asset('assets/images/mu_logo.png', scale: 2),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: widget.characterData!.id,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
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
                            bottomRight: Radius.elliptical(24, 24)),
                        side: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 0.5,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              '${widget.characterData!.thumbnail.path}.${widget.characterData!.thumbnail.extension}',
                          fit: BoxFit.fill,
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
                              widget.characterData!.name.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: SizedBox(
                            child: Shimmer.fromColors(
                              highlightColor: Colors.grey[500]!,
                              baseColor: Colors.grey[100]!,
                              child: Text(
                                widget.characterData!.description.toUpperCase(),
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
        ),
      ),
    );
  }
}
