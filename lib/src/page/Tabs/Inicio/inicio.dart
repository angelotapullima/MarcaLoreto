import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/banners.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/blogs.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/galeria.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/secciones.dart';
import 'package:marca_loreto/src/page/change_language.dart';
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
  @override
  Widget build(BuildContext context) {
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
              const ChangeLanguage(),
              const Text('Holi'),
            ],
          ),
        ),
      ),
    );
  }
}
