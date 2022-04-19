import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/gastronomia.dart';
import 'package:marca_loreto/src/models/principal_atraciones.dart';
import 'package:marca_loreto/src/utils/translate_animation.dart';

class ConocemePage extends StatefulWidget {
  const ConocemePage({
    Key? key,
  }) : super(key: key);

  @override
  _ConocemePageState createState() => _ConocemePageState();
}

class _ConocemePageState extends State<ConocemePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 400);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverPersistentHeader(
              delegate: BuilderPersistentDelegate(
                maxHeight: MediaQuery.of(context).size.height,
                minHeight: 500,
                builder: (percent) {
                  return AnimatedDetailHeader(
                    topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
                    bottompercent: (percent / .3).clamp(0.0, 1.0),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  //controller: controller,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conoceme',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(22),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Text(
                              'Ullam re Fllum non Lorem pariatur in cillum reprehenderit. Dolore anim amet amet deserunt minim esse sunt occaecat aliquip ipsum. Velit aliquip exercitation fugiat exercitation occaecat pariatur elit ex ut. Magna pariatur anim occaecat eiusmod ad aute commodo cillum anim pariatur et magna velit nulla. Reprehenderit aute excepteur elit eiusmod excepteur aliquip labore eiusmod consectetur Lorem ea adipisicing nostrud non. Ullamco in exercitation aute esse minim consectetur quis non magna. Proident Lorem esse magna eu aute magna non. Ex ipsum eu nostrud nisi quis dolor ad nulla exercitation proident qui nisi cillum qui.',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(150),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: gatronomiaList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: ScreenUtil().setHeight(80),
                                  width: ScreenUtil().setWidth(100),
                                  child: Image.asset(
                                    '${gatronomiaList[index]['foto']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class AnimatedDetailHeader extends StatelessWidget {
  final double? topPercent;
  final double? bottompercent;
  const AnimatedDetailHeader({
    Key? key,
    required this.topPercent,
    required this.bottompercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final _puntosController = PuntosController();
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (topPadding) * (1 - bottompercent!),
              bottom: 100 * (1 - bottompercent!),
            ),
            child: Transform.scale(
              scale: lerpDouble(1, 1.3, bottompercent!)!,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: principalesAtracciones.length,
                            itemBuilder: (context, x, y) {
                              return InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    '${principalesAtracciones[x]['foto']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                height: ScreenUtil().setHeight(800),
                                onPageChanged: (index, page) {
                                  _puntosController.changeIndex(index);
                                },
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                // autoPlayInterval: Duration(seconds: 6),
                                // autoPlayAnimationDuration: Duration(milliseconds: 2000),
                                viewportFraction: .8),
                          ),

                          //
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      principalesAtracciones.length,
                      (index) => AnimatedBuilder(
                        animation: _puntosController,
                        builder: (_, s) {
                          return Container(
                            height: ScreenUtil().setHeight(10),
                            width: ScreenUtil().setWidth(10),
                            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_puntosController.index >= index - 0.5 && _puntosController.index < index + 0.5) ? Colors.green : Colors.red),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(
            child: Container(
              height: ScreenUtil().setHeight(50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(9),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(10),
                    width: ScreenUtil().setWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: topPadding + 10,
          left: 15 * (1 - bottompercent!),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: ScreenUtil().setHeight(26),
              width: ScreenUtil().setWidth(30),
              child: const BackButton(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.builder,
  });
  final double maxHeight;
  final double minHeight;
  final Widget Function(double percent) builder;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / maxHeight);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class PuntosController extends ChangeNotifier {
  int index = 0;
  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}

class ChangeEditController extends ChangeNotifier {
  bool cargando = false;
  String hora1 = '';
  String hora2 = '';
  String hora1D = '';
  String hora2D = '';
  String text = '';
  bool boton = true;
  late File image;

  void changeImage(File i) {
    image = i;
    boton = true;
    notifyListeners();
  }

  void changeBoton(bool b) {
    boton = b;
    notifyListeners();
  }

  void changeHora1(String h) {
    hora1 = h;
    notifyListeners();
  }

  void changeHora2(String p) {
    hora2 = p;
    notifyListeners();
  }

  void changeHora1D(String h) {
    hora1D = h;
    notifyListeners();
  }

  void changeHora2D(String p) {
    hora2D = p;
    notifyListeners();
  }

  void changeCargando(bool c) {
    cargando = c;
    notifyListeners();
  }

  void changeText(String t) {
    text = t;
    notifyListeners();
  }
}
