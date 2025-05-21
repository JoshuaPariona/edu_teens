import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/theme/extensions/app_segmented_button_theme.dart';
import 'package:flutter/material.dart';

class AppSegmentedButtonItem {
  final String title;
  final int value;

  const AppSegmentedButtonItem({required this.title, required this.value});
}

class AppSegmentedButton extends StatefulWidget {
  final List<AppSegmentedButtonItem> items;
  final ValueChanged<int> onValueChanged;

  const AppSegmentedButton({
    super.key,
    required this.items,
    required this.onValueChanged,
  });

  @override
  State<AppSegmentedButton> createState() => _AppSegmentedButtonState();
}

class _AppSegmentedButtonState extends State<AppSegmentedButton> {
  int selectedValue = 0;

  void _onSelected(int value) {
    setState(() {
      selectedValue = value;
    });
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppSegmentedButtonTheme>()!;

    return Container(
      height:
          AppDimensions.spaceXSmall * 2 +
          AppDimensions.spaceMedium * 2 +
          AppDimensions.textBody,
      padding: const EdgeInsets.all(AppDimensions.spaceXSmall),
      decoration: BoxDecoration(
        color: theme.style.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.spaceXXLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            widget.items.map((item) {
              final isSelected = item.value == selectedValue;
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onSelected(item.value),
                  child: AnimatedContainer(
                    duration: AppDurations.pageTransition,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isSelected ? theme.style.foregroundColor : null,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.spaceXXLarge - 4,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spaceSmall,
                    ),
                    child: AppText(
                      item.title,
                      size: AppTextSizeType.body,
                      weight: AppTextWeightType.regular,
                      color:
                          isSelected
                              ?theme.style.labelActiveColor
                              : theme.style.labelColor,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
