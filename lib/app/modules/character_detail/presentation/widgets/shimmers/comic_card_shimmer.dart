import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComicCardShimmer extends StatelessWidget {
  const ComicCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.black87,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 0.5),
            ),
            child: SizedBox(
              height: 224,
              width: 138,
            ),
          ),
        ),
      ),
    );
  }
}
