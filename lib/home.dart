import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/page/Tabs/Inicio/inicio.dart';
import 'package:marca_loreto/src/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList.add(const Inicio());
    pageList.add(Container());
    pageList.add(Container());
    pageList.add(Container());
    pageList.add(Container());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBloc = ProviderBloc.bottom(context);
    bottomBloc.changePage(0);

    final responsive = Responsive.of(context);
    return Scaffold(
      body: StreamBuilder(
        stream: bottomBloc.selectPageStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                SizedBox(
                  child: IndexedStack(
                    index: bottomBloc.page,
                    children: pageList,
                  ),
                ),
                Positioned(
                  // bottom: responsive.hp(2),
                  // left: responsive.wp(3),
                  // right: responsive.wp(3),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: responsive.wp(3),
                      right: responsive.wp(3),
                    ),
                    height: responsive.hp(9),
                    // height: ScreenUtil().setHeight(48),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            bottomBloc.changePage(0);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: responsive.ip(2.5),
                                width: responsive.ip(2.5),
                                child: (bottomBloc.page == 0)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: const Color(0xFF008d36),
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                'Inicio',
                                style: TextStyle(
                                  color: (bottomBloc.page == 0) ? const Color(0xFF008d36) : Colors.black,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomBloc.changePage(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: responsive.ip(2.5),
                                width: responsive.ip(2.5),
                                child: (bottomBloc.page == 1)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: const Color(0xFF008d36),
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                'Descubre',
                                style: TextStyle(
                                  color: (bottomBloc.page == 1) ? const Color(0xFF008d36) : Colors.black,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomBloc.changePage(2);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: responsive.ip(2.5),
                                width: responsive.ip(2.5),
                                child: (bottomBloc.page == 2)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: const Color(0xFF008d36),
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                'Experiencias',
                                style: TextStyle(
                                  color: (bottomBloc.page == 2) ? const Color(0xFF008d36) : Colors.black,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomBloc.changePage(3);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: responsive.ip(2.5),
                                width: responsive.ip(2.5),
                                child: (bottomBloc.page == 3)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: const Color(0xFF008d36),
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                'Productos',
                                style: TextStyle(
                                  color: (bottomBloc.page == 3) ? const Color(0xFF008d36) : Colors.black,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomBloc.changePage(4);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: responsive.ip(2.5),
                                width: responsive.ip(2.5),
                                child: (bottomBloc.page == 4)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: const Color(0xFF008d36),
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/gol.svg',
                                        color: Colors.grey,
                                      ),
                              ),
                              Text(
                                'Vivencias',
                                style: TextStyle(
                                  color: (bottomBloc.page == 4) ? const Color(0xFF008d36) : Colors.black,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     bottomBloc.changePage(2);
                        //   },
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         height: responsive.ip(3.5),
                        //         width: responsive.ip(3.5),
                        //         child: (bottomBloc.page == 2)
                        //             ? SvgPicture.asset(
                        //                 'assets/svg/tabs/Experiencias.svg',
                        //                 color: Colors.grey,
                        //               )
                        //             : SvgPicture.asset(
                        //                 'assets/svg/tabs/Experiencias.svg',
                        //                 color: Colors.blue,
                        //               ), //Image.asset('assets/logo_largo.svg'),
                        //       ),
                        //       CircleAvatar(
                        //         backgroundColor: (bottomBloc.page == 2) ? Colors.grey : Colors.blue,
                        //         radius: 2.5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     bottomBloc.changePage(3);
                        //   },
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         height: responsive.ip(3.5),
                        //         width: responsive.ip(3.5),
                        //         child: (bottomBloc.page == 3)
                        //             ? SvgPicture.asset(
                        //                 'assets/svg/tabs/Productos.svg',
                        //                 color: Colors.grey,
                        //               )
                        //             : SvgPicture.asset(
                        //                 'assets/svg/tabs/Productos.svg',
                        //                 color: Colors.blue,
                        //               ), //Image'assets/logo_largo.svg'),
                        //       ),
                        //       CircleAvatar(
                        //         backgroundColor: (bottomBloc.page == 3) ? Colors.grey : Colors.blue,
                        //         radius: 2.5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     bottomBloc.changePage(4);
                        //   },
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         height: responsive.ip(3.5),
                        //         width: responsive.ip(3.5),
                        //         child: (bottomBloc.page == 4)
                        //             ? SvgPicture.asset(
                        //                 'assets/svg/tabs/Vivencias.svg',
                        //                 color: Colors.grey,
                        //               )
                        //             : SvgPicture.asset(
                        //                 'assets/svg/tabs/Vivencias.svg',
                        //                 color: Colors.blue,
                        //               ), //Image'assets/logo_largo.svg'),
                        //       ),
                        //       CircleAvatar(
                        //         backgroundColor: (bottomBloc.page == 4) ? Colors.grey : Colors.blue,
                        //         radius: 2.5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            final bottomBloc = ProviderBloc.bottom(context);
            bottomBloc.changePage(0);
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
