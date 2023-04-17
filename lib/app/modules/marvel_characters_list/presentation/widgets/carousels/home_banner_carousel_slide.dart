import 'dart:async';

import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/cards/character_card.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/carousels/bloc/slide_dots_bloc/slide_dots_bloc.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/widgets/carousels/slide_dots.dart';
import 'package:flutter/material.dart';

class HomeBannerCarouselSlide extends StatefulWidget {
  final List<CharacterData>? list;
  final slidesDotBloc = SlideDotsBloc(0);
  final PageController? pageController;

  HomeBannerCarouselSlide({
    Key? key,
    required this.list,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomeBannerCarouselSlide> createState() =>
      _HomeBannerCarouselSlideState();
}

class _HomeBannerCarouselSlideState extends State<HomeBannerCarouselSlide> {
  var timer = Timer(const Duration(seconds: 0), () {});

  @override
  void initState() {
    if (widget.list!.length > 1) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        widget.pageController!.animateToPage(
            widget.pageController!.page!.toInt() + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn);
      });
    }
    super.initState();
  }

  void _onPageChange(int index) {
    if (widget.list!.length > 1) {
      timer.cancel();
      timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        widget.pageController!.animateToPage(
            widget.pageController!.page!.toInt() + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn);
      });
      widget.slidesDotBloc.add(index);
    }
  }

  @override
  void dispose() {
    timer.cancel();
    widget.slidesDotBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: 370,
            child: PageView.builder(
                controller: widget.pageController,
                onPageChanged: (index) =>
                    _onPageChange(index % widget.list!.length),
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                      child: CharacterCard(
                        characterData:
                            widget.list![index % widget.list!.length],
                        onTap: () {},
                      ),
                    ),
                  );
                }),
          ),
        ),
        StreamBuilder(
          initialData: 0,
          stream: widget.slidesDotBloc.stream,
          builder: (context, snapshot) => widget.list!.length > 1
              ? Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < widget.list!.length; i++)
                            i == widget.slidesDotBloc.index
                                ? const SlideDots(isActive: true)
                                : const SlideDots(isActive: false)
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
