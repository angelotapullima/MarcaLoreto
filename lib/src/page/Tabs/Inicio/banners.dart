import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/model/inicio/banner_model.dart';
import 'package:marca_loreto/src/utils/constants.dart';

class Banners extends StatefulWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final _controlller = ControllerBanner();
  @override
  Widget build(BuildContext context) {
    final inicioBloc = ProviderBloc.inicio(context);
    inicioBloc.getInicio();
    return SizedBox(
      height: ScreenUtil().setHeight(470),
      child: StreamBuilder(
        stream: inicioBloc.bannerStream,
        builder: (context, AsyncSnapshot<List<BannerModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return CarouselSlider.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, x, y) {
                  var banner = snapshot.data![x];
                  return Stack(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Image.asset('assets/img/logos/logo.png'),
                        imageUrl: '$apiBaseURL/${banner.imageBanner}',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              (banner.activarEnglish == '1') ? '${banner.titleBannerEn}' : '${banner.tituloBanner}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(24),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(8),
                            ),
                            Text(
                              (banner.activarEnglish == '1') ? '${banner.subtitleBannerEn}' : '${banner.subtituloBanner}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
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
                                    color: const Color(0XFFF9B233),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    (banner.activarEnglish == '1') ? 'See more' : 'Ver más',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            AnimatedBuilder(
                                animation: _controlller,
                                builder: (_, r) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: snapshot.data!.asMap().entries.map((entry) {
                                      return Container(
                                        width: ScreenUtil().setWidth(120) / snapshot.data!.length,
                                        height: ScreenUtil().setHeight(3),
                                        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8), horizontal: ScreenUtil().setWidth(4)),
                                        decoration: BoxDecoration(
                                          color: (_controlller.index == entry.key) ? const Color(0XFFF9B233) : Colors.white,
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: ScreenUtil().setHeight(40),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: double.infinity,
                  onPageChanged: (index, page) {
                    _controlller.changeIndex(index);
                  },
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
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

class ControllerBanner extends ChangeNotifier {
  int index = 0;

  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
