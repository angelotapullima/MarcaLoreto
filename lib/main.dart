import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marca_loreto/home.dart';
import 'package:marca_loreto/src/bloc/bloc_contador_qr.dart';
import 'package:marca_loreto/src/bloc/provider_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContadorQrBloc>(
          create: (_) => ContadorQrBloc(),
        ),
      ],
      child: ProviderBloc(
        child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(375, 812),
          builder: () => MaterialApp(
            title: 'Loreto',
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              ScreenUtil.setContext(context);
              return MediaQuery(
                data: data.copyWith(textScaleFactor: data.textScaleFactor > 2.0 ? 1.2 : data.textScaleFactor),
                child: child!,
              );
            },
            theme: ThemeData(
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: const Color(0xFFF2F7F5),
              canvasColor: Colors.transparent, 
            ),
            initialRoute: 'home',
            routes: {
              "home": (BuildContext context) => const HomePage(),
            },
          ),
        ),
      ),
    );
  }
}
