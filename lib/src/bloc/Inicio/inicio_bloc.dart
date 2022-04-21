import 'package:marca_loreto/src/api/inicio/inicio_api.dart';
import 'package:marca_loreto/src/model/inicio/banner_model.dart';
import 'package:marca_loreto/src/model/inicio/blog_model.dart';
import 'package:marca_loreto/src/model/inicio/galeria_model.dart';
import 'package:marca_loreto/src/model/inicio/seccion_model.dart';
import 'package:rxdart/rxdart.dart';

class InicioBloc {
  final _inicioApi = InicioApi();

  final _bannerController = BehaviorSubject<List<BannerModel>>();
  Stream<List<BannerModel>> get bannerStream => _bannerController.stream;

  final _seccionController = BehaviorSubject<List<SeccionModel>>();
  Stream<List<SeccionModel>> get seccionStream => _seccionController.stream;

  final _blogController = BehaviorSubject<List<BlogModel>>();
  Stream<List<BlogModel>> get blogStream => _blogController.stream;

  final _galeriaController = BehaviorSubject<List<GaleriaModel>>();
  Stream<List<GaleriaModel>> get galeriaStream => _galeriaController.stream;

  dispose() {
    _bannerController.close();
    _seccionController.close();
    _blogController.close();
    _galeriaController.close();
  }

  void getInicio() async {
    _bannerController.sink.add(await _inicioApi.bannerDB.getBanners());
    _seccionController.sink.add(await _inicioApi.seccionDB.getSeccions());
    _blogController.sink.add(await _inicioApi.blogDB.getBlogs());
    _galeriaController.sink.add(await _inicioApi.galeriaDB.getGaleria());
    await _inicioApi.listarInicio();
    _bannerController.sink.add(await _inicioApi.bannerDB.getBanners());
    _seccionController.sink.add(await _inicioApi.seccionDB.getSeccions());
    _blogController.sink.add(await _inicioApi.blogDB.getBlogs());
    _galeriaController.sink.add(await _inicioApi.galeriaDB.getGaleria());
  }

  void updateLanguage(String value) async {
    await _inicioApi.bannerDB.updateLanguage(value);
    await _inicioApi.seccionDB.updateLanguage(value);
    await _inicioApi.blogDB.updateLanguage(value);
    await _inicioApi.galeriaDB.updateLanguage(value);
    getInicio();
  }
}
