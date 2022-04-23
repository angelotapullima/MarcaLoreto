import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';

class CategoriasExperiencias extends StatelessWidget {
  const CategoriasExperiencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasExpBloc = ProviderBloc.categorias(context);
    categoriasExpBloc.getCategoriesExpreriencias();
    return StreamBuilder(
      stream: categoriasExpBloc.categoriasDesStream,
      builder: (context, AsyncSnapshot<List<CategoriaModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16),
                      vertical: ScreenUtil().setHeight(16),
                    ),
                    child: SizedBox(
                      height: ScreenUtil().setHeight(50),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, i) {
                            var category = snapshot.data![i];
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30),
                                  vertical: ScreenUtil().setHeight(14),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: const Color(0XFFF9B233)),
                                ),
                                child: Text(
                                  '${category.nombreCategoria}',
                                  style: TextStyle(
                                    color: const Color(0XFFF9B233),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                },
                childCount: 1,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container();
                },
                childCount: 1,
              ),
            );
          }
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              childCount: 1,
            ),
          );
        }
      },
    );
  }
}
