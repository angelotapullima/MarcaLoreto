import 'dart:convert';

import 'package:marca_loreto/src/dataBase/Descubre/categoria_descubre_database.dart';
import 'package:marca_loreto/src/dataBase/Descubre/detalle_descubre_database.dart';
import 'package:http/http.dart' as http;
import 'package:marca_loreto/src/model/descubre/catergoria_descubre_model.dart';
import 'package:marca_loreto/src/model/descubre/detalle_descubre_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class DescubreApi {
  Future<bool> listarInicio() async {
    final categoryDesDB = CategoriaDescubreDatabase();
    final detailDesDB = DetalleDescubreDatabase();
    try {
      final url = Uri.parse('$apiBaseURL/api/App/ws_listar_home');
      final resp = await http.post(
        url,
        body: {},
      );
      final decodedData = json.decode(resp.body);

      //Categorias Descubre
      for (var i = 0; i < decodedData["descubre"]["categorias"].length; i++) {
        var data = decodedData["descubre"]["categorias"][i];

        CategoriaDescubreModel categoriaModel = CategoriaDescubreModel();
        categoriaModel.idCategoriaDescubre = data["id_app_descubre_cat"];
        categoriaModel.tipoCategoriaDescubre = data["app_descubre_cat_tipo"];
        categoriaModel.nombreCategoriaDescubre = data["app_descubre_cat_nombre"];
        categoriaModel.imageCategoriaDescubre = data["app_descubre_cat_foto"];
        categoriaModel.estadoCategoriaDescubre = data["app_descubre_cat_estado"];

        await categoryDesDB.insertCategoria(categoriaModel);
      }

      //Detalle Descubre
      for (var i = 0; i < decodedData["descubre"]["detalle"].length; i++) {
        var data = decodedData["descubre"]["detalle"][i];

        DetalleDescubreModel detalleModel = DetalleDescubreModel();
        detalleModel.idDetalleDescubre = data["id_app_descubre_det"];
        detalleModel.idCategoriaDescubre = data["id_app_descubre_cat"];
        detalleModel.subtituloDetalleDescubre = data["app_descubre_det_subtitulo"];
        detalleModel.imageDetalleDescubre = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleDescubre = data["app_descubre_det_estado"];
        detalleModel.detallesDetalleDescubre = data["app_descubre_det_detalle"];

        await detailDesDB.insertDetalle(detalleModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
