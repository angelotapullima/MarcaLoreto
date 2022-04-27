import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Licenciatarios/categorias_negocio_model.dart';

class CategoriasNegocio extends StatefulWidget {
  const CategoriasNegocio({Key? key}) : super(key: key);

  @override
  State<CategoriasNegocio> createState() => _CategoriasNegocioState();
}

class _CategoriasNegocioState extends State<CategoriasNegocio> {
  final _controller = ControllerCategoriasNegocio();
  @override
  Widget build(BuildContext context) {
    final categoriasNegBloc = ProviderBloc.negocio(context);
    categoriasNegBloc.getCategoriesNegocios();
    return StreamBuilder(
      stream: categoriasNegBloc.categoriasNegocioStream,
      builder: (context, AsyncSnapshot<List<CategoriasNegocioModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            if (_controller.index == 0) {
              categoriasNegBloc.getNegociosByIdCategory(snapshot.data![0].idCategoriaNeg.toString());
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16),
                vertical: ScreenUtil().setHeight(16),
              ),
              child: SizedBox(
                height: ScreenUtil().setHeight(50),
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (_, s) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, i) {
                            var category = snapshot.data![i];
                            return InkWell(
                              onTap: () {
                                _controller.changeIndex(i);
                                categoriasNegBloc.getNegociosByIdCategory(category.idCategoriaNeg.toString());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30),
                                  vertical: ScreenUtil().setHeight(14),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                                decoration: BoxDecoration(
                                  color: (_controller.index == i) ? const Color(0XFFF9B233) : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: const Color(0XFFF9B233)),
                                ),
                                child: Text(
                                  (category.activarEnglish == '1') ? '${category.nameCategoriaNegEn}' : '${category.nombreCategoriaNeg}',
                                  style: TextStyle(
                                    color: (_controller.index == i) ? Colors.white : const Color(0XFFF9B233),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
              ),
            );
          } else {
            return Container();
          }
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}

class ControllerCategoriasNegocio extends ChangeNotifier {
  int index = 0;
  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
