import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool darkEnviroment;

  const SkeletonContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
    required this.darkEnviroment,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Shimmer.fromColors(
        baseColor:
            darkEnviroment ? const Color(0x52FFFFFF) : const Color(0x52031D27),
        highlightColor:
            darkEnviroment ? const Color(0x29FFFFFF) : const Color(0x29031D27),
        child: Container(
          width: width,
          height: height,
          color: darkEnviroment
              ? const Color(0x7AFFFFFF)
              : const Color(0x7A031D27),
        ),
      ),
    );
  }
}
