import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flutter/material.dart';

class FlashCardProvider extends ChangeNotifier {
  final pageController = PageController();
  late AnimationController animationController;
  int listLength = 3;
  int currentIndex = 1;
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
      if (currentIndex == listLength) {
        goToFinishScreen();
        return;
      }
      _nextPage();
      currentIndex++;
      flipButtonText = "flip card";
      toggleFlipCard();
    } else {
      toggleFlipCard();
      _flipCard();
      if (currentIndex == listLength) {
        flipButtonText = "Finish";
      } else {
        flipButtonText = "next card";
      }
    }
    notifyListeners();
  }

  loadAnimationController(AnimationController controller) {
    animationController = controller;
  }

  goToFinishScreen() {
    AppRoute.toRouteAndReplace(AppLink.finishLearn);
  }
}
