import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/inicio/galeria_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class GaleriaTitulo extends StatelessWidget {
  const GaleriaTitulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inicioBloc = ProviderBloc.inicio(context);
    inicioBloc.getInicio();
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: StreamBuilder(
        stream: inicioBloc.galeriaStream,
        builder: (context, AsyncSnapshot<List<GaleriaModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(16),
                      ),
                      Text(
                        (snapshot.data![0].activarEnglish == '1') ? 'Gallery' : 'Galeria',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(width: ScreenUtil().setWidth(150), child: SvgPicture.asset('assets/svg/icons/vector_title_inicio.svg')),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(32),
                  ),
                ],
              );
            } else {
              return Container();
            }
          } else {
            return Center(
              child: Container(),
            );
          }
        },
      ),
    );
  }
}

class GaleriaImages extends StatelessWidget {
  const GaleriaImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inicioBloc = ProviderBloc.inicio(context);
    return StreamBuilder(
      stream: inicioBloc.galeriaStream,
      builder: (context, AsyncSnapshot<List<GaleriaModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0, //Horizontal
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var galeria = snapshot.data![index];
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8), vertical: ScreenUtil().setHeight(8)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                            imageUrl: '$apiBaseURL/${galeria.imageGaleria}',
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
                        // const Positioned(
                        //     bottom: 2,
                        //     right: 2,
                        //     child: Icon(
                        //       Icons.facebook,
                        //       color: Colors.white,
                        //     )),
                        Image.asset('assets/img/logos/instagram.png'),
                      ],
                    ),
                  );
                },
                childCount: snapshot.data!.length,
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
