import 'dart:math';

import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flutter/material.dart';

class FlipCardController {
  _FlipCardWidgetState? _state;

  Future flipCard() async => _state?.flipCard();
}

class FlipCardWidget extends StatefulWidget {
  final FlipCardController controller;

  const FlipCardWidget({super.key, required this.controller});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isFlip = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    widget.controller._state = this;
  }

  Future flipCard() async {
    if (_animationController.isAnimating) return;
    _isFlip = !_isFlip;
    if (_isFlip) {
      await _animationController.forward();
    } else {
      await _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isFrontCard(double angle) {
    const double halfRotation = pi;

    return angle <= halfRotation / 2;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, c) {
        double angle = _animationController.value * -pi;
        final transform = Matrix4.identity()
          ..setEntry(2, 3, 0.001)
          ..rotateY(angle);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontCard(angle.abs())
              ? const FrontCard()
              : Transform(
                  transform: Matrix4.identity()..rotateY(pi),
                  alignment: Alignment.center,
                  child: const BackCard(),
                ),
        );
      },
      animation: _animationController,
    );
  }
}

class FrontCard extends StatelessWidget {
  const FrontCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppConst.kPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
          )
        ],
      ),
      child: Center(
        child: Text(
          'تفاحة',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColor.kPrimaryTextColor,
              ),
        ),
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  const BackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppConst.kPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
          )
        ],
      ),
      child: Center(
        child: Text(
          'Apple',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColor.kPrimaryTextColor,
              ),
        ),
      ),
    );
  }
}
