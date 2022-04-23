import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final inicioBloc = ProviderBloc.inicio(context);
    return ValueListenableBuilder(
      valueListenable: provider.activate,
      builder: (BuildContext context, int data, Widget? child) {
        return PopupMenuButton(
            onSelected: (int value) {
              provider.setActivate(value);
              inicioBloc.updateLanguage(value.toString());
            },
            icon: SizedBox(
              height: ScreenUtil().setHeight(48),
              width: ScreenUtil().setWidth(48),
              child: SvgPicture.asset(
                'assets/svg/icons/Idioma.svg',
                color: (provider.activateS.value == 1) ? const Color(0xFF008d36) : Colors.grey,
              ),
            ),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          (provider.activateS.value == 0) ? Icons.circle : Icons.circle_outlined,
                          color: (provider.activateS.value == 0) ? const Color(0XFFF9B233) : Colors.grey,
                          size: ScreenUtil().setHeight(18),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(8),
                        ),
                        const Text("Español"),
                      ],
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          (provider.activateS.value == 1) ? Icons.circle : Icons.circle_outlined,
                          color: (provider.activateS.value == 1) ? const Color(0XFFF9B233) : Colors.grey,
                          size: ScreenUtil().setHeight(18),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(8),
                        ),
                        const Text("English"),
                      ],
                    ),
                    value: 1,
                  ),
                ]);
      },
    );
  }
}

class ControllerLanguage extends ChangeNotifier {
  ValueNotifier<int> activate = ValueNotifier(0);
  ValueNotifier<int> get activateS => activate;

  void setActivate(int value) => activate.value = value;
}
