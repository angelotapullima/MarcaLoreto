import 'package:marca_loreto/src/api/Tabs/tabs_api.dart';
import 'package:marca_loreto/src/model/descubre/catergoria_descubre_model.dart';
import 'package:rxdart/rxdart.dart';

class TabsDescubreBloc {
  final _tabsApi = TabsApi();

  final _categoriasDescubreController = BehaviorSubject<List<CategoriaDescubreModel>>();

  Stream<List<CategoriaDescubreModel>> get categoriasDesStream => _categoriasDescubreController.stream;

  dispose() {
    _categoriasDescubreController.close();
  }

  void getCategoriesDescubre() async {
    _categoriasDescubreController.sink.add(await _tabsApi.categoryDesDB.getCatDescubre());
    await _tabsApi.listarInicio();
    _categoriasDescubreController.sink.add(await _tabsApi.categoryDesDB.getCatDescubre());
  }
}
