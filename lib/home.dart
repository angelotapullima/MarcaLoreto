import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marca_loreto/src/page/Tabs/Init/init.dart';
import 'package:provider/provider.dart';

import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:marca_loreto/src/page/Actions/form_action.dart';
import 'package:marca_loreto/src/page/Tabs/Discover/discover_page.dart';
import 'package:marca_loreto/src/page/Tabs/Experiences/experiences_with_appbar.dart';
import 'package:marca_loreto/src/page/Tabs/Licensees/licensees.dart';
import 'package:marca_loreto/src/utils/responsive.dart';

import 'src/page/change_language.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList.add(const Init());
    pageList.add(const DiscoverPage());
    pageList.add(const ExperiencesWithAppBar());
    pageList.add(const Licensees());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerLanguage>(context, listen: false);
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
                (bottomBloc.page == 0)
                    ? Positioned(
                        bottom: ScreenUtil().setHeight(80),
                        right: ScreenUtil().setWidth(16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return FormAction();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = const Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween =
                                      Tween(begin: begin, end: end).chain(
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
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.question_mark,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
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
                    child: ValueListenableBuilder(
                      valueListenable: provider.activate,
                      builder: (BuildContext context, int data, Widget? child) {
                        return Row(
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
                                            'assets/svg/tabs/home.svg',
                                            color: const Color(0xFF008d36),
                                          )
                                        : SvgPicture.asset(
                                            'assets/svg/tabs/home.svg',
                                            color: Colors.grey,
                                          ),
                                  ),
                                  Text(
                                    (provider.activateS.value == 1)
                                        ? '    Home   '
                                        : '    Inicio    ',
                                    style: TextStyle(
                                      color: (bottomBloc.page == 0)
                                          ? const Color(0xFF008d36)
                                          : Colors.black,
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
                                            'assets/svg/tabs/binoculars.svg',
                                            color: const Color(0xFF008d36),
                                          )
                                        : SvgPicture.asset(
                                            'assets/svg/tabs/binoculars.svg',
                                            color: Colors.grey,
                                          ),
                                  ),
                                  Text(
                                    (provider.activateS.value == 1)
                                        ? '  Discover '
                                        : '   Descubre   ',
                                    style: TextStyle(
                                      color: (bottomBloc.page == 1)
                                          ? const Color(0xFF008d36)
                                          : Colors.black,
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
                                            'assets/svg/tabs/puma.svg',
                                            color: const Color(0xFF008d36),
                                          )
                                        : SvgPicture.asset(
                                            'assets/svg/tabs/puma.svg',
                                            color: Colors.grey,
                                          ),
                                  ),
                                  Text(
                                    (provider.activateS.value == 1)
                                        ? 'Experiences'
                                        : ' Experiencias ',
                                    style: TextStyle(
                                      color: (bottomBloc.page == 2)
                                          ? const Color(0xFF008d36)
                                          : Colors.black,
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
                                            'assets/svg/tabs/ceram.svg',
                                            color: const Color(0xFF008d36),
                                          )
                                        : SvgPicture.asset(
                                            'assets/svg/tabs/ceram.svg',
                                            color: Colors.grey,
                                          ),
                                  ),
                                  Text(
                                    (provider.activateS.value == 1)
                                        ? ' Licensees '
                                        : 'Licenciatarios',
                                    style: TextStyle(
                                      color: (bottomBloc.page == 3)
                                          ? const Color(0xFF008d36)
                                          : Colors.black,
                                      fontSize: ScreenUtil().setSp(11),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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
