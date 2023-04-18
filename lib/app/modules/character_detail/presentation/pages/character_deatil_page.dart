import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/global_states.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/loading_state.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_entity.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/fetch_comic_list_event.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/get_comic_list_event.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/get_comic_list_bloc.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/widgets/cards/comic_card.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/widgets/shimmers/comic_card_shimmer.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetailPage extends StatefulWidget {
  final CharacterData? characterData;

  const CharacterDetailPage({Key? key, this.characterData}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final GetComicListBloc comicListBloc = Modular.get<GetComicListBloc>();
  @override
  void initState() {
    comicListBloc.add(
        GetComicListEvent(widget.characterData!.comics.collectionURI, 0, 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.asset('assets/images/mu_logo.png', scale: 2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: widget.characterData!.id,
                child: Card(
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
                  child: SingleChildScrollView(
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
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<GetComicListBloc, GlobalStates>(
                bloc: comicListBloc,
                builder: (context, state) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Comics with this Character',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          if (!comicListBloc.lastPage) {
                            comicListBloc.page++;
                            comicListBloc.lastPage = true;
                            comicListBloc.add(
                              FetchComicListEvent(
                                  url: widget
                                      .characterData!.comics.collectionURI,
                                  offset:
                                      comicListBloc.page * comicListBloc.count,
                                  limit: 5),
                            );
                          }
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            state is LoadingState ||
                                    state is FetchRequestLoadingState
                                ? SizedBox(
                                    height: 224,
                                    child: Row(children: [
                                      ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[100]!,
                                                highlightColor:
                                                    Colors.grey[800]!,
                                                child: const Card(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.black,
                                                      width: 0.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4)),
                                                  ),
                                                  child: SizedBox(
                                                    height: 224,
                                                    width: 138,
                                                  ),
                                                ),
                                              ),
                                          itemCount: comicListBloc
                                              .horizontalList.length)
                                    ]),
                                  )
                                : SizedBox(
                                    height: 238,
                                    child: Row(
                                      children: [
                                        ListView.builder(
                                            itemCount: comicListBloc
                                                .horizontalList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              final ComicDetailEntity data =
                                                  comicListBloc
                                                      .horizontalList[index];
                                              if (state is LoadingState ||
                                                  state
                                                      is FetchRequestLoadingState) {
                                                return const ComicCardShimmer();
                                              } else {
                                                return ComicCard(
                                                  data: data,
                                                );
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
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
