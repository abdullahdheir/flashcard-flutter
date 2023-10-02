import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/views/widgets/flip_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashCardScreen extends StatelessWidget {
  FlashCardScreen({super.key});

  FlipCardController controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                color: AppColor.kPrimaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConst.kPadding + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConst.kPadding * 2,
                        vertical: AppConst.kPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoute.back();
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            size: 40,
                            color: AppColor.kSecondaryColor,
                          ),
                        ),
                        Text(
                          "Learning the \nEnglish",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FlipCardWidget(
                      controller: controller,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        // _flipCard();
                        await controller.flipCard();
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
                        "Flip card".toUpperCase(),
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColor.kSecondaryColor,
                              letterSpacing: 2
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
