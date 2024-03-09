import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/shared/utils/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF042644),
      floating: true,
      title: CachedNetworkImage(
        width: 55,
        imageUrl: Constants.tmdbLogo,
      ),
    );
  }
}
