import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/info_card.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      attachScrollController: true,
      children: [
        InfoCard(),
        ...buildWidgetArray(
          30,
          (n) => Padding(padding: EdgeInsets.all(20), child: Text("data")),
        ),
      ],
    );
  }
}
