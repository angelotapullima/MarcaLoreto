import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/inicio/blog_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inicioBloc = ProviderBloc.inicio(context);
    inicioBloc.getInicio();
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: StreamBuilder(
        stream: inicioBloc.blogStream,
        builder: (context, AsyncSnapshot<List<BlogModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    //Titulo
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          (snapshot.data![0].activarEnglish == '1') ? 'Blog and News' : 'Blog y Noticias',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(width: ScreenUtil().setWidth(150), child: SvgPicture.asset('assets/svg/icons/vector_title_inicio.svg')),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    //Lista de Blogs
                    SizedBox(
                      height: ScreenUtil().setHeight(300),
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            var blog = snapshot.data![i];
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                height: ScreenUtil().setHeight(300),
                                width: ScreenUtil().setWidth(156),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(8),
                                ),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(300),
                                      width: ScreenUtil().setWidth(156),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                                        imageUrl: '$apiBaseURL/${blog.colorBlog}',
                                        imageBuilder: (context, imageProvider) => Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: ScreenUtil().setHeight(132),
                                          width: ScreenUtil().setWidth(156),
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) => const CupertinoActivityIndicator(),
                                            errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                                            imageUrl: '$apiBaseURL/${blog.imageBlog}',
                                            imageBuilder: (context, imageProvider) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(10),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
                                          child: Text(
                                            (blog.activarEnglish == '1') ? '${blog.titleBlogEn}' : '${blog.tituloBlog}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
                                          child: Text(
                                            (blog.activarEnglish == '1') ? '${blog.subtitleBlogEn}' : '${blog.subtituloBlog}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(32),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
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
                            (snapshot.data![0].activarEnglish == '1') ? 'See more' : 'Ver más',
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
