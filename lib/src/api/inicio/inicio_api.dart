import 'dart:convert';

import 'package:marca_loreto/src/dataBase/Inicio/banner_database.dart';
import 'package:marca_loreto/src/dataBase/Inicio/blog_database.dart';
import 'package:marca_loreto/src/dataBase/Inicio/seccion_database.dart';
import 'package:marca_loreto/src/model/inicio/banner_model.dart';
import 'package:marca_loreto/src/model/inicio/blog_model.dart';
import 'package:marca_loreto/src/model/inicio/seccion_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class InicioApi {
  final bannerDB = BannerDatabase();
  final seccionDB = SeccionDatabase();
  final blogDB = BlogDatabase();
  Future<bool> listarInicio() async {
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
        bannerModel.tituloBanner = data["sec_banner_titulo"];
        bannerModel.titleBannerEn = data["sec_banner_titulo_en"];
        bannerModel.subtituloBanner = data["sec_banner_subtitulo"];
        bannerModel.subtitleBannerEn = data["sec_banner_subtitulo_en"];
        bannerModel.imageBanner = data["sec_banner_imagen"];
        bannerModel.updateData = data["sec_banner_ult_modificacion"];

        final language = await bannerDB.getBannerById(bannerModel.idBanner.toString());
        if (language.isNotEmpty) {
          bannerModel.activarEnglish = language[0].activarEnglish;
        } else {
          bannerModel.activarEnglish = '0';
        }

        await bannerDB.insertBanner(bannerModel);
      }

      //Almacenar Datos de Seccion
      for (var i = 0; i < decodedData["seccion2"].length; i++) {
        var data = decodedData["seccion2"][i];

        SeccionModel seccionModel = SeccionModel();
        seccionModel.idSeccion = data["id_sec_home_join"];
        seccionModel.tituloSeccion = data["sec_home_join_titulo"];
        seccionModel.titleSeccionEn = data["sec_home_join_titulo_en"];
        seccionModel.subtitulo1Seccion = data["sec_home_join_subtitulo1"];
        seccionModel.subtitle1SeccionEn = data["sec_home_join_subtitulo1_en"];
        seccionModel.subtitulo2Seccion = data["sec_home_join_subtitulo2"];
        seccionModel.subtitle2SeccionEn = data["sec_home_join_subtitulo2_en"];
        seccionModel.imageSeccion = data["sec_home_join_imagen"];
        seccionModel.updateData = data["sec_home_join_ult_modificacion"];

        final language = await seccionDB.getSeccionById(seccionModel.idSeccion.toString());
        if (language.isNotEmpty) {
          seccionModel.activarEnglish = language[0].activarEnglish;
        } else {
          seccionModel.activarEnglish = '0';
        }

        await seccionDB.insertSeccion(seccionModel);
      }

      //Almacenar Datos de Blog
      for (var i = 0; i < decodedData["blogs"].length; i++) {
        var data = decodedData["blogs"][i];

        BlogModel blogModel = BlogModel();
        blogModel.idBlog = data["id_blog"];
        blogModel.idUsuario = data["id_usuario"];
        blogModel.shortCodeBlog = data["blog_shortcode"];
        blogModel.tituloBlog = data["blog_titulo"];
        blogModel.titleBlogEn = data["blog_titulo_en"];
        blogModel.subtituloBlog = data["blog_subtitulo"];
        blogModel.subtitleBlogEn = data["blog_subtitulo_en"];
        blogModel.descripcionBlog = data["blog_descripcion"];
        blogModel.descriptionBlogEn = data["blog_descripcion_en"];
        blogModel.imageBlog = data["blog_imagen"];
        blogModel.fuenteBlog = data["blog_fuente"];
        blogModel.colorBlog = data["blog_color"];
        blogModel.dateTimeBlog = data["blog_datetime"];
        blogModel.vistasBlog = data["blog_vistas"];
        blogModel.estadoBlog = data["blog_estado"];

        final language = await seccionDB.getSeccionById(blogModel.idBlog.toString());
        if (language.isNotEmpty) {
          blogModel.activarEnglish = language[0].activarEnglish;
        } else {
          blogModel.activarEnglish = '0';
        }

        await blogDB.insertBlog(blogModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
