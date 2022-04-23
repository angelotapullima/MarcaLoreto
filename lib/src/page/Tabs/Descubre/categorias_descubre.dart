import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';
import 'package:marca_loreto/src/page/Tabs/Descubre/detalle_descubre.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class CategoriaDescubreText extends StatelessWidget {
  const CategoriaDescubreText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasDesBloc = ProviderBloc.categorias(context);
    categoriasDesBloc.getCategoriesDescubre();
    return StreamBuilder(
      stream: categoriasDesBloc.categoriasDesStream,
      builder: (context, AsyncSnapshot<List<CategoriaModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(80),
                      vertical: ScreenUtil().setHeight(30),
                    ),
                    child: Text(
                      'Elige y dale tap a uno de los botones y descúbre.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container();
                },
                childCount: 1,
              ),
            );
          }
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              childCount: 1,
            ),
          );
        }
      },
    );
  }
}

class CategoriasDescubre extends StatelessWidget {
  const CategoriasDescubre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasDesBloc = ProviderBloc.categorias(context);
    return StreamBuilder(
      stream: categoriasDesBloc.categoriasDesStream,
      builder: (context, AsyncSnapshot<List<CategoriaModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(40),
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0, //Horizontal
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var category = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return DetalleDescubre(
                                categoria: category,
                              );
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(8),
                          vertical: ScreenUtil().setHeight(8),
                        ),
                        child: SizedBox(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => const CupertinoActivityIndicator(),
                                  errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                                  imageUrl: '$apiBaseURL/${category.imageCategoria}',
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20), color: Colors.blue[200 + index % 4 * 100]!.withOpacity(0.9)),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${category.nombreCategoria}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: snapshot.data!.length,
                ),
              ),
            );
          } else {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                height: ScreenUtil().setHeight(1),
                color: Colors.white,
              ),
            );
          }
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: ScreenUtil().setHeight(1),
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
