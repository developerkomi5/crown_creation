import 'package:crowncreation/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class KCurvedEdgeWidget extends StatelessWidget {
  const KCurvedEdgeWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: KCustomCurvedEdges(), child: child);
  }
}
