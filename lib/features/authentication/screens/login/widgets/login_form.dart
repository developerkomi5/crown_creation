import 'package:crowncreation/features/authentication/controllers/login/login_controller.dart';
import 'package:crowncreation/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:crowncreation/features/authentication/screens/signup/signup.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:crowncreation/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class KLoginForm extends StatelessWidget {
  const KLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = KHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => KValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: KTexts.email,
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => KValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: KTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
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
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                        checkColor: Colors.black,
                      ),
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
                onPressed: () => controller.emailAndPasswordSignIn(),
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
