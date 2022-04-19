import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaisajesPage extends StatefulWidget {
  PaisajesPage({Key? key}) : super(key: key);

  @override
  State<PaisajesPage> createState() => _PaisajesPageState();
}

class _PaisajesPageState extends State<PaisajesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/img/42.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(.2),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(5),
                    ),
                    child: Text(
                      'Paisajes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(35),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    height: ScreenUtil().setHeight(200),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/img/1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/3.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                    SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    height: ScreenUtil().setHeight(200),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/img/4.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/5.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/6.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    height: ScreenUtil().setHeight(200),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/img/1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    height: ScreenUtil().setHeight(200),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/img/1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(170),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
