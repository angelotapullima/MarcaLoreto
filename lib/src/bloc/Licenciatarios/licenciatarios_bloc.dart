import 'package:marca_loreto/src/api/Categorias/categorias_api.dart';
import 'package:marca_loreto/src/model/Licenciatarios/categorias_negocio_model.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:rxdart/rxdart.dart';

class LicenciatariosBloc {
  final _api = CategoriaApi();

  final _categoriasNegocioController = BehaviorSubject<List<CategoriasNegocioModel>>();
  Stream<List<CategoriasNegocioModel>> get categoriasNegocioStream => _categoriasNegocioController.stream;

  final _negociosController = BehaviorSubject<List<NegocioModel>>();
  Stream<List<NegocioModel>> get negociosStream => _negociosController.stream;

  final _negocioController = BehaviorSubject<List<NegocioModel>>();
  Stream<List<NegocioModel>> get negocioStream => _negocioController.stream;

  dispose() {
    _categoriasNegocioController.close();
    _negociosController.close();
    _negocioController.close();
  }

  void getCategoriesNegocios() async {
    _categoriasNegocioController.sink.add(await _api.cateryNegociosDB.getCategoriasNegocio());
    await _api.listarInicio();
    _categoriasNegocioController.sink.add(await _api.cateryNegociosDB.getCategoriasNegocio());
  }

  void getNegociosByIdCategory(String idCategoriaNeg) async {
    _negociosController.sink.add([]);
    await Future.delayed(const Duration(milliseconds: 5));
    _negociosController.sink.add(await listarNegocios(idCategoriaNeg));
    await _api.listarInicio();
    _negociosController.sink.add(await listarNegocios(idCategoriaNeg));
  }

  void getNegocio(String idNegocio) async {
    _negocioController.sink.add(await _api.negocioDB.getNegocioByIdNegocio(idNegocio));
    await _api.listarInicio();
    _negocioController.sink.add(await _api.negocioDB.getNegocioByIdNegocio(idNegocio));
  }

  Future<List<NegocioModel>> listarNegocios(String idCategoriaNeg) async {
    final List<NegocioModel> result = [];

    final _listaNegocios = await _api.negocioDB.getNegocioByIdCategoria(idCategoriaNeg);

    for (var i = 0; i < _listaNegocios.length; i++) {
      NegocioModel negocio = NegocioModel();

      negocio.idNegocio = _listaNegocios[i].idNegocio;
      negocio.idCategoriaNeg = _listaNegocios[i].idCategoriaNeg;
      negocio.nombreNegocio = _listaNegocios[i].nombreNegocio;
      negocio.imageNegocio = _listaNegocios[i].imageNegocio;
      negocio.detalleNegocio = _listaNegocios[i].detalleNegocio;
      negocio.detailNegocioEn = _listaNegocios[i].detailNegocioEn;
      negocio.urlNegocio = _listaNegocios[i].urlNegocio;
      negocio.facebookNegocio = _listaNegocios[i].facebookNegocio;
      negocio.catalogoNegocio = _listaNegocios[i].catalogoNegocio;
      negocio.dateTimeNegocio = _listaNegocios[i].dateTimeNegocio;
      negocio.estadoNegocio = _listaNegocios[i].estadoNegocio;
      negocio.activarEnglish = _listaNegocios[i].activarEnglish;

      final _categoria = await _api.cateryNegociosDB.getCategoriaNegocioById(idCategoriaNeg);

      if (_categoria.isNotEmpty) {
        negocio.nombreCategoria = _categoria[0].nombreCategoriaNeg;
        negocio.nameCategoriaEn = _categoria[0].nameCategoriaNegEn;
      } else {
        negocio.nombreCategoria = '';
      }

      negocio.idNegocio = _listaNegocios[i].idNegocio;

      result.add(negocio);
    }

    return result;
  }

  void updateLanguage(String value) async {
    await _api.cateryNegociosDB.updateLanguage(value);
    await _api.negocioDB.updateLanguage(value);

    getCategoriesNegocios();
  }
}
