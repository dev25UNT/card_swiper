import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math' as math;
import 'CardLabel.dart';
import 'SwipeDirection.dart';

class CardOverlay extends StatelessWidget {
  const CardOverlay({
    required this.direction,
    required this.swipeProgress,
    super.key,
  });
  final CardSwiperDirection direction;
  final double swipeProgress;

  @override
  Widget build(BuildContext context) {
    final opacity = math.min<double>(swipeProgress, 1);

    final isRight = direction == CardSwiperDirection.right;
    final isLeft = direction == CardSwiperDirection.left;
    return Stack(
      children: [
        Opacity(
          opacity: isRight ? opacity : 0,
          child: CardLabel.right(),
        ),
        Opacity(
          opacity: isLeft ? opacity : 0,
          child: CardLabel.left(),
        ),
      ],
    );
  }
}