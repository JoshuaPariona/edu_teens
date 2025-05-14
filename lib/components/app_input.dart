import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String placeHolder;

  const AppInput({super.key, required this.placeHolder});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleTextChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;
    final showFloatingLabel = _isFocused || hasText;

    return Stack(
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(
            color: AppColors.neutralBase,
            fontSize: AppDimensions.textBody,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: '',
            prefixIcon: Icon(
              AppIcons.search,
              color: AppColors.primary,
              size: AppDimensions.inputIconSize,
            ),
            filled: true,
            fillColor: AppColors.neutralInverted,
            contentPadding: EdgeInsets.only(
              top: AppDimensions.spaceLarge,
              left: AppDimensions.spaceSmall,
              right: AppDimensions.spaceSmall,
              bottom: AppDimensions.spaceSmall,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
              borderSide: BorderSide(color: AppColors.primary_2, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
          cursorColor: AppColors.primary,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
          top: showFloatingLabel ? 6 : AppDimensions.spaceMedium + 4,
          left: AppDimensions.inputIconSize + AppDimensions.spaceSmall + 20,
          child: IgnorePointer(
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: AppColors.neutralSubOrdinary,
                fontSize:
                    showFloatingLabel
                        ? AppDimensions.textFootnote
                        : AppDimensions.textBody,
                fontWeight: FontWeight.w400,
              ),
              child: Text(widget.placeHolder),
            ),
          ),
        ),
      ],
    );
  }
}
