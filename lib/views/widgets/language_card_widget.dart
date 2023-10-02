import 'package:flutter/material.dart';

class LanguageCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const LanguageCardWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title,style: Theme.of(context).textTheme.headlineSmall,),
        ),
      ),
    );
  }
}
