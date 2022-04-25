import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:provider/provider.dart';

class DetalleNegocio extends StatelessWidget {
  const DetalleNegocio({Key? key, required this.idNegocio}) : super(key: key);
  final String idNegocio;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final negocioBloc = ProviderBloc.negocio(context);
    negocioBloc.getNegocio(idNegocio);
    return StreamBuilder(
      stream: negocioBloc.negocioStream,
      builder: (context, AsyncSnapshot<List<NegocioModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            var detalle = snapshot.data![0];
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.grey),
                title: ValueListenableBuilder(
                    valueListenable: provider.activate,
                    builder: (BuildContext context, int data, Widget? child) {
                      return Text(
                        (provider.activateS.value == 1) ? 'Return' : 'Volver',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      );
                    }),
                actions: const [
                  ChangeLanguage(),
                ],
              ),
              floatingActionButton: (detalle.urlNegocio != null || detalle.facebookNegocio != null || detalle.catalogoNegocio != null)
                  ? SpeedDial(
                      animatedIcon: AnimatedIcons.list_view,
                      overlayColor: Colors.black,
                      overlayOpacity: 0.15,
                      children: [
                        (detalle.catalogoNegocio != null)
                            ? SpeedDialChild(
                                backgroundColor: Colors.deepOrangeAccent,
                                child: const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                                label: 'Descargar catálogo')
                            : SpeedDialChild(),
                        (detalle.urlNegocio != null)
                            ? SpeedDialChild(child: const Icon(Icons.web_outlined), label: 'Visitar página Web')
                            : SpeedDialChild(),
                        (detalle.facebookNegocio != null)
                            ? SpeedDialChild(
                                backgroundColor: Colors.blueGrey,
                                child: const Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                ),
                              )
                            : SpeedDialChild(),
                      ],
                    )
                  : Container(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(200),
                      width: double.infinity,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                        imageUrl: '$apiBaseURL/${detalle.imageNegocio}',
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
                    SizedBox(
                      height: ScreenUtil().setHeight(34),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        '${detalle.nombreNegocio}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        '${detalle.detalleNegocio}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.grey),
                title: ValueListenableBuilder(
                    valueListenable: provider.activate,
                    builder: (BuildContext context, int data, Widget? child) {
                      return Text(
                        (provider.activateS.value == 1) ? 'Return' : 'Volver',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      );
                    }),
                actions: const [
                  ChangeLanguage(),
                ],
              ),
              body: const Center(
                child: Text('Sin información disponible'),
              ),
            );
          }
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.grey),
              title: ValueListenableBuilder(
                  valueListenable: provider.activate,
                  builder: (BuildContext context, int data, Widget? child) {
                    return Text(
                      (provider.activateS.value == 1) ? 'Return' : 'Volver',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    );
                  }),
              actions: const [
                ChangeLanguage(),
              ],
            ),
            body: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
      },
    );
  }
}
