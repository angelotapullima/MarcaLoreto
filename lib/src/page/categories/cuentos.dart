import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/models/cuentos.dart';
import 'package:marca_loreto/src/utils/responsive.dart';

class CuentosPage extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();

  CuentosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    final responsive = Responsive.of(context);

    return Scaffold(
      //resizeToAvoidBottomInset:false,

      body: Stack(
        children: <Widget>[
          _carouselTarjetas(context, responsive, cuentosList),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(5),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(.4),
                      child: const BackButton(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(5),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                  child: Text(
                    'Cuentos preferidos de la amazonía',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(
                          25,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _carouselTarjetas(BuildContext context, Responsive responsive, List<CartModel> list) {
    return _stackTarjetas(context, list, responsive);
  }

  Widget _stackTarjetas(BuildContext context, List<CartModel> puzzle, Responsive responsive) {
    return Stack(
      children: <Widget>[
        _backgroundImage(puzzle, responsive),
        _carousel(context, puzzle, responsive),
      ],
    );
  }

  Widget _backgroundImage(List<CartModel> puzzle, Responsive responsive) {
    //print("${pelicula[0].getPosterImg()}");
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          controller: _scrollController,
          //reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: puzzle.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      color: Colors.blue.shade900,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width / 2,
                    )
                  ],
                ),
              );
            }
            return Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
            );
            /*  return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: Container(
                child: Image.asset(
                  '${puzzle[index].foto}',
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ); */
          }),
    );
  }

  Widget _carousel(BuildContext context, List<CartModel> puzzle, Responsive responsive) {
    final List<Widget> imageSliders = puzzle.map((item) => cardSlider(context, item.foto.toString(), item.nombre.toString(), responsive)).toList();

    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height,
        aspectRatio: 2,
        viewportFraction: 0.68,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        onScrolled: (data) {
          _scrollController.animateTo(
            data! * size.width,
            /* ((data * 125 / imageSliders.length) / 100) *
                _scrollController.position.maxScrollExtent */

            curve: Curves.ease,
            duration: const Duration(milliseconds: 100),
          );
        },
      ),
      items: imageSliders,
    );
  }

  Widget cardSlider(BuildContext context, String imagen, String title, Responsive responsive) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: responsive.hp(20),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
            height: responsive.hp(60),
            child: Stack(children: [
              SizedBox(
                height: responsive.hp(60),
                child: Image.asset(
                  imagen,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: responsive.hp(60),
                color: Colors.black.withOpacity(.2),
              ),
              Container(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),

        /*  
            _button(context, puzzle, responsive), */
      ],
    );
  }
}
