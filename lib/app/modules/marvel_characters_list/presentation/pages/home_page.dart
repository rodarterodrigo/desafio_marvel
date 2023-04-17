import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/global_states.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/loading_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/fetch_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/get_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/get_character_list_bloc.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/fetch_request_loading_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/card_shimmers/character_card_shimmer.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/card_shimmers/list_view_character_card_shimmer.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/cards/list_view_chaacter_card.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/carousels/home_banner_carousel_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetCharacterListBloc characterListBloc =
      Modular.get<GetCharacterListBloc>();

  final PageController pageController = PageController(
    initialPage: 1000,
  );

  @override
  void initState() {
    characterListBloc.add(const GetCharacterListEvent(0, 10));
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    if (!characterListBloc.lastPage) {
                      characterListBloc.page++;
                      characterListBloc.lastPage = true;
                      characterListBloc.add(
                        FetchCharacterListEvent(
                            characterListBloc.index * characterListBloc.page,
                            10),
                      );
                    }
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BlocBuilder<GetCharacterListBloc, GlobalStates>(
                          bloc: characterListBloc,
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CharacterCardShimmer(),
                                    ],
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          const ListViewCharacterCardShimmer(),
                                      itemCount: 10)
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  HomeBannerCarouselSlide(
                                    pageController: pageController,
                                    list: characterListBloc
                                        .characterListhorizontalScroll,
                                  ),
                                  const SizedBox(height: 16.0),
                                  ListView.builder(
                                      itemCount: characterListBloc
                                          .characterListinfinityScroll.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (state is FetchRequestLoadingState) {
                                          return const ListViewCharacterCardShimmer();
                                        } else {
                                          return ListViewCharacterCard(
                                              onTap: () {},
                                              characterData: characterListBloc
                                                      .characterListinfinityScroll[
                                                  index]);
                                        }
                                      })
                                ],
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
