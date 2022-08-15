import 'package:marca_loreto/src/api/Category/category_api.dart';
import 'package:marca_loreto/src/model/Licensees/business_category_model.dart';
import 'package:marca_loreto/src/model/Licensees/business_model.dart';
import 'package:rxdart/rxdart.dart';

class LicenseesBloc {
  final _api = CategoryApi();

  final _businessCategoryController = BehaviorSubject<List<BusinessCategoryModel>>();
  Stream<List<BusinessCategoryModel>> get businessCategoryStream => _businessCategoryController.stream;

  final _businessController = BehaviorSubject<List<BusinessModel>>();
  Stream<List<BusinessModel>> get businessStream => _businessController.stream;

  final _businessOnlyController = BehaviorSubject<List<BusinessModel>>();
  Stream<List<BusinessModel>> get businessOnlyStream => _businessOnlyController.stream;

  dispose() {
    _businessCategoryController.close();
    _businessController.close();
    _businessOnlyController.close();
  }

  void getBusinessCategory() async {
    _businessCategoryController.sink.add(await _api.businessCategoryDB.getBusinessCategory());
    await _api.getInit();
    _businessCategoryController.sink.add(await _api.businessCategoryDB.getBusinessCategory());
  }

  void getBusinessByIdCategory(String idBusinessCategory) async {
    _businessController.sink.add([]);
    await Future.delayed(const Duration(milliseconds: 5));
    _businessController.sink.add(await getBusinessList(idBusinessCategory));
    await _api.getInit();
    _businessController.sink.add(await getBusinessList(idBusinessCategory));
  }

  void getBusiness(String idBusiness) async {
    _businessOnlyController.sink.add(await _api.businessDb.getBusinessByIdBusiness(idBusiness));
    await _api.getInit();
    _businessOnlyController.sink.add(await _api.businessDb.getBusinessByIdBusiness(idBusiness));
  }

  Future<List<BusinessModel>> getBusinessList(String idBusinessCategory) async {
    final List<BusinessModel> result = [];

    final _listBusiness = await _api.businessDb.getBusinessByIdCategory(idBusinessCategory);

    for (var i = 0; i < _listBusiness.length; i++) {
      BusinessModel business = BusinessModel();

      business.idBusiness = _listBusiness[i].idBusiness;
      business.idBusinessCategory = _listBusiness[i].idBusinessCategory;
      business.nameBusiness = _listBusiness[i].nameBusiness;
      business.imageBusiness = _listBusiness[i].imageBusiness;
      business.detailBusiness = _listBusiness[i].detailBusiness;
      business.detailBusinessEn = _listBusiness[i].detailBusinessEn;
      business.urlBusiness = _listBusiness[i].urlBusiness;
      business.facebookBusiness = _listBusiness[i].facebookBusiness;
      business.catalogueBusiness = _listBusiness[i].catalogueBusiness;
      business.dateTimeBusiness = _listBusiness[i].dateTimeBusiness;
      business.estadoNegocio = _listBusiness[i].estadoNegocio;
      business.activateEnglish = _listBusiness[i].activateEnglish;

      final _categoria = await _api.businessCategoryDB.getBusinessCategoryById(idBusinessCategory);

      if (_categoria.isNotEmpty) {
        business.nameCategory = _categoria[0].nameBusinessCategory;
        business.nameCategoryEn = _categoria[0].nameBusinessCategoryEn;
      } else {
        business.nameCategory = '';
      }

      business.idBusiness = _listBusiness[i].idBusiness;

      result.add(business);
    }

    return result;
  }

  void updateLanguage(String value) async {
    await _api.businessCategoryDB.updateLanguage(value);
    await _api.businessDb.updateLanguage(value);

    getBusinessCategory();
  }
}
