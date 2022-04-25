import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class Licenciatarios extends StatefulWidget {
  const Licenciatarios({Key? key}) : super(key: key);

  @override
  State<Licenciatarios> createState() => _LicenciatariosState();
}

class _LicenciatariosState extends State<Licenciatarios> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        controller: controller,
        slivers: const [
          HeaderLicenciatarios(),
        ],
      )),
    );
  }
}

class HeaderLicenciatarios extends StatefulWidget {
  const HeaderLicenciatarios({Key? key}) : super(key: key);

  @override
  State<HeaderLicenciatarios> createState() => _HeaderLicenciatariosState();
}

class _HeaderLicenciatariosState extends State<HeaderLicenciatarios> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: ScreenUtil().setHeight(55),
        maxHeight: ScreenUtil().setHeight(55),
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
                      (provider.activateS.value == 1) ? 'Licensees' : 'Licenciatarios',
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
