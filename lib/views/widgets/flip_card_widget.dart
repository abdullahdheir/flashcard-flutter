import 'dart:math';
import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/providers/flash_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late FlashCardProvider flashCardProvider;

  @override
  void initState() {
    flashCardProvider = Provider.of<FlashCardProvider>(context, listen: false);
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    flashCardProvider.loadAnimationController(AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    ));
  }

  bool isFrontCard(double angle) {
    const double halfRotation = pi;

    return angle <= halfRotation / 2;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, c) {
        double angle =
            flashCardProvider.animationController.value  *
                -pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
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
      animation: flashCardProvider!.animationController,
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
