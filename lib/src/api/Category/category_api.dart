import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marca_loreto/src/dataBase/Category/category_database.dart';
import 'package:marca_loreto/src/dataBase/Category/detail_category_database.dart';
import 'package:marca_loreto/src/dataBase/Business/business_category_database.dart';
import 'package:marca_loreto/src/dataBase/Business/business_database.dart';
import 'package:marca_loreto/src/model/Category/category_model.dart';
import 'package:marca_loreto/src/model/Category/detail_category_model.dart';
import 'package:marca_loreto/src/model/Licensees/business_category_model.dart';
import 'package:marca_loreto/src/model/Licensees/business_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class CategoryApi {
  final categoryDesDB = CategoryDatabase();
  final detailDesDB = DetailCategoryDatabase();
  final businessCategoryDB = BusinessCategoryDatabase();
  final businessDb = BusinessDatabase();

  Future<bool> getInit() async {
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

        CategoryModel categoryModel = CategoryModel();
        categoryModel.idCategory = data["id_app_descubre_cat"];
        categoryModel.typeCategory = data["app_descubre_cat_tipo"];
        categoryModel.nameCategory = data["app_descubre_cat_nombre"];
        categoryModel.nameCategoryEn = data["app_descubre_cat_nombre_en"];
        categoryModel.imageCategory = data["app_descubre_cat_foto"];
        categoryModel.estateCategory = data["app_descubre_cat_estado"];

        final categoryDB = await categoryDesDB.getCategoryByIdCategory(categoryModel.idCategory.toString());

        if (categoryDB.isNotEmpty) {
          categoryModel.activateEnglish = categoryDB[0].activateEnglish;
        } else {
          categoryModel.activateEnglish = '0';
        }

        await categoryDesDB.insertCategory(categoryModel);
      }

      //Detalle Descubre
      for (var i = 0; i < decodedData["descubre"]["detalle"].length; i++) {
        var data = decodedData["descubre"]["detalle"][i];

        DetailCategoryModel detalleModel = DetailCategoryModel();
        detalleModel.idDetailCategory = data["id_app_descubre_det"];
        detalleModel.idCategory = data["id_app_descubre_cat"];
        detalleModel.subtitleDetailCategory = data["app_descubre_det_subtitulo"];
        detalleModel.subtitleDetailCategoryEn = data["app_descubre_det_subtitulo_en"];
        detalleModel.imageDetailCategory = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];
        detalleModel.detailCategoriaDetalleEn = data["app_descubre_det_detalle_en"];

        final detalleDB = await detailDesDB.getDetalleByIdDetalleCategoria(detalleModel.idDetailCategory.toString());

        if (detalleDB.isNotEmpty) {
          detalleModel.activateEnglish = detalleDB[0].activateEnglish;
        } else {
          detalleModel.activateEnglish = '0';
        }

        await detailDesDB.insertDetalle(detalleModel);
      }

      //Categorias Experiencias
      for (var i = 0; i < decodedData["experiencias"]["categorias"].length; i++) {
        var data = decodedData["experiencias"]["categorias"][i];

        CategoryModel categoriaModel = CategoryModel();
        categoriaModel.idCategory = data["id_app_descubre_cat"];
        categoriaModel.typeCategory = data["app_descubre_cat_tipo"];
        categoriaModel.nameCategory = data["app_descubre_cat_nombre"];
        categoriaModel.nameCategoryEn = data["app_descubre_cat_nombre_en"];
        categoriaModel.imageCategory = data["app_descubre_cat_foto"];
        categoriaModel.estateCategory = data["app_descubre_cat_estado"];

        final categoryDB = await categoryDesDB.getCategoryByIdCategory(categoriaModel.idCategory.toString());

        if (categoryDB.isNotEmpty) {
          categoriaModel.activateEnglish = categoryDB[0].activateEnglish;
        } else {
          categoriaModel.activateEnglish = '0';
        }

        await categoryDesDB.insertCategory(categoriaModel);
      }

      //Detalle Experiencias
      for (var i = 0; i < decodedData["experiencias"]["detalle"].length; i++) {
        var data = decodedData["experiencias"]["detalle"][i];

        DetailCategoryModel detalleModel = DetailCategoryModel();
        detalleModel.idDetailCategory = data["id_app_descubre_det"];
        detalleModel.idCategory = data["id_app_descubre_cat"];
        detalleModel.subtitleDetailCategory = data["app_descubre_det_subtitulo"];
        detalleModel.subtitleDetailCategoryEn = data["app_descubre_det_subtitulo_en"];
        detalleModel.imageDetailCategory = data["app_descubre_det_foto"];
        detalleModel.estadoDetalleCategoria = data["app_descubre_det_estado"];
        detalleModel.detalleCategoriaDetalle = data["app_descubre_det_detalle"];
        detalleModel.detailCategoriaDetalleEn = data["app_descubre_det_detalle_en"];

        final detalleDB = await detailDesDB.getDetalleByIdDetalleCategoria(detalleModel.idDetailCategory.toString());

        if (detalleDB.isNotEmpty) {
          detalleModel.activateEnglish = detalleDB[0].activateEnglish;
        } else {
          detalleModel.activateEnglish = '0';
        }

        await detailDesDB.insertDetalle(detalleModel);
      }

      //Categorias Negocios (Licenciatarios)
      for (var i = 0; i < decodedData["licenciatarios"]["categorias"].length; i++) {
        var data = decodedData["licenciatarios"]["categorias"][i];

        BusinessCategoryModel categoriaModel = BusinessCategoryModel();
        categoriaModel.idBusinessCategory = data["id_app_negocio_cat"];
        categoriaModel.nameBusinessCategory = data["app_negocio_cat_nombre"];
        categoriaModel.nameBusinessCategoryEn = data["app_negocio_cat_nombre_en"];
        categoriaModel.stateBusinessCategory = data["app_negocio_cat_estado"];

        final catNegDB = await businessCategoryDB.getBusinessCategoryByIdCategory(categoriaModel.idBusinessCategory.toString());

        if (catNegDB.isNotEmpty) {
          categoriaModel.activateEnglish = catNegDB[0].activateEnglish;
        } else {
          categoriaModel.activateEnglish = '0';
        }

        await businessCategoryDB.insertBusinessCategory(categoriaModel);
      }

      //Detalle Negocios (Licenciatarios)
      for (var i = 0; i < decodedData["licenciatarios"]["detalle"].length; i++) {
        var data = decodedData["licenciatarios"]["detalle"][i];

        BusinessModel negocioModel = BusinessModel();
        negocioModel.idBusiness = data["id_app_negocio_det"];
        negocioModel.idBusinessCategory = data["id_app_negocio_cat"];
        negocioModel.nameBusiness = data["app_negocio_det_nombre"];
        negocioModel.imageBusiness = data["app_negocio_det_foto"];
        negocioModel.detailBusiness = data["app_negocio_det_detalle"];
        negocioModel.detailBusinessEn = data["app_negocio_det_detalle_en"];
        negocioModel.urlBusiness = data["app_negocio_det_web"];
        negocioModel.facebookBusiness = data["app_negocio_det_facebook"];
        negocioModel.catalogueBusiness = data["app_negocio_det_file"];
        negocioModel.dateTimeBusiness = data["app_negocio_det_datetime"];
        negocioModel.estadoNegocio = data["app_negocio_det_estado"];

        final negociosDB = await businessDb.getBusinessByIdBusiness(negocioModel.idBusiness.toString());

        if (negociosDB.isNotEmpty) {
          negocioModel.activateEnglish = negociosDB[0].activateEnglish;
        } else {
          negocioModel.activateEnglish = '0';
        }

        await businessDb.insertBusiness(negocioModel);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
