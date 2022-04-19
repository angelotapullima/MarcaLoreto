import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
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
    pageList.add(Container());
    pageList.add(Container());
    pageList.add(Container());
    pageList.add(Container());
    //pageList.add(UserPage());

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
                  bottom: responsive.hp(2),
                  left: responsive.wp(3),
                  right: responsive.wp(3),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: responsive.wp(3),
                      right: responsive.wp(3),
                    ),
                    height: responsive.hp(9),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(30),
                      /*   boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ], */
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
                                height: responsive.ip(3.5),
                                width: responsive.ip(3.5),
                                child: (bottomBloc.page == 0)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.white,
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.blue,
                                      ), //Image.assege.asset('assets/logo_largo.svg'),
                              ),
                              CircleAvatar(
                                backgroundColor: (bottomBloc.page == 0) ? Colors.grey : Colors.blue,
                                radius: 2.5,
                              ),
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
                                height: responsive.ip(3.5),
                                width: responsive.ip(3.5),
                                child: (bottomBloc.page == 1)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.blue,
                                      ), //Image.asseage.asset('assets/logo_largo.svg'),
                              ),
                              CircleAvatar(
                                backgroundColor: (bottomBloc.page == 1) ? Colors.grey : Colors.blue,
                                radius: 2.5,
                              ),
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
                                height: responsive.ip(3.5),
                                width: responsive.ip(3.5),
                                child: (bottomBloc.page == 2)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.blue,
                                      ), //Image.asset('assets/logo_largo.svg'),
                              ),
                              CircleAvatar(
                                backgroundColor: (bottomBloc.page == 2) ? Colors.grey : Colors.blue,
                                radius: 2.5,
                              ),
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
                                height: responsive.ip(3.5),
                                width: responsive.ip(3.5),
                                child: (bottomBloc.page == 3)
                                    ? SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/tabs/home_tab.svg',
                                        color: Colors.blue,
                                      ), //Image'assets/logo_largo.svg'),
                              ),
                              CircleAvatar(
                                backgroundColor: (bottomBloc.page == 3) ? Colors.grey : Colors.blue,
                                radius: 2.5,
                              ),
                            ],
                          ),
                        ),

                        /*    InkWell(
                          onTap: () {
                            bottomBloc.changePage(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ScreenUtil().setSp(18),
                                width: ScreenUtil().setSp(18),
                                child: (bottomBloc.page == 1)
                                    ? SvgPicture.asset(
                                        'assets/tabs/tab_torneo_v.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/tabs/tab_torneo_g.svg',
                                      ), //Imagsset('assets/logo_largo.svg'),
                              ),
                              Text(
                                'Torneo',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(13),
                                  fontWeight: FontWeight.w600,
                                  color: (bottomBloc.page == 1) ? Colors.green : Colors.grey,
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
                                height: ScreenUtil().setSp(18),
                                width: ScreenUtil().setSp(18),
                                child: (bottomBloc.page == 2)
                                    ? SvgPicture.asset(
                                        'assets/tabs/tab_partidos_v.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/tabs/tab_partidos_g.svg',
                                      ), //Imagsset('assets/logo_largo.svg'),
                              ),
                              Text(
                                'Partidos',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(13),
                                  fontWeight: FontWeight.w600,
                                  color: (bottomBloc.page == 2) ? Colors.green : Colors.grey,
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
                                height: ScreenUtil().setSp(18),
                                width: ScreenUtil().setSp(18),
                                child: (bottomBloc.page == 3)
                                    ? SvgPicture.asset(
                                        'assets/tabs/tab_promociones_v.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/tabs/tab_promociones_g.svg',
                                      ), //Imagsset('assets/logo_largo.svg'),
                              ),
                              Text(
                                'Promos',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.w600,
                                  color: (bottomBloc.page == 3) ? Colors.green : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                     */
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
