import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/categorias.dart';
import 'package:marca_loreto/src/models/principal_atraciones.dart';
import 'package:marca_loreto/src/page/categories/comentarios.dart';
import 'package:marca_loreto/src/page/categories/conoceme.dart';
import 'package:marca_loreto/src/page/categories/cuentos.dart';
import 'package:marca_loreto/src/page/categories/experiencias.dart';
import 'package:marca_loreto/src/page/categories/gastronomia.dart';
import 'package:marca_loreto/src/page/categories/paisajes.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/img/42.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(.2),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(5),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola, Angelo',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Bienvenido',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.blender,
                        size: 25,
                        color: Colors.white,
                      ),
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSPF5L5JfFrB2EQ2J2DC3DyZOQEFzLweFoxVC9J9xNkk81jw6ZKlWCJb_XgNnW6K1-b3A&usqp=CAU'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                SizedBox(
                  child: CarouselSlider.builder(
                    itemCount: principalesAtracciones.length,
                    itemBuilder: (context, x, y) {
                      return InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Stack(
                            children: [
                              Image.asset(
                                '${principalesAtracciones[x]['foto']}',
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: ScreenUtil().setHeight(200),
                        onPageChanged: (index, page) {},
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: const Duration(seconds: 6),
                        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                        viewportFraction: 1),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(120),
                  child: ListView.builder(
                    itemCount: categorias.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Widget widget = Container();
                          if ('${categorias[index]['id']}' == '1') {
                            widget = const ConocemePage();
                          } else if ('${categorias[index]['id']}' == '2') {
                            widget = const ExperienciasPage();
                          } else if ('${categorias[index]['id']}' == '3') {
                            widget = const GatronomiaPage();
                          } else if ('${categorias[index]['id']}' == '4') {
                            widget = PaisajesPage();
                          } else if ('${categorias[index]['id']}' == '5') {
                            widget = const ConocemePage();
                          } else if ('${categorias[index]['id']}' == '6') {
                            widget = CuentosPage();
                          } else if ('${categorias[index]['id']}' == '7') {
                            widget = const ComentariosPage();
                          }

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return widget;
                              },
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(0.0, 1.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end).chain(
                                  CurveTween(curve: curve),
                                );

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          width: ScreenUtil().setWidth(85),
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setSp(70),
                                height: ScreenUtil().setSp(70),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.ad_units,
                                  color: Colors.white,
                                  size: ScreenUtil().setSp(25),
                                ),
                              ),
                              Text(
                                '${categorias[index]['nombre']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.bold, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                  child: Text(
                    ' Principales atracciones',
                    style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(250),
                  child: ListView.builder(
                    itemCount: principalesAtracciones.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: ScreenUtil().setWidth(180),
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(6),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    width: ScreenUtil().setWidth(180),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(6),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: ScreenUtil().setHeight(190),
                                    width: ScreenUtil().setWidth(190),
                                    //padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5), vertical: ScreenUtil().setHeight(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        '${principalesAtracciones[index]['foto']}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${principalesAtracciones[index]['nombre']}',
                                    style: TextStyle(fontSize: ScreenUtil().setSp(17), fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
