import 'package:marca_loreto/src/api/Category/category_api.dart';
import 'package:marca_loreto/src/model/Category/category_model.dart';
import 'package:marca_loreto/src/model/Category/detail_category_model.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final _tabsApi = CategoryApi();

  //Discover
  final _discoverCategoryController = BehaviorSubject<List<CategoryModel>>();
  Stream<List<CategoryModel>> get discoverCategoryStream =>
      _discoverCategoryController.stream;

  final _detailDiscoverController =
      BehaviorSubject<List<DetailCategoryModel>>();
  Stream<List<DetailCategoryModel>> get detailDiscoverStream =>
      _detailDiscoverController.stream;

  //Experiences

  final _experiencesCategoryController = BehaviorSubject<List<CategoryModel>>();
  Stream<List<CategoryModel>> get experiencesCategoryStream =>
      _experiencesCategoryController.stream;

  final _detailExperiencesController =
      BehaviorSubject<List<DetailCategoryModel>>();
  Stream<List<DetailCategoryModel>> get detailExperiencesStream =>
      _detailExperiencesController.stream;

  dispose() {
    _discoverCategoryController.close();
    _detailDiscoverController.close();
    _experiencesCategoryController.close();
    _detailExperiencesController.close();
  }

  void getDiscoverCategory() async {
    _discoverCategoryController.sink
        .add(await _tabsApi.categoryDesDB.getCategoryByType('1'));
    await _tabsApi.getInit();
    _discoverCategoryController.sink
        .add(await _tabsApi.categoryDesDB.getCategoryByType('1'));
  }

  void getDetailDiscover(String idDiscoverCategory) async {
    _detailDiscoverController.sink.add(
        await _tabsApi.detailDesDB.getDetailByIdCategory(idDiscoverCategory));
    await _tabsApi.getInit();
    _detailDiscoverController.sink.add(
        await _tabsApi.detailDesDB.getDetailByIdCategory(idDiscoverCategory));
  }

  void getExperiencesCategory() async {
    _experiencesCategoryController.sink
        .add(await _tabsApi.categoryDesDB.getCategoryByType('2'));
    await _tabsApi.getInit();
    _experiencesCategoryController.sink
        .add(await _tabsApi.categoryDesDB.getCategoryByType('2'));
  }

  void getDetailExperiences(String idCategoryExperience) async {
    _detailExperiencesController.sink.add([]);
    await Future.delayed(const Duration(milliseconds: 5));
    _detailExperiencesController.sink.add(
        await _tabsApi.detailDesDB.getDetailByIdCategory(idCategoryExperience));
    await _tabsApi.getInit();
    _detailExperiencesController.sink.add(
        await _tabsApi.detailDesDB.getDetailByIdCategory(idCategoryExperience));
  }

  void updateLanguage(String value) async {
    await _tabsApi.categoryDesDB.updateLanguage(value);
    await _tabsApi.detailDesDB.updateLanguage(value);

    getDiscoverCategory();
    getExperiencesCategory();
  }
}
