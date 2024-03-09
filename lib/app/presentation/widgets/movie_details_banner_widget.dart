import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsBannerWidget extends StatelessWidget {
  final String backdropPathUrl;
  final String posterPathUrl;
  final Color? moviePosterPredominantColor;

  const MovieDetailsBannerWidget({
    super.key,
    required this.backdropPathUrl,
    required this.posterPathUrl,
    this.moviePosterPredominantColor,
  });

  @override
  Widget build(BuildContext context) {
    final bannerHeight = MediaQuery.of(context).size.width / 2.22;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 2.22,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: backdropPathUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: bannerHeight,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: const [0.6, 1],
                    colors: [
                      moviePosterPredominantColor ??
                          Colors.black.withOpacity(0),
                      moviePosterPredominantColor?.withOpacity(0) ??
                          Colors.black.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: CachedNetworkImage(
                height: (MediaQuery.of(context).size.width / 2.22 - 40),
                width:
                    (2 / 3) * ((MediaQuery.of(context).size.width / 2.22) - 40),
                imageUrl: posterPathUrl,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )
          ],
        ),
      ),
    );
  }
}
