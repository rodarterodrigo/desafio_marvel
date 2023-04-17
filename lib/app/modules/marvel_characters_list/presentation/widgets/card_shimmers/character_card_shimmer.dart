import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';

class CharacterCardShimmer extends StatelessWidget {
  const CharacterCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 380,
        width: 224,
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
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 0.5,
                  )),
              child: Column(
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[100]!,
                    baseColor: Colors.grey[800]!,
                    child: const Center(
                      child: Icon(UniconsLine.image,
                          color: Colors.black, size: 200),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.red[800]!,
                    child: Container(height: 4, color: Colors.red),
                  ),
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[100]!,
                    baseColor: Colors.grey[800]!,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.white,
                        ),
                        height: 124,
                        width: 224,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
