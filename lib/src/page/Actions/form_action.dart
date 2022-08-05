import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/src/utils/utils.dart';

class FormAction extends StatefulWidget {
  const FormAction({Key? key}) : super(key: key);

  @override
  _FormActionState createState() => _FormActionState();
}

class _FormActionState extends State<FormAction> {
  final _controller = ControllerAction();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(.1),
      child: Stack(
        fit: StackFit.expand,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(150),
              horizontal: ScreenUtil().setWidth(40),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: new ExactAssetImage('assets/img/logos/popup.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(24),
                vertical: ScreenUtil().setHeight(5),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                      child: Image.asset('assets/img/logos/logo.png'),
                    ),
                    Text(
                      'Loreto tiene algo que contarte.\nDescubre de qué se trata, ingresando tus datos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16),
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(8),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _nombreController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Nombre',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(8),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _emailController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    ElevatedButton(
                      onPressed: () {
                        if (_nombreController.value.text.isNotEmpty) {
                          if (_emailController.value.text.isNotEmpty) {
                          } else {
                            showToast2('Email requerido', Colors.redAccent);
                          }
                        } else {
                          showToast2('Nombre requerido', Colors.redAccent);
                        }
                      },
                      child: Text('Enviar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Volver',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   margin: EdgeInsets.symmetric(
          //     vertical: ScreenUtil().setHeight(235),
          //     horizontal: ScreenUtil().setWidth(40),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Stack(
          //     fit: StackFit.expand,
          //     children: [
          //       SizedBox(
          //         width: double.infinity,
          //         height: double.infinity,
          //         child: Image.asset('assets/img/logos/popup.png'),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: ScreenUtil().setWidth(24),
          //           vertical: ScreenUtil().setHeight(10),
          //         ),
          //         child: SingleChildScrollView(
          //           child: Column(
          //             children: [
          //               SizedBox(
          //                 height: ScreenUtil().setHeight(60),
          //                 child: Image.asset('assets/img/logos/logo.png'),
          //               ),
          //               SizedBox(
          //                 height: ScreenUtil().setHeight(10),
          //               ),
          //               Text(
          //                 'Loreto tiene algo que contarte.\nDescrubre de que se trata, ingresando tus datos.',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w500,
          //                   fontSize: ScreenUtil().setSp(16),
          //                   fontStyle: FontStyle.normal,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: ScreenUtil().setHeight(20),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.symmetric(
          //                   vertical: ScreenUtil().setHeight(10),
          //                 ),
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: ScreenUtil().setWidth(8),
          //                 ),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(color: Colors.green),
          //                   borderRadius: BorderRadius.circular(15),
          //                 ),
          //                 child: TextField(
          //                   controller: _nombreController,
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                     fontSize: ScreenUtil().setSp(16),
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                   decoration: InputDecoration(
          //                     label: Text(
          //                       'Nombre',
          //                       style: TextStyle(
          //                         fontSize: ScreenUtil().setSp(14),
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     border: InputBorder.none,
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.symmetric(
          //                   vertical: ScreenUtil().setHeight(10),
          //                 ),
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: ScreenUtil().setWidth(8),
          //                 ),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(color: Colors.green),
          //                   borderRadius: BorderRadius.circular(15),
          //                 ),
          //                 child: TextField(
          //                   controller: _emailController,
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                     fontSize: ScreenUtil().setSp(16),
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                   decoration: InputDecoration(
          //                     label: Text(
          //                       'Email',
          //                       style: TextStyle(
          //                         fontSize: ScreenUtil().setSp(14),
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     border: InputBorder.none,
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(height: ScreenUtil().setHeight(10)),
          //               ElevatedButton(
          //                 onPressed: () {
          //                   if (_nombreController.value.text.isNotEmpty) {
          //                     if (_emailController.value.text.isNotEmpty) {
          //                     } else {
          //                       ScaffoldMessenger.of(context).showSnackBar(
          //                         SnackBar(
          //                           content: Text("Email requerido"),
          //                         ),
          //                       );
          //                     }
          //                   } else {
          //                     ScaffoldMessenger.of(context).showSnackBar(
          //                       SnackBar(
          //                         content: Text("Nombre requerido"),
          //                       ),
          //                     );
          //                   }
          //                 },
          //                 child: Text('Enviar'),
          //               ),
          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: Text(
          //                   'Volver',
          //                   style: TextStyle(
          //                     color: Colors.redAccent,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          AnimatedBuilder(
            animation: _controller,
            builder: (_, p) {
              return (_controller.cargando) ? CupertinoActivityIndicator() : Container();
            },
          ),
        ],
      ),
    );
  }
}

class ControllerAction extends ChangeNotifier {
  bool cargando = false;

  void changeCargando(bool c) {
    cargando = c;
    notifyListeners();
  }
}
