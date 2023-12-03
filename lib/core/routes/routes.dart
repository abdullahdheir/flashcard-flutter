import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/providers/flash_card_provider.dart';
import 'package:flashcard/providers/language_provider.dart';
import 'package:flashcard/providers/main_provider.dart';
import 'package:flashcard/views/screens/add_langauge_screen.dart';
import 'package:flashcard/views/screens/finish_learn_screen.dart';
import 'package:flashcard/views/screens/flash_card_screen.dart';
import 'package:flashcard/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

final appRoutes = {
  AppLink.home: (_) => ChangeNotifierProvider(
        create: (_) => MainProvider(),
        child: const HomeScreen(),
      ),
  AppLink.flashCard: (_) => ChangeNotifierProvider(
        create: (_) => FlashCardProvider(),
        child: const FlashCardScreen(),
      ),
  AppLink.finishLearn: (_) => const FinishLearnScreen(),
  AppLink.addLanguage: (_) => ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
        child: const AddLanguageScreen(),
      ),
};
