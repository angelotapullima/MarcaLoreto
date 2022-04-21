import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/banners.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/blogs.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/galeria.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/secciones.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            const HeaderMarcaLoreto(),
            const SliverFillRemaining(
              hasScrollBody: true,
              child: Banners(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Secciones(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Blogs(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: GaleriaTitulo(),
            ),
            const GaleriaImages(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                height: ScreenUtil().setHeight(100),
                color: Colors.white,
              ),
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
                    return PopupMenuButton(
                        onSelected: (value) {
                          _controller.changeActivate(value.toString());
                          inicioBloc.updateLanguage(value.toString());
                        },
                        icon: SizedBox(
                          height: ScreenUtil().setHeight(48),
                          width: ScreenUtil().setWidth(48),
                          child: SvgPicture.asset(
                            'assets/svg/icons/Idioma.svg',
                            color: (_controller.activate == '1') ? const Color(0xFF008d36) : Colors.black,
                          ),
                        ),
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(
                                      (_controller.activate == '0') ? Icons.circle : Icons.circle_outlined,
                                      color: (_controller.activate == '0') ? const Color(0XFFF9B233) : Colors.grey,
                                      size: ScreenUtil().setHeight(18),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(8),
                                    ),
                                    const Text("Español"),
                                  ],
                                ),
                                value: '0',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(
                                      (_controller.activate == '1') ? Icons.circle : Icons.circle_outlined,
                                      color: (_controller.activate == '1') ? const Color(0XFFF9B233) : Colors.grey,
                                      size: ScreenUtil().setHeight(18),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(8),
                                    ),
                                    const Text("English"),
                                  ],
                                ),
                                value: '1',
                              ),
                            ]);
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
