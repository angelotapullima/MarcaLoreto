import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/Init/archive_model.dart';
import 'package:marca_loreto/src/model/Init/section_model.dart';
import 'package:marca_loreto/src/page/change_language.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinMe extends StatelessWidget {
  const JoinMe({Key? key, required this.section}) : super(key: key);
  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
    final detailBlocBloc = ProviderBloc.init(context);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Row(
              children: [
                const Spacer(),
                SizedBox(
                    width: ScreenUtil().setWidth(150),
                    child: SvgPicture.asset(
                        'assets/svg/icons/vector_title_inicio.svg')),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              height: ScreenUtil().setHeight(200),
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
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
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              child: Text(
                (section.activateEnglish == '1')
                    ? '${section.titleSectionEn}'
                    : '${section.titleSection}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              child: Text(
                (section.activateEnglish == '1')
                    ? '${section.subtitle1SectionEn}'
                    : '${section.subtitle1Section}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              child: Text(
                (section.activateEnglish == '1')
                    ? '${section.subtitle2SectionEn}'
                    : '${section.subtitle2Section}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            StreamBuilder<List<ArchiveModel>>(
                stream: detailBlocBloc.archiveStream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(16)),
                        child: Wrap(
                          children: snapshot.data!
                              .map(
                                (e) => ElevatedButton(
                                  onPressed: () {
                                    //Visitar URL
                                    visit(e.linkArchive ?? apiBaseURL);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0XFFA93226)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(15),
                                        vertical: ScreenUtil().setHeight(4),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    (section.activateEnglish == '1')
                                        ? e.nameArchiveEn ?? ''
                                        : e.nameArchive ?? '',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                              .toList()
                              .cast<Widget>(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }),
            SizedBox(
              height: ScreenUtil().setHeight(34),
            ),
          ],
        ),
      ),
    );
  }

  Future visit(String url) async {
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // }
    await launchUrl(Uri.parse(url));
  }
}
