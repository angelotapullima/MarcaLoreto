import 'dart:ui';

import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/experiencias.dart';
import 'package:marca_loreto/src/models/gastronomia.dart';

class GatronomiaPage extends StatelessWidget {
  const GatronomiaPage({Key? key}) : super(key: key);

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
                    'Gastronomía',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(35),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: gatronomiaList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return LayoutBuilder(builder: (context, constrain) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(5),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: constrain.maxHeight,
                                  width: constrain.maxWidth,
                                  child: Image.asset(
                                    '${gatronomiaList[index]['foto']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                    child: Container(
                                      height: constrain.maxHeight,
                                      width: constrain.maxWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                /* SizedBox(
                                  height: constrain.maxHeight,
                                  width: constrain.maxWidth,
                                  child: Image.asset(
                                    '${gatronomiaList[index]['foto']}',
                                    fit: BoxFit.cover,
                                  ),
                                ), */
                                Container(
                                  height: constrain.maxHeight,
                                  width: constrain.maxWidth,
                                  color: Colors.black.withOpacity(.3),
                                ),
                                Center(
                                  child: Text(
                                    '${gatronomiaList[index]['nombre']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(24),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String? title, Color? backgroundColor) {
    return Container(
      height: ScreenUtil().setHeight(100),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(20),
          ),
        ),
      ),
    );
  }
}
