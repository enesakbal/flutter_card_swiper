import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_card_swiper/src/controller/controller_event.dart';

/// A controller that can be used to trigger swipes on a CardSwiper widget
/// and listen to swipe progress updates.
class CardSwiperController extends ValueNotifier<SwipeProgress> {
  final _eventController = StreamController<ControllerEvent>.broadcast();

  CardSwiperController()
      : super(
          const SwipeProgress(),
        );

  /// Stream of events that can be used to swipe the card.
  Stream<ControllerEvent> get events => _eventController.stream;

  /// Swipe the card to a specific direction.
  void swipe(CardSwiperDirection direction) {
    _eventController.add(ControllerSwipeEvent(direction));
  }

  // Undo the last swipe
  void undo() {
    _eventController.add(const ControllerUndoEvent());
  }

  // Change the top card to a specific index.
  void moveTo(int index) {
    _eventController.add(ControllerMoveEvent(index));
  }

  /// Update the swipe progress. This is called internally by CardSwiper.
  void updateProgress(SwipeProgress progress) {
    value = progress;
  }

  @override
  Future<void> dispose() async {
    await _eventController.close();
    super.dispose();
  }
}
