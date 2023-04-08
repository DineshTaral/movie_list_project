import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double height, width, borderRadius;

  const CustomShimmerWidget(
      {required this.height,
      required this.width,
      required this.borderRadius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff4d4d4d),
      highlightColor: const Color(0xffa9a9a9),
      period: const Duration(seconds: 4),
      enabled: true,
      direction: ShimmerDirection.values[0],
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
