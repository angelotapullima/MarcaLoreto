import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/Tabs/Licensees/business_category.dart';
import 'package:marca_loreto/src/page/Tabs/Licensees/business.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:provider/provider.dart';

class Licensees extends StatefulWidget {
  const Licensees({Key? key}) : super(key: key);

  @override
  State<Licensees> createState() => _LicenseesState();
}

class _LicenseesState extends State<Licensees> {
  ScrollController controller = ScrollController();
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
                    ? 'Licensees'
                    : 'Licenciatarios',
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
          const BusinessCategory(),
          const Expanded(child: BusinessPage()),
          SizedBox(height: ScreenUtil().setHeight(50)),
        ],
      ),
    );
  }
}
