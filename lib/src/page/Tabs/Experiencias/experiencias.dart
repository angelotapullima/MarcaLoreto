import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class Experiencia extends StatefulWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  State<Experiencia> createState() => _ExperienciaState();
}

class _ExperienciaState extends State<Experiencia> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        controller: controller,
        slivers: const [
          HeaderExperiencia(),
        ],
      )),
    );
  }
}

class HeaderExperiencia extends StatefulWidget {
  const HeaderExperiencia({Key? key}) : super(key: key);

  @override
  State<HeaderExperiencia> createState() => _HeaderExperienciaState();
}

class _HeaderExperienciaState extends State<HeaderExperiencia> {
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
                      (provider.activateS.value == 1) ? 'Experiences' : 'Experiencias',
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
