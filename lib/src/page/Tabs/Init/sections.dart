import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Init/section_model.dart';
import 'package:marca_loreto/src/page/Tabs/Init/Section2/join_me.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initBloc = ProviderBloc.init(context);
    initBloc.getInit();
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: StreamBuilder(
        stream: initBloc.sectionStream,
        builder: (context, AsyncSnapshot<List<SectionModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              var section = snapshot.data![0];

              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          (section.activateEnglish == '1')
                              ? '${section.titleSectionEn}'
                              : '${section.titleSection}',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                            width: ScreenUtil().setWidth(150),
                            child: SvgPicture.asset(
                                'assets/svg/icons/vector_title_inicio.svg')),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(34),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16)),
                      width: double.infinity,
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/img/logos/logo.png'),
                        imageUrl: '$apiBaseURL/${section.imageSection}',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(34),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        (section.activateEnglish == '1')
                            ? '${section.subtitle1SectionEn}'
                            : '${section.subtitle1Section}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        (section.activateEnglish == '1')
                            ? '${section.subtitle2SectionEn}'
                            : '${section.subtitle2Section}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return JoinMe(
                                  section: section,
                                );
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = const Offset(0.0, 1.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end).chain(
                                  CurveTween(curve: curve),
                                );

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(48),
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(30),
                            vertical: ScreenUtil().setHeight(14),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color(0XFFF9B233)),
                          ),
                          child: Text(
                            (section.activateEnglish == '1')
                                ? 'Join me'
                                : 'Unirme',
                            style: TextStyle(
                              color: const Color(0XFFF9B233),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Image.asset('assets/img/logos/logo.png');
            }
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
