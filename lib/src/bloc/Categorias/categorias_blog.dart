import 'package:marca_loreto/src/api/Categorias/categorias_api.dart';
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';
import 'package:marca_loreto/src/model/Categoria/detalle_categoria_model.dart';
import 'package:rxdart/rxdart.dart';

class CategoriasBloc {
  final _tabsApi = CategoriaApi();

  //Descubre
  final _categoriasDescubreController = BehaviorSubject<List<CategoriaModel>>();
  Stream<List<CategoriaModel>> get categoriasDesStream => _categoriasDescubreController.stream;

  final _detalleDescubreController = BehaviorSubject<List<DetalleCategoriaModel>>();
  Stream<List<DetalleCategoriaModel>> get detalleDesStream => _detalleDescubreController.stream;

  //Experiencias

  final _categoriasExperienciasController = BehaviorSubject<List<CategoriaModel>>();
  Stream<List<CategoriaModel>> get categoriasExpStream => _categoriasExperienciasController.stream;

  final _detalleExperienciaController = BehaviorSubject<List<DetalleCategoriaModel>>();
  Stream<List<DetalleCategoriaModel>> get detalleExpStream => _detalleExperienciaController.stream;

  dispose() {
    _categoriasDescubreController.close();
    _detalleDescubreController.close();
    _categoriasExperienciasController.close();
    _detalleExperienciaController.close();
  }

  void getCategoriesDescubre() async {
    _categoriasDescubreController.sink.add(await _tabsApi.categoryDesDB.getCategoriaByTipo('1'));
    await _tabsApi.listarInicio();
    _categoriasDescubreController.sink.add(await _tabsApi.categoryDesDB.getCategoriaByTipo('1'));
  }

  void getDetalleDescubre(String idCategoriaDescubre) async {
    _detalleDescubreController.sink.add(await _tabsApi.detailDesDB.getDetalleByIdCategoria(idCategoriaDescubre));
    await _tabsApi.listarInicio();
    _detalleDescubreController.sink.add(await _tabsApi.detailDesDB.getDetalleByIdCategoria(idCategoriaDescubre));
  }

  void getCategoriesExpreriencias() async {
    _categoriasExperienciasController.sink.add(await _tabsApi.categoryDesDB.getCategoriaByTipo('2'));
    await _tabsApi.listarInicio();
    _categoriasExperienciasController.sink.add(await _tabsApi.categoryDesDB.getCategoriaByTipo('2'));
  }

  void getDetalleExperiencia(String idCategoriaExperiencia) async {
    _detalleExperienciaController.sink.add(await _tabsApi.detailDesDB.getDetalleByIdCategoria(idCategoriaExperiencia));
    await _tabsApi.listarInicio();
    _detalleExperienciaController.sink.add(await _tabsApi.detailDesDB.getDetalleByIdCategoria(idCategoriaExperiencia));
  }
}
