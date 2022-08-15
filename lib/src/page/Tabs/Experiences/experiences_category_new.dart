import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Category/category_model.dart';

class ExperiencesCategoryNew extends StatefulWidget {
  const ExperiencesCategoryNew({Key? key}) : super(key: key);

  @override
  State<ExperiencesCategoryNew> createState() => _ExperiencesCategoryNewState();
}

class _ExperiencesCategoryNewState extends State<ExperiencesCategoryNew> {
  final _controller = ChangeIndexController();
  @override
  Widget build(BuildContext context) {
    final experiencesCategoryBloc = ProviderBloc.categories(context);
    experiencesCategoryBloc.getExperiencesCategory();
    return StreamBuilder(
      stream: experiencesCategoryBloc.experiencesCategoryStream,
      builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            if (_controller.index == 0) {
              experiencesCategoryBloc.getDetailExperiences(
                  snapshot.data![0].idCategory.toString());
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
                            // if (provider.activateS.value == 1) {}
                            // categoriasExpBloc.getDetalleExperiencia(category.idCategoria.toString());
                            return InkWell(
                              onTap: () {
                                _controller.changeIndex(i);
                                experiencesCategoryBloc.getDetailExperiences(
                                    category.idCategory.toString());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30),
                                  vertical: ScreenUtil().setHeight(14),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(8)),
                                decoration: BoxDecoration(
                                  color: (_controller.index == i)
                                      ? const Color(0XFFF9B233)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: const Color(0XFFF9B233)),
                                ),
                                child: Text(
                                  (category.activateEnglish == '1')
                                      ? '${category.nameCategoryEn}'
                                      : '${category.nameCategory}',
                                  style: TextStyle(
                                    color: (_controller.index == i)
                                        ? Colors.white
                                        : const Color(0XFFF9B233),
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

class ChangeIndexController extends ChangeNotifier {
  int index = 0;
  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
