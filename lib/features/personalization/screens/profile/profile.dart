import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(showBackArrorw: true, title: Text('Profile')),
      // Body
      body: SingleChildScrollView(),
    );
  }
}
