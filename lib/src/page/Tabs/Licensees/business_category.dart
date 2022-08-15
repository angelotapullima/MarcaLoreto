import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Licensees/business_category_model.dart';

class BusinessCategory extends StatefulWidget {
  const BusinessCategory({Key? key}) : super(key: key);

  @override
  State<BusinessCategory> createState() => _BusinessCategoryState();
}

class _BusinessCategoryState extends State<BusinessCategory> {
  final _controller = changeIndexController();
  @override
  Widget build(BuildContext context) {
    final businessCategoryBloc = ProviderBloc.business(context);
    businessCategoryBloc.getBusinessCategory();
    return StreamBuilder(
      stream: businessCategoryBloc.businessCategoryStream,
      builder: (context, AsyncSnapshot<List<BusinessCategoryModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            if (_controller.index == 0) {
              businessCategoryBloc.getBusinessByIdCategory(
                  snapshot.data![0].idBusinessCategory.toString());
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
                                businessCategoryBloc.getBusinessByIdCategory(
                                    category.idBusinessCategory.toString());
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
                                      ? '${category.nameBusinessCategoryEn}'
                                      : '${category.nameBusinessCategory}',
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

class changeIndexController extends ChangeNotifier {
  int index = 0;
  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
