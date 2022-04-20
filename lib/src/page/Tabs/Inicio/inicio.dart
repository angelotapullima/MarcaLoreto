import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/banners.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            const HeaderMarcaLoreto(),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(children: const [
                Banners(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderMarcaLoreto extends StatefulWidget {
  const HeaderMarcaLoreto({Key? key}) : super(key: key);

  @override
  State<HeaderMarcaLoreto> createState() => _HeaderMarcaLoretoState();
}

class _HeaderMarcaLoretoState extends State<HeaderMarcaLoreto> {
  final _controller = ControllerLanguage();
  @override
  Widget build(BuildContext context) {
    final inicioBloc = ProviderBloc.inicio(context);
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: ScreenUtil().setHeight(48),
        maxHeight: ScreenUtil().setHeight(48),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(48),
                child: Image.asset('assets/img/logos/logo.png'),
              ),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (_, t) {
                    return InkWell(
                      onTap: () {
                        if (_controller.activate == '1') {
                          _controller.changeActivate('0');
                          inicioBloc.updateLanguage('0');
                        } else {
                          _controller.changeActivate('1');
                          inicioBloc.updateLanguage('1');
                        }
                      },
                      child: SizedBox(
                        height: ScreenUtil().setHeight(48),
                        width: ScreenUtil().setWidth(48),
                        child: SvgPicture.asset(
                          'assets/svg/icons/Idioma.svg',
                          color: (_controller.activate == '1') ? const Color(0xFF008d36) : Colors.black,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ControllerLanguage extends ChangeNotifier {
  String activate = '0';

  void changeActivate(String value) {
    activate = value;
    notifyListeners();
  }
}
