import 'package:flutter/material.dart';

class FlashCardProvider extends ChangeNotifier {
  final pageController = PageController();
  late AnimationController animationController;

  bool isFlip = false;
  String flipButtonText = "flip card";

  _nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  toggleFlipCard() {
    isFlip = !isFlip;
  }

  _flipCard() async {
    if (isFlip) {
      await animationController.forward();
    }
  }

  flipCard() {
    if (animationController.isAnimating) return;
    if (isFlip) {
      _nextPage();
      flipButtonText = "flip card";
      toggleFlipCard();
    } else {
      toggleFlipCard();
      _flipCard();
      flipButtonText = "next card";
    }
    notifyListeners();
  }

  loadAnimationController(AnimationController controller)
  {
    animationController = controller;
  }
}
