import 'package:crowncreation/common/styles/spacing_styles.dart';
import 'package:crowncreation/common/widgets/login_signup/form_divider.dart';
import 'package:crowncreation/common/widgets/login_signup/social_buttons.dart';
import 'package:crowncreation/features/authentication/screens/login/widgets/login_form.dart';
import 'package:crowncreation/features/authentication/screens/login/widgets/login_header.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title & Sub-Title
              const KLoginHeader(),

              // Form
              const KLoginForm(),

              // Divider
              KFormDivider(dividerText: KTexts.orSignInWith.capitalize!),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Footer
              const KSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
