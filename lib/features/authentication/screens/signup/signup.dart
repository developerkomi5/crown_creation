import 'package:crowncreation/common/widgets/login_signup/form_divider.dart';
import 'package:crowncreation/common/widgets/login_signup/social_buttons.dart';
import 'package:crowncreation/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                KTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              // Form
              const KSignupForm(),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Divider
              KFormDivider(dividerText: KTexts.orSignUpWith.capitalize!),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Social Buttons
              const KSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
