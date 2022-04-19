import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/coments.dart';

class ComentariosPage extends StatelessWidget {
  const ComentariosPage({Key? key}) : super(key: key);

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
                    'Comentarios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(35),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Expanded(
                  child: AnimationList(
                      shrinkWrap: true,
                      children: ComentsLisc.map((item) {
                        return _buildTile(
                          item['nombre'],
                        );
                      }).toList()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String? title) {
    return Container(
      height: ScreenUtil().setHeight(100),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSPF5L5JfFrB2EQ2J2DC3DyZOQEFzLweFoxVC9J9xNkk81jw6ZKlWCJb_XgNnW6K1-b3A&usqp=CAU'),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
            child: Text(
              '$title',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
