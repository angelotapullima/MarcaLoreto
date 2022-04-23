import 'dart:convert';

import 'package:marca_loreto/src/dataBase/Descubre/categoria_database.dart';
import 'package:marca_loreto/src/dataBase/Descubre/detalle_categoria_database.dart';
import 'package:http/http.dart' as http;
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';
import 'package:marca_loreto/src/model/Categoria/detalle_categoria_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class CategoriaApi {
  final categoryDesDB = CategoriaDatabase();
  final detailDesDB = DetalleCategoriaDatabase();
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
        categoriaModel.imageCategoria = data["app_descubre_cat_foto"];
        categoriaModel.estadoCategoria = data["app_descubre_cat_estado"];

        await categoryDesDB.insertCategoria(categoriaModel);
      }

      //Detalle Descubre
      for (var i = 0; i < decodedData["descubre"]["detalle"].length; i++) {
        var data = decodedData["descubre"]["detalle"][i];

        DetalleCategoriaModel detalleModel = DetalleCategoriaModel();
        detalleModel.idDetalleCategoria = data["id_app_descubre_det"];
        detalleModel.idCategoria = data["id_app_descubre_cat"];
        detalleModel.subtituloDetalleCategoria = data["app_descubre_det_subtitulo"];
        detalleModel.imageDetalleCategoria = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];

        await detailDesDB.insertDetalle(detalleModel);
      }

      //Categorias Experiencias
      for (var i = 0; i < decodedData["experiencias"]["categorias"].length; i++) {
        var data = decodedData["experiencias"]["categorias"][i];

        CategoriaModel categoriaModel = CategoriaModel();
        categoriaModel.idCategoria = data["id_app_descubre_cat"];
        categoriaModel.tipoCategoria = data["app_descubre_cat_tipo"];
        categoriaModel.nombreCategoria = data["app_descubre_cat_nombre"];
        categoriaModel.imageCategoria = data["app_descubre_cat_foto"];
        categoriaModel.estadoCategoria = data["app_descubre_cat_estado"];

        await categoryDesDB.insertCategoria(categoriaModel);
      }

      //Detalle Experiencias
      for (var i = 0; i < decodedData["experiencias"]["detalle"].length; i++) {
        var data = decodedData["experiencias"]["detalle"][i];

        DetalleCategoriaModel detalleModel = DetalleCategoriaModel();
        detalleModel.idDetalleCategoria = data["id_app_descubre_det"];
        detalleModel.idCategoria = data["id_app_descubre_cat"];
        detalleModel.subtituloDetalleCategoria = data["app_descubre_det_subtitulo"];
        detalleModel.imageDetalleCategoria = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];

        await detailDesDB.insertDetalle(detalleModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
