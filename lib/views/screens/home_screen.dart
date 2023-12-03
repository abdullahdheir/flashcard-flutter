import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/classes/constants.dart';
import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/providers/main_provider.dart';
import 'package:flashcard/views/widgets/drawer.dart';
import 'package:flashcard/views/widgets/language_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: AppColor.kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          "FlashCard",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            return Provider.of<MainProvider>(context, listen: false)
                .refreshLanguagesList();
          },
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: Padding(
            padding: const EdgeInsets.only(top: AppConst.kPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppConst.kPadding),
                  child: Selector<MainProvider, List>(
                    selector: (p0, p1) => p1.languagesList,
                    builder: (_, langs, w) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppConst.kPadding * .5,
                          crossAxisSpacing: AppConst.kPadding,
                          mainAxisExtent: 120,
                        ),
                        itemCount: langs.length,
                        itemBuilder: (_, index) {
                          return LanguageCardWidget(
                              title: "${langs[index].name}",
                              onTap: () {
                                AppRoute.toRoute(
                                  AppLink.flashCard,
                                  args: langs[index],
                                );
                              });
                        }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
