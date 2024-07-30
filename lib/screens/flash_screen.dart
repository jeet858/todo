import 'package:flutter/material.dart';
import 'package:todo/widgets/flash_screen_animated.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flash_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const FlashScreenAnimatedList(),
      ),
    );
  }
}
