import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marca_loreto/src/dataBase/Categorias/categoria_database.dart';
import 'package:marca_loreto/src/dataBase/Categorias/detalle_categoria_database.dart';
import 'package:marca_loreto/src/dataBase/Negocio/categorias_negocio_database.dart';
import 'package:marca_loreto/src/dataBase/Negocio/negocios_database.dart';
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';
import 'package:marca_loreto/src/model/Categoria/detalle_categoria_model.dart';
import 'package:marca_loreto/src/model/Licenciatarios/categorias_negocio_model.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class CategoriaApi {
  final categoryDesDB = CategoriaDatabase();
  final detailDesDB = DetalleCategoriaDatabase();
  final cateryNegociosDB = CategoriasNegocioDatabase();
  final negocioDB = NegociosDatabase();
  Future<bool> listarInicio() async {
    try {
      final url = Uri.parse('$apiBaseURL/api/App/ws_listar_tabs');
      final resp = await http.post(
        url,
        body: {},
      );
      final decodedData = json.decode(resp.body);

      //Categorias Descubre
      for (var i = 0; i < decodedData["descubre"]["categorias"].length; i++) {
        var data = decodedData["descubre"]["categorias"][i];

        CategoriaModel categoriaModel = CategoriaModel();
        categoriaModel.idCategoria = data["id_app_descubre_cat"];
        categoriaModel.tipoCategoria = data["app_descubre_cat_tipo"];
        categoriaModel.nombreCategoria = data["app_descubre_cat_nombre"];
        categoriaModel.nameCategoriaEn = data["app_descubre_cat_nombre_en"];
        categoriaModel.imageCategoria = data["app_descubre_cat_foto"];
        categoriaModel.estadoCategoria = data["app_descubre_cat_estado"];

        final categoryDB = await categoryDesDB.getCategoriaByIdCategoria(categoriaModel.idCategoria.toString());

        if (categoryDB.isNotEmpty) {
          categoriaModel.activarEnglish = categoryDB[0].activarEnglish;
        } else {
          categoriaModel.activarEnglish = '0';
        }

        await categoryDesDB.insertCategoria(categoriaModel);
      }

      //Detalle Descubre
      for (var i = 0; i < decodedData["descubre"]["detalle"].length; i++) {
        var data = decodedData["descubre"]["detalle"][i];

        DetalleCategoriaModel detalleModel = DetalleCategoriaModel();
        detalleModel.idDetalleCategoria = data["id_app_descubre_det"];
        detalleModel.idCategoria = data["id_app_descubre_cat"];
        detalleModel.subtituloDetalleCategoria = data["app_descubre_det_subtitulo"];
        detalleModel.subtitleDetalleCategoriaEn = data["app_descubre_det_subtitulo_en"];
        detalleModel.imageDetalleCategoria = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];
        detalleModel.detailCategoriaDetalleEn = data["app_descubre_det_detalle_en"];

        final detalleDB = await detailDesDB.getDetalleByIdDetalleCategoria(detalleModel.idDetalleCategoria.toString());

        if (detalleDB.isNotEmpty) {
          detalleModel.activarEnglish = detalleDB[0].activarEnglish;
        } else {
          detalleModel.activarEnglish = '0';
        }

        await detailDesDB.insertDetalle(detalleModel);
      }

      //Categorias Experiencias
      for (var i = 0; i < decodedData["experiencias"]["categorias"].length; i++) {
        var data = decodedData["experiencias"]["categorias"][i];

        CategoriaModel categoriaModel = CategoriaModel();
        categoriaModel.idCategoria = data["id_app_descubre_cat"];
        categoriaModel.tipoCategoria = data["app_descubre_cat_tipo"];
        categoriaModel.nombreCategoria = data["app_descubre_cat_nombre"];
        categoriaModel.nameCategoriaEn = data["app_descubre_cat_nombre_en"];
        categoriaModel.imageCategoria = data["app_descubre_cat_foto"];
        categoriaModel.estadoCategoria = data["app_descubre_cat_estado"];

        final categoryDB = await categoryDesDB.getCategoriaByIdCategoria(categoriaModel.idCategoria.toString());

        if (categoryDB.isNotEmpty) {
          categoriaModel.activarEnglish = categoryDB[0].activarEnglish;
        } else {
          categoriaModel.activarEnglish = '0';
        }

        await categoryDesDB.insertCategoria(categoriaModel);
      }

      //Detalle Experiencias
      for (var i = 0; i < decodedData["experiencias"]["detalle"].length; i++) {
        var data = decodedData["experiencias"]["detalle"][i];

        DetalleCategoriaModel detalleModel = DetalleCategoriaModel();
        detalleModel.idDetalleCategoria = data["id_app_descubre_det"];
        detalleModel.idCategoria = data["id_app_descubre_cat"];
        detalleModel.subtituloDetalleCategoria = data["app_descubre_det_subtitulo"];
        detalleModel.subtitleDetalleCategoriaEn = data["app_descubre_det_subtitulo_en"];
        detalleModel.imageDetalleCategoria = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];
        detalleModel.detailCategoriaDetalleEn = data["app_descubre_det_detalle_en"];

        final detalleDB = await detailDesDB.getDetalleByIdDetalleCategoria(detalleModel.idDetalleCategoria.toString());

        if (detalleDB.isNotEmpty) {
          detalleModel.activarEnglish = detalleDB[0].activarEnglish;
        } else {
          detalleModel.activarEnglish = '0';
        }

        await detailDesDB.insertDetalle(detalleModel);
      }

      //Categorias Negocios (Licenciatarios)
      for (var i = 0; i < decodedData["licenciatarios"]["categorias"].length; i++) {
        var data = decodedData["licenciatarios"]["categorias"][i];

        CategoriasNegocioModel categoriaModel = CategoriasNegocioModel();
        categoriaModel.idCategoriaNeg = data["id_app_negocio_cat"];
        categoriaModel.nombreCategoriaNeg = data["app_negocio_cat_nombre"];
        categoriaModel.nameCategoriaNegEn = data["app_negocio_cat_nombre_en"];
        categoriaModel.estadoCategoriaNeg = data["app_negocio_cat_estado"];

        final catNegDB = await cateryNegociosDB.getCategoriaNegocioByIdCategory(categoriaModel.idCategoriaNeg.toString());

        if (catNegDB.isNotEmpty) {
          categoriaModel.activarEnglish = catNegDB[0].activarEnglish;
        } else {
          categoriaModel.activarEnglish = '0';
        }

        await cateryNegociosDB.insertCategoriaNegocio(categoriaModel);
      }

      //Detalle Negocios (Licenciatarios)
      for (var i = 0; i < decodedData["licenciatarios"]["detalle"].length; i++) {
        var data = decodedData["licenciatarios"]["detalle"][i];

        NegocioModel negocioModel = NegocioModel();
        negocioModel.idNegocio = data["id_app_negocio_det"];
        negocioModel.idCategoriaNeg = data["id_app_negocio_cat"];
        negocioModel.nombreNegocio = data["app_negocio_det_nombre"];
        negocioModel.imageNegocio = data["app_negocio_det_foto"];
        negocioModel.detalleNegocio = data["app_negocio_det_detalle"];
        negocioModel.detailNegocioEn = data["app_negocio_det_detalle_en"];
        negocioModel.urlNegocio = data["app_negocio_det_web"];
        negocioModel.facebookNegocio = data["app_negocio_det_facebook"];
        negocioModel.catalogoNegocio = data["app_negocio_det_file"];
        negocioModel.dateTimeNegocio = data["app_negocio_det_datetime"];
        negocioModel.estadoNegocio = data["app_negocio_det_estado"];

        final negociosDB = await negocioDB.getNegocioByIdNegocio(negocioModel.idNegocio.toString());

        if (negociosDB.isNotEmpty) {
          negocioModel.activarEnglish = negociosDB[0].activarEnglish;
        } else {
          negocioModel.activarEnglish = '0';
        }

        await negocioDB.insertNegocio(negocioModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
