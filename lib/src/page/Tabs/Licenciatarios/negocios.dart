import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:marca_loreto/src/page/Tabs/Licenciatarios/detalle_negocio.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class Negocios extends StatelessWidget {
  const Negocios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final negociosBloc = ProviderBloc.negocio(context);
    return StreamBuilder(
      stream: negociosBloc.negociosStream,
      builder: (context, AsyncSnapshot<List<NegocioModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: ScreenUtil().setWidth(10),
                ),
                itemBuilder: (context, index) {
                  var negocio = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return DetalleNegocio(
                              idNegocio: negocio.idNegocio.toString(),
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
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(8),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(132),
                            width: double.infinity,
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                              imageUrl: '$apiBaseURL/${negocio.imageNegocio}',
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                            child: Text(
                              (negocio.activarEnglish == '1') ? '${negocio.nameCategoriaEn}' : '${negocio.nombreCategoria}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                            child: Text(
                              '${negocio.nombreNegocio}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Image.asset('assets/img/logos/logo.png'),
            );
          }
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
