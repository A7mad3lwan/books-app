import 'package:books/core/utils/assets.dart';
import 'package:books/core/utils/router.dart';
import 'package:books/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingText;

  @override
  void initState() {
    animationInit();
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 10),
        AnimatedBuilder(
          animation: slidingText,
          builder:
              (context, child) => SlideTransition(
                position: slidingText,
                child: Text(
                  'Read free Books',
                  style: Styles.textStyle18,
                  textAlign: TextAlign.center,
                ),
              ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void animationInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingText = Tween(
      begin: Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() async {
    Future.delayed(
      Duration(seconds: 2),
      () => GoRouter.of(context).push(AppRouter.kHomeViewRoute),
    );
  }
}
