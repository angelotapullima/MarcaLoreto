import 'package:marca_loreto/src/api/Init/init_api.dart';
import 'package:marca_loreto/src/dataBase/Init/archive_database.dart';
import 'package:marca_loreto/src/model/Init/archive_model.dart';
import 'package:marca_loreto/src/model/Init/banner_model.dart';
import 'package:marca_loreto/src/model/Init/blog_model.dart';
import 'package:marca_loreto/src/model/Init/gallery_model.dart';
import 'package:marca_loreto/src/model/Init/section_model.dart';
import 'package:rxdart/rxdart.dart';

class InitBloc {
  final _inicioApi = InitApi();
  final archiveDatabase = ArchiveDatabase();

  final _bannerController = BehaviorSubject<List<BannerModel>>();
  Stream<List<BannerModel>> get bannerStream => _bannerController.stream;

  final _sectionController = BehaviorSubject<List<SectionModel>>();
  Stream<List<SectionModel>> get sectionStream => _sectionController.stream;

  final _archiveController = BehaviorSubject<List<ArchiveModel>>();
  Stream<List<ArchiveModel>> get archiveStream => _archiveController.stream;

  final _blogController = BehaviorSubject<List<BlogModel>>();
  Stream<List<BlogModel>> get blogStream => _blogController.stream;

  final _blogByIdController = BehaviorSubject<List<BlogModel>>();
  Stream<List<BlogModel>> get blogIDStream => _blogByIdController.stream;

  final _galleryController = BehaviorSubject<List<GalleryModel>>();
  Stream<List<GalleryModel>> get galleryStream => _galleryController.stream;

  dispose() {
    _bannerController.close();
    _sectionController.close();
    _blogController.close();
    _galleryController.close();
    _blogByIdController.close();
    _archiveController.close();
  }

  void getInit() async {
    _bannerController.sink.add(await _inicioApi.bannerDB.getBanners());
    _sectionController.sink.add(await _inicioApi.sectionDB.getSections());
    _archiveController.sink.add(await archiveDatabase.getArchives());
    _blogController.sink.add(await _inicioApi.blogDB.getBlogs());
    _galleryController.sink.add(await _inicioApi.galleryDB.getGallery());
    await _inicioApi.getInit();
    _bannerController.sink.add(await _inicioApi.bannerDB.getBanners());
    _sectionController.sink.add(await _inicioApi.sectionDB.getSections());
    _archiveController.sink.add(await archiveDatabase.getArchives());
    _blogController.sink.add(await _inicioApi.blogDB.getBlogs());
    _galleryController.sink.add(await _inicioApi.galleryDB.getGallery());
  }

  void getBlogById(String idBlog, bool language, String value) async {
    if (language) {
      updateLanguage(value);
    }
    _blogByIdController.sink.add(await _inicioApi.blogDB.getBlogById(idBlog));
  }

  void updateLanguage(String value) async {
    await _inicioApi.bannerDB.updateLanguage(value);
    await _inicioApi.sectionDB.updateLanguage(value);
    await _inicioApi.blogDB.updateLanguage(value);
    await _inicioApi.galleryDB.updateLanguage(value);
    await archiveDatabase.updateLanguage(value);

    getInit();
  }
}
