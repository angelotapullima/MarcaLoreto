import 'package:rxdart/rxdart.dart';

class MarkerMapaNegociosBloc {
  final _markerIdController = BehaviorSubject<NegociosEnMapa>();

  Stream<NegociosEnMapa> get markerIdStream => _markerIdController.stream;

  Function(NegociosEnMapa) get changemarkerId => _markerIdController.sink.add;

  // Obtener el último valor ingresado a los streams
  NegociosEnMapa? get page => _markerIdController.value;

  dispose() {
    _markerIdController.close();
  }
}

class NegociosEnMapa {
  String? posicion;
  String? idEmpresa;

  NegociosEnMapa({this.posicion, this.idEmpresa});
}
