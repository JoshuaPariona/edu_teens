import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_text_button.dart';
import 'package:edu_teens/components/next_button.dart';
import 'package:flutter/material.dart';

class UiTest extends StatefulWidget {
  const UiTest({super.key});

  @override
  State<UiTest> createState() => _UiTestState();
}

class _UiTestState extends State<UiTest> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  title: "Button control",
                  type: AppButtonType.primary,
                  isEnabled: true,
                  onPress: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Button",
                  type: AppButtonType.primary,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Button",
                  type: AppButtonType.neutral,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Button",
                  type: AppButtonType.outlined,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Button",
                  type: AppButtonType.secondary,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextButton(
                  title: "Button",
                  type: AppTextButtonType.text,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                AppTextButton(
                  title: "Button",
                  type: AppTextButtonType.link,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NextButton(
                  type: NextButtonType.primary,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                NextButton(
                  type: NextButtonType.neutral,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                NextButton(
                  type: NextButtonType.outlined,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                NextButton(
                  type: NextButtonType.secondary,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
                SizedBox(height: 20),
                NextButton(
                  type: NextButtonType.text,
                  isEnabled: isEnabled,
                  onPress: () {
                    print("hi hi");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
