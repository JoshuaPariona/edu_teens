import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_input.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/theme/extensions/grade_card_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int currentPage = 0;
  String? currentGrade;
  late final PageController _pageController;
  final nameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final nicknameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  bool handleNameSubmit(String text) {
    lastNameFocus.requestFocus();
    return false;
  }

  bool handleLastNameSubmit(String text) {
    nicknameFocus.requestFocus();
    return false;
  }

  bool handleNickNameSubmit(String text) {
    emailFocus.requestFocus();
    return false;
  }

  bool handleEmailSubmit(String text) {
    passwordFocus.requestFocus();
    return false;
  }

  bool handlePasswordSubmit(String text) {
    confirmPasswordFocus.requestFocus();
    return false;
  }

  bool handleConfirmPasswordSubmit(String text) {
    handleRegister();
    return false;
  }

  void handleRegister() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.pushReplacement(AppRoutes.signin.name);
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    nameFocus.dispose();
    lastNameFocus.dispose();
    nicknameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppPage(
            scroll: false,
            topRounded: false,
            children: [
              PageIndicator(count: 2, currentIndex: currentPage),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AppPage(
                      withPadding: false,
                      topRounded: false,
                      topPaddingFixed: false,
                      header: Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spaceLarge,
                        ),
                        child: AppText(
                          "Cuéntanos ¿En qué grado del cole vas?",
                          weight: AppTextWeightType.medium,
                          size: AppTextSizeType.h3,
                          textAlign: TextAlign.center,
                          color: AppColors.primary_5,
                        ),
                      ),
                      gridView: true,
                      childAspectRatio: 1,
                      children:
                          grades.map((grade) {
                            return GradeCard(
                              grade: grade,
                              currentGrade: currentGrade,
                              onTap:
                                  (grade) => {
                                    setState(() {
                                      currentGrade = grade;
                                    }),
                                  },
                            );
                          }).toList(),
                    ),
                    AppPage(
                      withPadding: false,
                      topRounded: false,
                      topPaddingFixed: false,
                      header: Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spaceLarge,
                        ),
                        child: AppText(
                          "Registrarse",
                          weight: AppTextWeightType.medium,
                          size: AppTextSizeType.h3,
                          textAlign: TextAlign.center,
                          color: AppColors.primary_5,
                        ),
                      ),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppDimensions.spaceMedium,
                          children: [
                            AppInput(
                              focusNode: nameFocus,
                              leadingIcon: AppIcons.user,
                              placeHolder: "Edu Cito",
                              label: "Nombres",
                              keyboardType: TextInputType.name,
                              onSubmit: handleNameSubmit,
                            ),
                            AppInput(
                              focusNode: lastNameFocus,
                              leadingIcon: AppIcons.user,
                              placeHolder: "Edu Cito",
                              label: "Apellidos",
                              keyboardType: TextInputType.name,
                              onSubmit: handleLastNameSubmit,
                            ),
                            AppInput(
                              focusNode: nicknameFocus,
                              leadingIcon: AppIcons.user,
                              placeHolder: "Educito",
                              label: "Apodo",
                              keyboardType: TextInputType.name,
                              onSubmit: handleNickNameSubmit,
                            ),
                            AppInput(
                              focusNode: emailFocus,
                              leadingIcon: AppIcons.email,
                              placeHolder: "educito@eduteens.com",
                              label: "Correo electrónico",
                              keyboardType: TextInputType.emailAddress,
                              onSubmit: handleEmailSubmit,
                            ),
                            AppInput(
                              focusNode: passwordFocus,
                              leadingIcon: AppIcons.lock,
                              placeHolder: "contraseña",
                              label: "Contraseña",
                              private: true,
                              keyboardType: TextInputType.visiblePassword,
                              onSubmit: handlePasswordSubmit,
                            ),
                            AppInput(
                              focusNode: confirmPasswordFocus,
                              leadingIcon: AppIcons.lock,
                              placeHolder: "contraseña",
                              label: "Confirmar contraseña",
                              private: true,
                              keyboardType: TextInputType.visiblePassword,
                              onSubmit: handleConfirmPasswordSubmit,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: AppDurations.pageTransition,
            left: currentPage == 1 ? AppDimensions.spaceMedium : null,
            bottom: AppDimensions.spaceLarge,
            right: AppDimensions.spaceMedium,
            child: AppButton(
              title: currentPage == 0 ? "Continuar" : "Registrarse",
              type: AppButtonType.primary,
              onPress:
                  currentPage == 0 && currentGrade != null
                      ? () => {
                        _pageController.animateToPage(
                          1,
                          duration: AppDurations.pageTransition,
                          curve: Curves.easeInOut,
                        ),
                      }
                      : currentPage == 1
                      ? handleRegister
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}

const grades = ["1", "2", "3", "4", "5"];

class GradeCard extends StatelessWidget {
  final String grade;
  final String? currentGrade;
  final void Function(String) onTap;
  const GradeCard({
    super.key,
    required this.grade,
    required this.currentGrade,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GradeCardTheme>()!;

    return GestureDetector(
      onTap: () => onTap(grade),
      child: AnimatedContainer(
        duration: AppDurations.buttonHoverDuration,
        padding: EdgeInsets.all(AppDimensions.spaceMedium),
        decoration: BoxDecoration(
          color:
              grade == currentGrade
                  ? theme.style.backgroundColorActive
                  : theme.style.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.spaceLarge),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transparent,
              ),
              child: Center(
                child: AppText(
                  grade,
                  weight: AppTextWeightType.bold,
                  size: AppTextSizeType.body,
                  customSize: 50,
                  color: theme.style.foregroundColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.spaceXSmall),
            AppText(
              "grado",
              weight: AppTextWeightType.bold,
              size: AppTextSizeType.subtitle,
              color: theme.style.foregroundColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: AppDimensions.spaceXSmall,
      children: List.generate(
        count,
        (index) => Expanded(
          child: AnimatedContainer(
            duration: AppDurations.pageTransition,
            height: AppDimensions.spaceSmall,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.spaceSmall / 2),
              ),
              color:
                  index == currentIndex
                      ? AppColors.primary_5
                      : AppColors.neutralDisabled,
            ),
          ),
        ),
      ),
    );
  }
}
