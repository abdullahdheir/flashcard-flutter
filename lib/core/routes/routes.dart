import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/providers/flash_card_provider.dart';
import 'package:flashcard/views/screens/flash_card_screen.dart';
import 'package:flashcard/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

final appRoutes = {
  AppLink.home: (_) => const HomeScreen(),
  AppLink.flashCard: (_) => ChangeNotifierProvider(
        create: (_) => FlashCardProvider(),
        child: const FlashCardScreen(),
      ),
};
