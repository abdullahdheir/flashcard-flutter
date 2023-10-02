import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/views/screens/flash_card_screen.dart';
import 'package:flashcard/views/screens/home_screen.dart';

final appRoutes = {
  AppLink.home:(_)=> const HomeScreen(),
  AppLink.flashCard:(_)=> FlashCardScreen(),
};