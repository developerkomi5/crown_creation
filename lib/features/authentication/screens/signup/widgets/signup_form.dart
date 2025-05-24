import 'package:crowncreation/features/authentication/screens/signup/verify_email.dart';
import 'package:crowncreation/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class KSignupForm extends StatelessWidget {
  const KSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: KTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: KSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: KTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: KTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: KTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: KTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: KTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwItems),

          // Terms & Conditions Checkbox
          const KTermsandConditionsCheckbox(),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: Text(
                KTexts.createAccount,
                style: TextStyle(color: dark ? Colors.black : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
