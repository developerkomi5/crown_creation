import 'package:crowncreation/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crowncreation/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class KPrimaryHeaderContainer extends StatelessWidget {
  const KPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KCurvedEdgeWidget(
      child: Container(
        color: KColors.primary,

        // size.isFinite: is not true error occured!
        child: Stack(
          children: [
            child,
            // Background custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: KCircularContainer(
                backgroundColor: KColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: KCircularContainer(
                backgroundColor: KColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
