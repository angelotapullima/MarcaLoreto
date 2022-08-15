import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/dataBase/Business/document_database.dart';
import 'package:marca_loreto/src/model/Licensees/document_model.dart';
import 'package:marca_loreto/src/model/Licensees/business_model.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBusiness extends StatefulWidget {
  const DetailBusiness({Key? key, required this.idBusiness}) : super(key: key);
  final String idBusiness;
  @override
  State<DetailBusiness> createState() => _DetailBusinessState();
}

class _DetailBusinessState extends State<DetailBusiness> {
  late DownloaderUtils options;
  late DownloaderCore core;
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final provider2 = Provider.of<DocumentsBloc>(context, listen: false);
    final businessBloc = ProviderBloc.business(context);
    businessBloc.getBusiness(widget.idBusiness);
    return StreamBuilder(
      stream: businessBloc.businessOnlyStream,
      builder: (context, AsyncSnapshot<List<BusinessModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            var detail = snapshot.data![0];
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
                // actions: const [
                //   ChangeLanguage(),
                // ],
              ),
              floatingActionButton: (detail.urlBusiness != null ||
                      detail.facebookBusiness != null ||
                      detail.catalogueBusiness != null)
                  ? SpeedDial(
                      animatedIcon: AnimatedIcons.menu_arrow,
                      overlayColor: Colors.black,
                      overlayOpacity: 0.15,
                      children: [
                        (detail.catalogueBusiness != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  downloadCatalogue(detail, provider2);
                                },
                                backgroundColor: Colors.orangeAccent,
                                child: const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                                label: (detail.activateEnglish == '1')
                                    ? 'Download catalog'
                                    : 'Descargar catálogo')
                            : SpeedDialChild(),
                        (detail.urlBusiness != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  visit(detail.urlBusiness.toString());
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
                                label: (detail.activateEnglish == '1')
                                    ? 'Visit website'
                                    : 'Visitar página Web',
                              )
                            : SpeedDialChild(),
                        (detail.facebookBusiness != null)
                            ? SpeedDialChild(
                                onTap: () {
                                  visit(detail.facebookBusiness.toString());
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
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/img/logos/logo.png'),
                            imageUrl: '$apiBaseURL/${detail.imageBusiness}',
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
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(16)),
                          child: Text(
                            '${detail.nameBusiness}',
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
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(16)),
                          child: Text(
                            (detail.activateEnglish == '1')
                                ? '${detail.detailBusinessEn}'
                                : '${detail.detailBusiness}',
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
                      builder:
                          (BuildContext context, double data, Widget? child) {
                        return (data == 0.0)
                            ? Container()
                            : (data == 100.0)
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(16)),
                                    padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(20),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        (detail.activateEnglish == '1')
                                            ? 'Full download'
                                            : 'Descarga completa',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ))
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10)),
                                    child: SizedBox(
                                      height: ScreenUtil().setHeight(40),
                                      child: Column(
                                        children: [
                                          Text((detail.activateEnglish == '1')
                                              ? 'Downloading $data%'
                                              : 'Descargando $data%'),
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
              body: ValueListenableBuilder(
                valueListenable: provider.activate,
                builder: (BuildContext context, int data, Widget? child) {
                  return Center(
                    child: Text(
                      (provider.activateS.value == 1)
                          ? 'Oops sorry, no information'
                          : 'Sin información disponible',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
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

  downloadCatalogue(BusinessModel detail, DocumentsBloc provider2) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await [
        Permission.storage,
      ].request();
      var checkResult = await Permission.storage.status;

      if (checkResult.isGranted) {
        if (Platform.isIOS) {
          final documentDatabase = DocumentDatabase();

          final res = await documentDatabase
              .getDocumentForId(detail.idBusiness.toString());

          if (res[0].documentUrlIntern != 'null' &&
              res[0].documentUrlIntern!.isNotEmpty) {
            // ignore: unused_local_variable
            final _result =
                OpenFile.open(res[0].documentUrlIntern).whenComplete(() {});
          } else {
            final testdir = (await getApplicationDocumentsDirectory()).path;

            options = DownloaderUtils(
              progressCallback: (current, total) {
                provider2.cargando.value =
                    double.parse((current / total * 100).toStringAsFixed(2));
              },
              file: File('/$testdir/${detail.catalogueBusiness}'),
              progress: ProgressImplementation(),
              onDone: () async {
                DocumentModel documentModel = DocumentModel();
                documentModel.idDocument = detail.idBusiness;
                documentModel.stateDocument = detail.stateBusiness;
                documentModel.documentFile = detail.catalogueBusiness;
                documentModel.documentTitle = detail.nameBusiness;
                documentModel.documentUrlIntern =
                    '$testdir/${detail.catalogueBusiness}';

                await documentDatabase.insertDocument(documentModel);
                OpenFile.open('$testdir/${detail.catalogueBusiness}');

                provider2.changeFinish();
              },
              deleteOnCancel: true,
            );
            core = await Flowder.download(
                '$apiBaseURL/${detail.catalogueBusiness}', options);
          }
        } else {
          final documentDatabase = DocumentDatabase();

          final res = await documentDatabase
              .getDocumentForId(detail.idBusiness.toString());

          if (res[0].documentUrlIntern != 'null' &&
              res[0].documentUrlIntern!.isNotEmpty) {
            OpenFile.open(res[0].documentUrlIntern);
          } else {
            final testdir = (await getApplicationDocumentsDirectory()).path;

            options = DownloaderUtils(
              progressCallback: (current, total) {
                provider2.cargando.value =
                    double.parse((current / total * 100).toStringAsFixed(2));
              },
              file: File('/$testdir/${detail.catalogueBusiness}'),
              progress: ProgressImplementation(),
              onDone: () async {
                DocumentModel documentModel = DocumentModel();
                documentModel.idDocument = detail.idBusiness;
                documentModel.stateDocument = detail.stateBusiness;
                documentModel.documentFile = detail.catalogueBusiness;
                documentModel.documentTitle = detail.nameBusiness;
                documentModel.documentUrlIntern =
                    '$testdir/${detail.catalogueBusiness}';

                await documentDatabase.insertDocument(documentModel);
                OpenFile.open('$testdir/${detail.catalogueBusiness}');

                provider2.changeFinish();
              },
              deleteOnCancel: true,
            );

            core = await Flowder.download(
                '$apiBaseURL/${detail.catalogueBusiness}', options);
          }
        }
      } else if (await Permission.storage.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.storage.request().isDenied) {
        Map<Permission, PermissionStatus> statuses = await [
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
