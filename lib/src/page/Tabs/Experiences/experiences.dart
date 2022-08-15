import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/Tabs/Experiences/experiences_category.dart';
import 'package:marca_loreto/src/page/Tabs/Experiences/detail_experiences.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class Experiences extends StatefulWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        controller: controller,
        slivers: const [
          HeaderExperiences(),
          ExperiencesCategory(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: DetailExperiences(),
          ),
        ],
      )),
    );
  }
}

class HeaderExperiences extends StatefulWidget {
  const HeaderExperiences({Key? key}) : super(key: key);

  @override
  State<HeaderExperiences> createState() => _HeaderExperiencesState();
}

class _HeaderExperiencesState extends State<HeaderExperiences> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: ScreenUtil().setHeight(48),
        maxHeight: ScreenUtil().setHeight(48),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(16),
              ),
              ValueListenableBuilder(
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
              const Spacer(),
              const ChangeLanguage(),
            ],
          ),
        ),
      ),
    );
  }
}
