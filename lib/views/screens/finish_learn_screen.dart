import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class FinishLearnScreen extends StatelessWidget {
  const FinishLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(AppConst.kPadding),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
             AppRoute.toRouteAndReplaceAll(AppLink.home);
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColor.kPrimaryColor,
              padding: const EdgeInsets.symmetric(
                  vertical: AppConst.kPadding * 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Go to home".toUpperCase(),
              style:
              Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Lottie.asset("assets/animations/success.json"),
      ),
    );
  }
}
