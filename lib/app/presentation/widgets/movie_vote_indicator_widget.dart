import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';

enum MovieVoteIndicatorWidgetSize { small, medium }

class MovieVoteIndicatorWidget extends StatelessWidget {
  final double voteAverage;
  final MovieVoteIndicatorWidgetSize size;

  const MovieVoteIndicatorWidget.small({
    super.key,
    required this.voteAverage,
    this.size = MovieVoteIndicatorWidgetSize.small,
  });

  const MovieVoteIndicatorWidget.medium({
    super.key,
    required this.voteAverage,
    this.size = MovieVoteIndicatorWidgetSize.medium,
  });

  Color get voteAverageColor => getVoteAverageColor(voteAverage);

  Color get voteAverageBackgroundColor =>
      HSLColor.fromColor(voteAverageColor).withLightness(0.3).toColor();

  Color getVoteAverageColor(double voteAverage) {
    if (voteAverage >= 7) {
      return Colors.green;
    }
    if (voteAverage >= 5) {
      return Colors.yellow;
    }
    return Colors.red;
  }

  String get voteAveragePercentLabel => (voteAverage * 10).toInt().toString();

  double get outerSize => size == MovieVoteIndicatorWidgetSize.small ? 38 : 44;
  double get innerSize => size == MovieVoteIndicatorWidgetSize.small ? 34 : 40;
  double get strokeWidth => size == MovieVoteIndicatorWidgetSize.small ? 2 : 3;
  double get mainFontSize =>
      size == MovieVoteIndicatorWidgetSize.small ? 14 : 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1A1A1A),
      ),
      width: outerSize,
      height: outerSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.transparent,
              ),
            ),
            width: innerSize,
            height: innerSize,
            child: CurvedCircularProgressIndicator(
              value: voteAverage / 10,
              color: voteAverageColor,
              strokeWidth: strokeWidth,
              backgroundColor: voteAverageBackgroundColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                voteAveragePercentLabel,
                style: TextStyle(
                  color: Colors.white,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: mainFontSize,
                ),
              ),
              const Text(
                '%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
