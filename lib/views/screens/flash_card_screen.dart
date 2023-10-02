import 'dart:developer';

import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/providers/flash_card_provider.dart';
import 'package:flashcard/views/widgets/flip_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';

class FlashCardScreen extends StatelessWidget {
  const FlashCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("from flash card build function");
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
                    child: PageView.builder(
                      itemCount: 2,
                      controller: Provider.of<FlashCardProvider>(context)
                          .pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlipCardWidget(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppConst.kPadding,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: LinearProgressBar(
                      backgroundColor: AppColor.kGreyColor,
                      progressColor: AppColor.kPrimaryColor,
                      minHeight: 25,
                      progressType: LinearProgressBar.progressTypeLinear,
                      currentStep: 0,
                      maxSteps: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: AppConst.kPadding * 2,
                      bottom: AppConst.kPadding,
                      top: AppConst.kPadding - 5,
                    ),
                    child: Text(
                      "0/10",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColor.kPrimaryTextColor,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Provider.of<FlashCardProvider>(context, listen: false)
                            .flipCard();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: AppConst.kPadding * 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Selector<FlashCardProvider, String>(
                        selector: (_, pr) => pr.flipButtonText,
                        builder: (_, v, C) => Text(
                          v.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColor.kSecondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
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
