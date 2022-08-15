import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Init/blog_model.dart';
import 'package:marca_loreto/src/page/Tabs/Init/Blogs/detail_blog.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:provider/provider.dart';

class AllBlogs extends StatelessWidget {
  const AllBlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final detailBlog = ProviderBloc.init(context);
    detailBlog.getInit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: ValueListenableBuilder(
            valueListenable: provider.activate,
            builder: (BuildContext context, int data, Widget? child) {
              return Text(
                (provider.activateS.value == 1)
                    ? 'Blog and News'
                    : 'Blog y Noticias',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              );
            }),
        // actions: const [
        //   ChangeLanguage(),
        // ],
      ),
      body: StreamBuilder<List<BlogModel>>(
        stream: detailBlog.blogStream,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (_, i) {
                    var blog = snapshot.data![i];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailBlog(
                                idBlog: blog.idBlog.toString(),
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
                        // height: ScreenUtil().setHeight(300),
                        // width: ScreenUtil().setWidth(156),
                        height: double.infinity,
                        width: double.infinity,
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
                              //width: ScreenUtil().setWidth(156),
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/img/logos/logo.png'),
                                imageUrl: '$apiBaseURL/${blog.colorBlog}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                                  //width: ScreenUtil().setWidth(156),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            'assets/img/logos/logo.png'),
                                    imageUrl: '$apiBaseURL/${blog.imageBlog}',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(4)),
                                  child: Text(
                                    (blog.activateEnglish == '1')
                                        ? '${blog.titleBlogEn}'
                                        : '${blog.titleBlog}',
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(4)),
                                  child: Text(
                                    (blog.activateEnglish == '1')
                                        ? '${blog.subtitleBlogEn}'
                                        : '${blog.subtitleBlog}',
                                    maxLines: 6,
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
                  });
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
