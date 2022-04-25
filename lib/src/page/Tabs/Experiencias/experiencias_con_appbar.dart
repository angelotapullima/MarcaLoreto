import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/Tabs/Experiencias/categorias_experiencias_new.dart';
import 'package:marca_loreto/src/page/Tabs/Experiencias/detalle_experiecia.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:provider/provider.dart';

class ExperienciasConAppBar extends StatefulWidget {
  const ExperienciasConAppBar({Key? key}) : super(key: key);

  @override
  State<ExperienciasConAppBar> createState() => _ExperienciasConAppBarState();
}

class _ExperienciasConAppBarState extends State<ExperienciasConAppBar> {
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
                (provider.activateS.value == 1) ? 'Experiences' : 'Experiencias',
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
          const CategoriasExperienciasNew(),
          const Expanded(child: DetalleExperiencia()),
          SizedBox(height: ScreenUtil().setHeight(50)),
        ],
      ),
    );
  }
}
