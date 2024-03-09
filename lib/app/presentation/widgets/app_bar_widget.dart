import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pilar_mobile_challenge/shared/utils/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      floating: true,
      title: SvgPicture.network(
        width: 55,
        Constants.tmdbLogo,
      ),
    );
  }
}
