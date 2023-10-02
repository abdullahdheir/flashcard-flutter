import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/views/widgets/language_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FlashCard",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: AppConst.kPadding),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConst.kPadding),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppConst.kPadding,
                    crossAxisSpacing: AppConst.kPadding,
                    mainAxisExtent: 120,
                  ),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return LanguageCardWidget(title:"Arabic",onTap:(){
                      AppRoute.toRoute(AppLink.flashCard);
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
