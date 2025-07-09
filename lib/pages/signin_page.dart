import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_input.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/app_text_button.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_image_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  String email = "";
  String password = "";

  void _handleSubmit() {
    print("---------submit-------");
    print(email);
    print(password);
    context.pushReplacementNamed(AppRoutes.dashboard.name);
  }

  bool _onEmailChange(String text) {
    setState(() {
      email = text;
    });
    return false;
  }

  bool _onPasswordChange(String text) {
    setState(() {
      password = text;
    });
    return false;
  }

  bool _onEmailSubmit(String text) {
    print(text);
    passwordFocus.requestFocus();
    return false;
  }

  bool _onPasswordSubmit(String text) {
    print(text);
    _handleSubmit();
    return false;
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPage(
        topRounded: false,
        children: [
          AppText(
            "Iniciar sesión",
            size: AppTextSizeType.h3,
            weight: AppTextWeightType.medium,
            color: AppColors.primary_5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppInput(
                leadingIcon: AppIcons.email,
                placeHolder: "usuario123@eduteens.com",
                label: "Correo electrónico",
                onTextChange: _onEmailChange,
                onSubmit: _onEmailSubmit,
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppDimensions.spaceMedium),
              AppInput(
                leadingIcon: AppIcons.lock,
                placeHolder: "contraseña",
                label: "Contraseña",
                private: true,
                onTextChange: _onPasswordChange,
                onSubmit: _onPasswordSubmit,
                focusNode: passwordFocus,
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              title: "Iniciar sesion",
              type: AppButtonType.primary,
              onPress: _handleSubmit,
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 1,
                  color: AppColors.neutralDisabled,
                ),
                SizedBox(width: AppDimensions.spaceXSmall),
                AppText(
                  "o",
                  size: AppTextSizeType.subtitle,
                  color: AppColors.neutralDisabled,
                ),
                SizedBox(width: AppDimensions.spaceXSmall),
                Container(
                  width: 40,
                  height: 1,
                  color: AppColors.neutralDisabled,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.neutralDisabled,
                ),
                elevation: WidgetStateProperty.resolveWith<double>((states) {
                  if (states.contains(WidgetState.hovered)) return 1;
                  return 0;
                }),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    vertical: AppDimensions.spaceMedium,
                    horizontal: AppDimensions.spaceLarge,
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText("Continuar con", weight: AppTextWeightType.medium),
                    SizedBox(width: AppDimensions.spaceSmall),
                    Image.asset(
                      AppImageIcons.google,
                      width: AppDimensions.tabIconSize,
                      height: AppDimensions.tabIconSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText("¿No tienes cuenta?"),
              SizedBox(width: AppDimensions.spaceSmall),
              AppTextButton(
                title: "Registrate",
                type: AppTextButtonType.link,
                onPress: () => {context.pushNamed(AppRoutes.signup.name)},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
