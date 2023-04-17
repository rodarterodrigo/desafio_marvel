import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';

class ListViewCharacterCardShimmer extends StatelessWidget {
  const ListViewCharacterCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Shimmer.fromColors(
                  highlightColor: Colors.grey[100]!,
                  baseColor: Colors.grey[800]!,
                  child: const Center(
                    child:
                        Icon(UniconsLine.image, color: Colors.black, size: 200),
                  ),
                ),
                Shimmer.fromColors(
                    highlightColor: Colors.red[800]!,
                    baseColor: Colors.red,
                    child: Container(height: 4, color: Colors.red)),
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
    );
  }
}
