import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/page/Tabs/Init/gallery.dart';
import 'package:marca_loreto/src/page/Tabs/Init/sections.dart';
import 'package:marca_loreto/src/page/Tabs/init/banners.dart';
import 'package:marca_loreto/src/page/Tabs/init/blogs.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/page/policies.dart';
import 'package:marca_loreto/src/widget/sliver_header_delegate.dart';
import 'package:url_launcher/url_launcher.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
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
              child: Sections(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Blogs(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: GalleryTitle(),
            ),
            const GalleryImages(),
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
              InkWell(
                onTap: () {
                  policies(context);
                },
                child: SizedBox(
                  height: ScreenUtil().setHeight(48),
                  child: Image.asset('assets/img/logos/logoOff.png'),
                ),
              ),
              Row(
                children: [
                  const ChangeLanguage(),
                  InkWell(
                    child: Icon(
                      Icons.settings,
                      size: ScreenUtil().setHeight(16),
                      color: Colors.grey,
                    ),
                    onTap: () {
                      policies(context);
                    },
                  ),
                  SizedBox(width: ScreenUtil().setWidth(16)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void policies(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.35,
                minChildSize: 0.3,
                maxChildSize: 0.5,
                builder: (_, controller) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(24),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(16),
                            ),
                            Center(
                              child: Container(
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Text(
                              'Desarrollado por:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            SizedBox(
                              height: ScreenUtil().setHeight(50),
                              child: Image.asset('assets/img/logos/logo_bufeo.png'),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            TextButton.icon(
                                onPressed: () {
                                  visit('https://loretorioamazonas.pe/Inicio/terminos_y_condiciones');
                                },
                                icon: SvgPicture.asset('assets/svg/policies.svg'),
                                label: Text('Políticas de Privacidad')),
                            SizedBox(height: ScreenUtil().setHeight(5)),
                            Text(
                              'V.1',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future visit(String url) async {
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // }
    await launchUrl(Uri.parse(url));
  }
}
