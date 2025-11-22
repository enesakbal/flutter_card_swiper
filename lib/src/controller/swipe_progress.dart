import 'package:flutter_card_swiper/src/direction/card_swiper_direction.dart';

/// Model representing the current swipe progress and direction.
class SwipeProgress {
  const SwipeProgress({
    this.progressPercentage,
    this.direction,
  });

  /// The swipe progress percentage (0-100), null when card is not being swiped.
  final double? progressPercentage;

  /// The direction in which the card is being swiped, null when card is not being swiped.
  final CardSwiperDirection? direction;

  /// Returns true if the card is currently being swiped.
  bool get isSwiping => progressPercentage != null && direction != null;

  SwipeProgress copyWith({
    double? progressPercentage,
    CardSwiperDirection? direction,
  }) {
    return SwipeProgress(
      progressPercentage: progressPercentage ?? this.progressPercentage,
      direction: direction ?? this.direction,
    );
  }

  @override
  String toString() => 'SwipeProgress(progressPercentage: $progressPercentage, direction: $direction)';
}
