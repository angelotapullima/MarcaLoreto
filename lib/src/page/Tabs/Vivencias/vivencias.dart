import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class Vivencias extends StatefulWidget {
  const Vivencias({Key? key}) : super(key: key);

  @override
  State<Vivencias> createState() => _VivenciasState();
}

class _VivenciasState extends State<Vivencias> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        controller: controller,
        slivers: const [
          HeaderVivencias(),
        ],
      )),
    );
  }
}

class HeaderVivencias extends StatefulWidget {
  const HeaderVivencias({Key? key}) : super(key: key);

  @override
  State<HeaderVivencias> createState() => _HeaderVivenciasState();
}

class _HeaderVivenciasState extends State<HeaderVivencias> {
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
                      (provider.activateS.value == 1) ? 'Experiences' : 'Vivencias',
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
