import 'package:crowncreation/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:crowncreation/features/authentication/screens/signup/signup.dart';
import 'package:crowncreation/navigation_bar.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class KLoginForm extends StatelessWidget {
  const KLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: KTexts.email,
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: KTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwInputFields / 2),

            // Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (Value) {},
                      checkColor: Colors.black,
                    ),
                    const Text(KTexts.rememberMe),
                  ],
                ),
                // Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(KTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: KSizes.spaceBtwSections),

            // Signin Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationBarScreen()),
                child: Text(
                  KTexts.signIn,
                  style: TextStyle(color: dark ? Colors.black : Colors.black),
                ),
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(KTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
