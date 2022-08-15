import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Category/category_model.dart';

class ExperiencesCategory extends StatefulWidget {
  const ExperiencesCategory({Key? key}) : super(key: key);

  @override
  State<ExperiencesCategory> createState() => _ExperiencesCategoryState();
}

class _ExperiencesCategoryState extends State<ExperiencesCategory> {
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
            experiencesCategoryBloc
                .getDetailExperiences(snapshot.data![0].idCategory.toString());
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
                                      experiencesCategoryBloc
                                          .getDetailExperiences(
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
                                        '${category.nameCategory}',
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

class ChangeIndexController extends ChangeNotifier {
  int index = 0;
  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
