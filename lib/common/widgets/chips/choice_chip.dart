import 'package:crowncreation/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KChoiceChip extends StatelessWidget {
  const KChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = KHelperFunctions.getColor(text) != null;
    final dark = KHelperFunctions.isDarkMode(context);
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(
        color:
            selected
                ? dark
                    ? KColors.black
                    : KColors.black
                : null,
      ),
      avatar:
          isColor
              ? KCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: KHelperFunctions.getColor(text)!,
              )
              : null,
      shape: isColor ? const CircleBorder() : null,
      labelPadding:
          isColor ? const EdgeInsets.all(0) : null, // make icon in the center
      padding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? KHelperFunctions.getColor(text)! : null,
    );
  }
}
