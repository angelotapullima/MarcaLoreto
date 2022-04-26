import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/dataBase/Negocio/document_database.dart';
import 'package:marca_loreto/src/model/Licenciatarios/document_model.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleNegocio extends StatefulWidget {
  const DetalleNegocio({Key? key, required this.idNegocio}) : super(key: key);
  final String idNegocio;
  @override
  State<DetalleNegocio> createState() => _DetalleNegocioState();
}

class _DetalleNegocioState extends State<DetalleNegocio> {
  late DownloaderUtils options;
  late DownloaderCore core;
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final provider2 = Provider.of<DocumentsBloc>(context, listen: false);
    final negocioBloc = ProviderBloc.negocio(context);
    negocioBloc.getNegocio(widget.idNegocio);
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
                      animatedIcon: AnimatedIcons.menu_arrow,
                      overlayColor: Colors.black,
                      overlayOpacity: 0.15,
                      children: [
                        (detalle.catalogoNegocio != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  descargarCatalogo(detalle, provider2);
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                                label: 'Descargar catálogo')
                            : SpeedDialChild(),
                        (detalle.urlNegocio != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  visit(detalle.urlNegocio.toString());
                                  // Navigator.push(
                                  //   context,
                                  //   PageRouteBuilder(
                                  //     pageBuilder: (context, animation, secondaryAnimation) {
                                  //       return WebNegocio(
                                  //         titulo: detalle.nombreNegocio.toString(),
                                  //         web: detalle.urlNegocio.toString(),
                                  //       );
                                  //     },
                                  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  //       var begin = const Offset(0.0, 1.0);
                                  //       var end = Offset.zero;
                                  //       var curve = Curves.ease;

                                  //       var tween = Tween(begin: begin, end: end).chain(
                                  //         CurveTween(curve: curve),
                                  //       );

                                  //       return SlideTransition(
                                  //         position: animation.drive(tween),
                                  //         child: child,
                                  //       );
                                  //     },
                                  //   ),
                                  // );
                                },
                                child: const Icon(Icons.web_outlined),
                                label: 'Visitar página Web',
                              )
                            : SpeedDialChild(),
                        (detalle.facebookNegocio != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  visit(detalle.facebookNegocio.toString());
                                },
                                backgroundColor: const Color(0XFF3b5998),
                                child: const Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                ),
                              )
                            : SpeedDialChild(),
                      ],
                    )
                  : Container(),
              body: Stack(
                children: [
                  SingleChildScrollView(
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
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: ValueListenableBuilder(
                      valueListenable: provider2.cargando,
                      builder: (BuildContext context, double data, Widget? child) {
                        return (data == 0.0)
                            ? Container()
                            : (data == 100.0)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                                    padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(20),
                                    ),
                                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'Descarga  completa',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                                : Padding(
                                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                                    child: SizedBox(
                                      height: ScreenUtil().setHeight(40),
                                      child: Column(
                                        children: [
                                          Text('Descargando $data%'),
                                          LinearPercentIndicator(
                                            width: ScreenUtil().setWidth(100),
                                            lineHeight: 14.0,
                                            percent: data / 100,
                                            backgroundColor: Colors.white,
                                            progressColor: Colors.blue,
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

  Future visit(String url) async {
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // }
    await launchUrl(Uri.parse(url));
  }

  descargarCatalogo(NegocioModel detalle, DocumentsBloc provider2) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await [
        Permission.location,
        Permission.storage,
      ].request();
      var checkResult = await Permission.storage.status;

      if (checkResult.isGranted) {
        if (Platform.isIOS) {
          final documentDatabase = DocumentDatabase();

          final res = await documentDatabase.getDocumentForId(detalle.idNegocio.toString());

          if (res[0].documentUrlInterno != 'null' && res[0].documentUrlInterno!.isNotEmpty) {
            // ignore: unused_local_variable
            final _result = OpenFile.open(res[0].documentUrlInterno).whenComplete(() {});
          } else {
            final testdir = (await getApplicationDocumentsDirectory()).path;

            options = DownloaderUtils(
              progressCallback: (current, total) {
                provider2.cargando.value = double.parse((current / total * 100).toStringAsFixed(2));
              },
              file: File('/$testdir/${detalle.catalogoNegocio}'),
              progress: ProgressImplementation(),
              onDone: () async {
                DocumentModel documentModel = DocumentModel();
                documentModel.idDocument = detalle.idNegocio;
                documentModel.documentEstado = detalle.estadoNegocio;
                documentModel.documentFile = detalle.catalogoNegocio;
                documentModel.documentTitulo = detalle.nombreNegocio;
                documentModel.documentUrlInterno = '$testdir/${detalle.catalogoNegocio}';

                await documentDatabase.insertDocument(documentModel);
                OpenFile.open('$testdir/${detalle.catalogoNegocio}');

                provider2.changeFinish();
              },
              deleteOnCancel: true,
            );
            core = await Flowder.download('$apiBaseURL/${detalle.catalogoNegocio}', options);
          }
        } else {
          final documentDatabase = DocumentDatabase();

          final res = await documentDatabase.getDocumentForId(detalle.idNegocio.toString());

          if (res[0].documentUrlInterno != 'null' && res[0].documentUrlInterno!.isNotEmpty) {
            OpenFile.open(res[0].documentUrlInterno);
          } else {
            final testdir = (await getApplicationDocumentsDirectory()).path;

            options = DownloaderUtils(
              progressCallback: (current, total) {
                provider2.cargando.value = double.parse((current / total * 100).toStringAsFixed(2));
              },
              file: File('/$testdir/${detalle.catalogoNegocio}'),
              progress: ProgressImplementation(),
              onDone: () async {
                DocumentModel documentModel = DocumentModel();
                documentModel.idDocument = detalle.idNegocio;
                documentModel.documentEstado = detalle.estadoNegocio;
                documentModel.documentFile = detalle.catalogoNegocio;
                documentModel.documentTitulo = detalle.nombreNegocio;
                documentModel.documentUrlInterno = '$testdir/${detalle.catalogoNegocio}';

                await documentDatabase.insertDocument(documentModel);
                OpenFile.open('$testdir/${detalle.catalogoNegocio}');

                provider2.changeFinish();
              },
              deleteOnCancel: true,
            );

            core = await Flowder.download('$apiBaseURL/${detalle.catalogoNegocio}', options);
          }
        }
      } else if (await Permission.storage.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.storage.request().isDenied) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.storage,
        ].request();
        // ignore: avoid_print
        print(statuses[Permission.location]);
      }
    } catch (e) {
      e;
    }
  }
}

class DocumentsBloc with ChangeNotifier {
  ValueNotifier<double> cargando = ValueNotifier(0.0);
  ValueNotifier<double> get cargandoS => cargando;

  BuildContext? context;

  DocumentsBloc({this.context}) {
    _init();
  }
  void _init() {}

  void changeInicio() {
    cargando.value = 0.0;
    notifyListeners();
  }

  void changeFinish() {
    cargando.value = 100.0;
    notifyListeners();
  }
}
