import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Categoria/detalle_categoria_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class DetalleExperiencia extends StatelessWidget {
  const DetalleExperiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detalleExpBloc = ProviderBloc.categorias(context);
    return StreamBuilder(
        stream: detalleExpBloc.detalleExpStream,
        builder: (context, AsyncSnapshot<List<DetalleCategoriaModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) {
                    var detalle = snapshot.data![i];
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(16),
                                ),
                                Text(
                                  (detalle.activarEnglish == '1') ? '${detalle.subtitleDetalleCategoriaEn}' : '${detalle.subtituloDetalleCategoria}',
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                              child: Text(
                                (detalle.activarEnglish == '1') ? '${detalle.detailCategoriaDetalleEn}' : '${detalle.detalleCategoriaDetalle}',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            Container(
                              height: ScreenUtil().setHeight(200),
                              margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                              width: double.infinity,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                                imageUrl: '$apiBaseURL/${detalle.imageDetalleCategoria}',
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
                          ],
                        ));
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
        });
  }
}
