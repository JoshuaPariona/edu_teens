import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/theme/extensions/app_input_theme.dart';
import 'package:flutter/material.dart';

enum _AppInputLocalState { focus, blur, disabled }

class AppInput extends StatefulWidget {
  final FocusNode focusNode;
  final IconData? leadingIcon;
  final String placeHolder;
  final String label;
  final bool private;
  final TextInputType? keyboardType;
  final bool Function(String)? onTextChange;
  final bool Function(String)? onSubmit;

  const AppInput({
    super.key,
    required this.focusNode,
    required this.placeHolder,
    required this.label,
    this.keyboardType,
    this.private = false,
    this.leadingIcon,
    this.onTextChange,
    this.onSubmit,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  final TextEditingController _controller = TextEditingController();
  late _AppInputLocalState _state;
  late bool obscureText;
  bool error = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.private;
    final isDisabled = widget.onTextChange == null && widget.onSubmit == null;
    _state =
        isDisabled ? _AppInputLocalState.disabled : _AppInputLocalState.blur;
    widget.focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    setState(() {
      _state =
          widget.focusNode.hasFocus
              ? _AppInputLocalState.focus
              : _AppInputLocalState.blur;
    });
  }

  void _handleTextChange() {
    if (widget.onTextChange != null) {
      setState(() {
        error = widget.onTextChange!(_controller.text);
      });
    }
  }

  void _handleSubmit(String text) {
    if (widget.onSubmit != null) {
      error = widget.onSubmit!(text);
    }
  }

  Color _selectColor({
    Color? err,
    Color? blur,
    Color? focus,
    Color? disabled,
    required Color defaultColor,
  }) {
    if (error) {
      return err ?? defaultColor;
    }
    switch (_state) {
      case _AppInputLocalState.blur:
        return blur ?? defaultColor;
      case _AppInputLocalState.focus:
        return focus ?? defaultColor;
      case _AppInputLocalState.disabled:
        return disabled ?? defaultColor;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppInputTheme>()!;
    final showFloatingLabel =
        _state == _AppInputLocalState.focus || _controller.text.isNotEmpty;

    return Stack(
      children: [
        AnimatedContainer(
          height: theme.style.height,
          width: double.infinity,
          duration: AppDurations.buttonHoverDuration,
          decoration: BoxDecoration(
            color: theme.style.backgroundColor,
            borderRadius: BorderRadius.circular(theme.style.borderRadius),
            border: Border.all(
              color: _selectColor(
                focus: theme.style.focusBorderColor,
                err: theme.style.errorColor,
                defaultColor: theme.style.borderColor,
              ),
              width: 2,
            ),
          ),
        ),
        Positioned(
          left: theme.style.horizontalPadding,
          top: theme.style.height / 2 - AppDimensions.inputIconSize / 2,
          child: Icon(
            widget.leadingIcon ?? AppIcons.search,
            color: _selectColor(
              disabled: theme.style.leadingDisableColor,
              err: theme.style.errorColor,
              defaultColor: theme.style.leadingColor,
            ),
            size: AppDimensions.inputIconSize,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
          top:
              showFloatingLabel
                  ? theme.style.verticalPadding
                  : theme.style.height / 2 - AppDimensions.textBody / 2,
          left:
              theme.style.horizontalPadding +
              theme.style.gap +
              AppDimensions.inputIconSize +
              2,
          child: IgnorePointer(
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: _selectColor(
                  disabled: theme.style.labelDisabledColor,
                  err: theme.style.tailErrorColor,
                  defaultColor: theme.style.labelColor,
                ),
                fontSize:
                    showFloatingLabel
                        ? AppDimensions.textLabel
                        : AppDimensions.textBody,
                fontWeight: FontWeight.w400,
              ),
              child: Text(widget.label),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                enabled: _state != _AppInputLocalState.disabled,
                obscureText: obscureText,
                style: TextStyle(
                  color: theme.style.placeholderColor,
                  fontSize: AppDimensions.textBody,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: showFloatingLabel ? widget.placeHolder : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left:
                        theme.style.horizontalPadding +
                        theme.style.gap +
                        AppDimensions.inputIconSize +
                        2,
                    right: theme.style.gap,
                    top:
                        theme.style.verticalPadding +
                        theme.style.verticalPadding +
                        AppDimensions.inputIconSize / 2,
                    bottom: theme.style.verticalPadding,
                  ),
                  isCollapsed: false,
                ),
                controller: _controller,
                focusNode: widget.focusNode,
                cursorColor: theme.style.focusBorderColor,
                cursorErrorColor: theme.style.errorColor,
                onSubmitted: _handleSubmit,
                textInputAction: TextInputAction.done,
                keyboardType: widget.keyboardType,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed:
                  _state == _AppInputLocalState.disabled
                      ? null
                      : () {
                        if (widget.private) {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        } else {
                          _controller.clear();
                        }
                        widget.focusNode.requestFocus();
                      },
              icon: Icon(
                widget.private
                    ? obscureText
                        ? AppIcons.eyeClosed
                        : AppIcons.eye
                    : AppIcons.close,
                color: _selectColor(
                  disabled: theme.style.tailDisableColor,
                  err: theme.style.tailErrorColor,
                  focus: theme.style.tailFocusColor,
                  blur: theme.style.tailBlurColor,
                  defaultColor: theme.style.tailBlurColor,
                ),
                size: AppDimensions.inputIconSize,
              ),
            ),
            SizedBox(width: theme.style.horizontalPadding),
          ],
        ),
      ],
    );
  }
}
