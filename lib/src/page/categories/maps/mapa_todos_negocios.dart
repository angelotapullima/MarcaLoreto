import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marca_loreto/src/bloc/marker_mapa_negocios_bloc.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/models/mapMode.dart';
import 'package:marca_loreto/src/page/categories/maps/mapa_utils.dart';
import 'package:marca_loreto/src/utils/responsive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final _pageController = PageController(viewportFraction: 0.9, initialPage: 0);

  late Map<String, Marker> markers = <String, Marker>{};

  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-3.74912, -73.25383),
    zoom: 15,
  );

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final name = p.join('${(await getApplicationSupportDirectory()).path}/$path');
    final file = File(name);

    var status = await Permission.manageExternalStorage.request();

    
    await file.writeAsBytes(byteData.                                                                                                                           buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  ///Users/angelo/Library/Developer/CoreSimulator/Devices/5F728985-EADB-4093-9082-E390C49688F1/data/Containers/Data/Application/9C4942F9-7003-472F-B8BA-1A944FDF6B8C/Library/Caches/assets/img/1.jpg

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final markerMapa = ProviderBloc.markerMapa(context);
      final responsive = Responsive.of(context);
      for (var i = 0; i < listMapas.length; i++) {
        var punto = LatLng(
          double.parse(listMapas[i].lat.toString()),
          double.parse(listMapas[i].lon.toString()),
        );
        /* BitmapDescriptor markerImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(ScreenUtil().setWidth(30), ScreenUtil().setWidth(30))),
          '${listMapas[i].foto}',
        ); */

        var jufjfjf = await getImageFileFromAssets('${listMapas[i].foto}');
        final BitmapDescriptor markerImage = await MapaUtils.getMarkerImageFromUrl2(
          jufjfjf,
          responsive.ip(10).toInt(),
        );

        final markerInicio = Marker(
          onTap: () {
            _pageController.animateToPage(int.parse('${listMapas[i].id}'), duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

            NegociosEnMapa ne = NegociosEnMapa();

            ne.posicion = '${listMapas[i].id}';
            ne.idEmpresa = '${listMapas[i].nombre}';

            markerMapa.changemarkerId(ne);
          },
          anchor: const Offset(0.0, 1.0),
          icon: markerImage,
          markerId: MarkerId('${listMapas[i].id}'),
          position: punto,
          infoWindow: InfoWindow(
            title: '${listMapas[i].nombre}',
            snippet: '${listMapas[i].nombre}',
          ),
        );

        markers['${listMapas[i].nombre}'] = markerInicio;
      }

      NegociosEnMapa ne = NegociosEnMapa();

      ne.posicion = '0';
      ne.idEmpresa = '0';
      markerMapa.changemarkerId(ne);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final markerMapa = ProviderBloc.markerMapa(context);
    final responsive = Responsive.of(context);

    return Stack(
      children: [
        GoogleMap(
          padding: EdgeInsets.only(bottom: responsive.hp(32)),
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          markers: markers.values.toSet(),
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(
          bottom: responsive.hp(2),
          left: 0,
          right: 0,
          child: SizedBox(
              height: responsive.ip(23),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: listMapas.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: responsive.wp(2),
                        right: responsive.wp(2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //width: responsive.wp(45),
                      child: Column(
                        children: [
                          SizedBox(
                            height: responsive.hp(15),
                            child: Hero(
                              tag: '${listMapas[index].id}',
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                      '${listMapas[index].foto}') /* CachedNetworkImage(
                                    placeholder: (context, url) => Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image(image: AssetImage('assets/img/loading.gif'), fit: BoxFit.cover),
                                    ),
                                    errorWidget: (context, url, error) => Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Center(
                                        child: Icon(Icons.error),
                                      ),
                                    ),
                                    imageUrl: '$apiBaseURL/${widget.negocios[index].foto}',
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ), */
                                  ),
                            ),
                          ),
                          Text(
                            '${listMapas[index].nombre}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: responsive.ip(2), fontWeight: FontWeight.bold),
                          ),
                          /*  Text(
                              '${widget.negocios[index].direccion}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: responsive.ip(1.8),
                              ),
                            ), */
                          /*  ('${widget.negocios[index].distancia}'.isNotEmpty)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: responsive.hp(.5),
                                          ),
                                          height: responsive.ip(4),
                                          width: responsive.ip(4),
                                          child: SvgPicture.asset('assets/torneo/map_torneo.svg')),
                                      SizedBox(
                                        width: responsive.wp(2),
                                      ),
                                      Text(
                                        'A ${widget.negocios[index].distancia} min de distancia',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(1.9),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(), */
                        ],
                      ),
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
