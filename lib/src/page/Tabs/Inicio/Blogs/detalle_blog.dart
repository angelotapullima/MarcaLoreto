import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/inicio/blog_model.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:provider/provider.dart';

class DetalleBlog extends StatelessWidget {
  const DetalleBlog({Key? key, required this.idBlog}) : super(key: key);
  final String idBlog;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final detalleBloc = ProviderBloc.inicio(context);
    detalleBloc.getBlogById(idBlog, false, '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: ValueListenableBuilder(
            valueListenable: provider.activate,
            builder: (BuildContext context, int data, Widget? child) {
              return Text(
                (provider.activateS.value == 1) ? 'Return' : 'Volver',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              );
            }),
        // actions: const [
        //   ChangeLanguage(),
        // ],
      ),
      body: StreamBuilder(
        stream: detalleBloc.blogIDStream,
        builder: (context, AsyncSnapshot<List<BlogModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              var detalle = snapshot.data![0];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(width: ScreenUtil().setWidth(150), child: SvgPicture.asset('assets/svg/icons/vector_title_inicio.svg')),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                      width: double.infinity,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                        imageUrl: '$apiBaseURL/${detalle.imageBlog}',
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
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        (detalle.activarEnglish == '1') ? '${detalle.titleBlogEn}' : '${detalle.tituloBlog}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                      child: Text(
                        (detalle.activarEnglish == '1') ? '${detalle.descriptionBlogEn}' : '${detalle.descripcionBlog}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(34),
                    ),
                  ],
                ),
              );
            } else {
              return ValueListenableBuilder(
                valueListenable: provider.activate,
                builder: (BuildContext context, int data, Widget? child) {
                  return Center(
                    child: Text(
                      (provider.activateS.value == 1) ? 'Oops sorry, no information' : 'Sin información disponible',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              );
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
