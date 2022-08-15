import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/Tabs/Experiences/experiences_category_new.dart';
import 'package:marca_loreto/src/page/Tabs/Experiences/detail_experiences.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:provider/provider.dart';

class ExperiencesWithAppBar extends StatefulWidget {
  const ExperiencesWithAppBar({Key? key}) : super(key: key);

  @override
  State<ExperiencesWithAppBar> createState() => _ExperiencesWithAppBarState();
}

class _ExperiencesWithAppBarState extends State<ExperiencesWithAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: ValueListenableBuilder(
            valueListenable: provider.activate,
            builder: (BuildContext context, int data, Widget? child) {
              return Text(
                (provider.activateS.value == 1)
                    ? 'Experiences'
                    : 'Experiencias',
                style: TextStyle(
                  color: const Color(0xFF008d36),
                  fontSize: ScreenUtil().setHeight(24),
                  fontWeight: FontWeight.w700,
                ),
              );
            }),
        actions: const [
          ChangeLanguage(),
        ],
      ),
      body: Column(
        children: [
          const ExperiencesCategoryNew(),
          const Expanded(child: DetailExperiences()),
          SizedBox(height: ScreenUtil().setHeight(50)),
        ],
      ),
    );
  }
}
