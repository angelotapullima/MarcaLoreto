import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/experiencias.dart';
import 'package:marca_loreto/src/models/principal_atraciones.dart';

class ExperienciasPage extends StatelessWidget {
  const ExperienciasPage({Key? key}) : super(key: key);

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
                    'Experiencias',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(35),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimationList(
                      shrinkWrap: true,
                      children: experiencias.map((item) {
                        return _buildTile(item['nombre'], item['color']);
                      }).toList()),
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
