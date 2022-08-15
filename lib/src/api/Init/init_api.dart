import 'dart:convert';

import 'package:marca_loreto/src/dataBase/Init/archive_database.dart';
import 'package:marca_loreto/src/dataBase/Init/banner_database.dart';
import 'package:marca_loreto/src/dataBase/Init/blog_database.dart';
import 'package:marca_loreto/src/dataBase/Init/gallery_database.dart';
import 'package:marca_loreto/src/dataBase/Init/section_database.dart';
import 'package:marca_loreto/src/model/Init/archive_model.dart';
import 'package:marca_loreto/src/model/Init/banner_model.dart';
import 'package:marca_loreto/src/model/Init/blog_model.dart';
import 'package:marca_loreto/src/model/Init/gallery_model.dart';
import 'package:marca_loreto/src/model/Init/section_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class InitApi {
  final bannerDB = BannerDatabase();
  final sectionDB = SectionDatabase();
  final archiveDB = ArchiveDatabase();
  final blogDB = BlogDatabase();
  final galleryDB = GalleryDatabase();
  Future<bool> getInit() async {
    try {
      final url = Uri.parse('$apiBaseURL/api/App/ws_listar_home');
      final resp = await http.post(
        url,
        body: {},
      );
      final decodedData = json.decode(resp.body);

      //Almacenar Datos de Banner
      for (var i = 0; i < decodedData["banner"].length; i++) {
        var data = decodedData["banner"][i];

        BannerModel bannerModel = BannerModel();
        bannerModel.idBanner = data["id_sec_banner"];
        bannerModel.nroBanner = data["sec_banner_nro"];
        bannerModel.titleBanner = data["sec_banner_titulo"];
        bannerModel.titleBannerEn = data["sec_banner_titulo_en"];
        bannerModel.subtitleBanner = data["sec_banner_subtitulo"];
        bannerModel.subtitleBannerEn = data["sec_banner_subtitulo_en"];
        bannerModel.imageBanner = data["sec_banner_imagen"];
        bannerModel.updateData = data["sec_banner_ult_modificacion"];

        final language =
            await bannerDB.getBannerById(bannerModel.idBanner.toString());
        if (language.isNotEmpty) {
          bannerModel.activateEnglish = language[0].activateEnglish;
        } else {
          bannerModel.activateEnglish = '0';
        }

        await bannerDB.insertBanner(bannerModel);
      }

      //Almacenar Datos de Seccion
      var data = decodedData["seccion2"];

      SectionModel sectionModel = SectionModel();
      sectionModel.idSection = data["id_sec_home_join"];
      sectionModel.titleSection = data["sec_home_join_titulo"];
      sectionModel.titleSectionEn = data["sec_home_join_titulo_en"];
      sectionModel.subtitle1Section = data["sec_home_join_subtitulo1"];
      sectionModel.subtitle1SectionEn = data["sec_home_join_subtitulo1_en"];
      sectionModel.subtitle2Section = data["sec_home_join_subtitulo2"];
      sectionModel.subtitle2SectionEn = data["sec_home_join_subtitulo2_en"];
      sectionModel.imageSection = data["sec_home_join_imagen"];
      sectionModel.updateData = data["sec_home_join_ult_modificacion"];

      final language =
          await sectionDB.getSectionById(sectionModel.idSection.toString());
      if (language.isNotEmpty) {
        sectionModel.activateEnglish = language[0].activateEnglish;
      } else {
        sectionModel.activateEnglish = '0';
      }

      await sectionDB.insertSection(sectionModel);

      //Almacenar Archivos
      for (var i = 0; i < decodedData["archivos"].length; i++) {
        var data = decodedData["archivos"][i];
        ArchiveModel archivoModel = ArchiveModel();
        archivoModel.idArchive = data["id_archivo"];
        archivoModel.nameArchive = data["archivo_nombre"];
        archivoModel.nameArchiveEn = data["archivo_nombre_en"];
        archivoModel.linkArchive = data["archivo_link"];
        archivoModel.estateArchive = data["archivo_estado"];

        final language =
            await archiveDB.getArchiveById(archivoModel.idArchive.toString());
        if (language.isNotEmpty) {
          archivoModel.activateEnglish = language[0].activateEnglish;
        } else {
          archivoModel.activateEnglish = '0';
        }

        await archiveDB.insertArchive(archivoModel);
      }

      //Almacenar Datos de Blog
      for (var i = 0; i < decodedData["blogs"].length; i++) {
        var data = decodedData["blogs"][i];

        BlogModel blogModel = BlogModel();
        blogModel.idBlog = data["id_blog"];
        blogModel.idUses = data["id_usuario"];
        blogModel.shortCodeBlog = data["blog_shortcode"];
        blogModel.titleBlog = data["blog_titulo"];
        blogModel.titleBlogEn = data["blog_titulo_en"];
        blogModel.subtitleBlog = data["blog_subtitulo"];
        blogModel.subtitleBlogEn = data["blog_subtitulo_en"];
        blogModel.descriptionBlog = data["blog_descripcion"];
        blogModel.descriptionBlogEn = data["blog_descripcion_en"];
        blogModel.imageBlog = data["blog_imagen"];
        blogModel.sourceBlog = data["blog_fuente"];
        blogModel.colorBlog = data["blog_color"];
        blogModel.dateTimeBlog = data["blog_datetime"];
        blogModel.vistasBlog = data["blog_vistas"];
        blogModel.stateBlog = data["blog_estado"];

        final language = await blogDB.getBlogById(blogModel.idBlog.toString());
        if (language.isNotEmpty) {
          blogModel.activateEnglish = language[0].activateEnglish;
        } else {
          blogModel.activateEnglish = '0';
        }

        await blogDB.insertBlog(blogModel);
      }

      //Almacenar Datos de Galeria
      for (var i = 0; i < decodedData["galeria"].length; i++) {
        var data = decodedData["galeria"][i];

        GalleryModel galeriaModel = GalleryModel();
        galeriaModel.idGallery = data["id_galeria"];
        galeriaModel.titleGallery = data["galeria_titulo"];
        galeriaModel.titleGalleryEn = data["galeria_titulo_en"];
        galeriaModel.imageGallery = data["galeria_imagen"];
        galeriaModel.linkGallery = data["galeria_link"];
        galeriaModel.estateGallery = data["galeria_estado"];

        final language =
            await galleryDB.getGalleryById(galeriaModel.idGallery.toString());
        if (language.isNotEmpty) {
          galeriaModel.activateEnglish = language[0].activateEnglish;
        } else {
          galeriaModel.activateEnglish = '0';
        }

        await galleryDB.insertGallery(galeriaModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
