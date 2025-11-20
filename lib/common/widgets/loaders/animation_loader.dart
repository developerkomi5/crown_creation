import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// A widget for displaying an animated loading indicator with optional text and action button.

class KAnimationLoaderWidget extends StatelessWidget {
  // Default constructor for the KAnimationLoaderWidget.
  // Parameters:
  // - text: the text to be displayed below the animation.
  // - animation: the path to the lottie animation file.
  // - showAction: whether to show an action button below the text.
  // - actionText: the text to be displayed on the action button.
  // - onActionPressed: callback function to be executed when the action button is pressed.
  const KAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ), // Display lottie animation
          const SizedBox(height: KSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSizes.defaultSpace),
          showAction
              ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: KColors.dark,
                  ),
                  child: Text(
                    actionText!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: KColors.light),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
