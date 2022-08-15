import 'package:flutter/material.dart';
import 'package:marca_loreto/src/bloc/Category/category_blog.dart';
import 'package:marca_loreto/src/bloc/Init/init_bloc.dart';
import 'package:marca_loreto/src/bloc/Licensees/licensees_bloc.dart';
import 'package:marca_loreto/src/bloc/bottom_navigation_bloc.dart';

//singleton para obtner una unica instancia del Bloc
class ProviderBloc extends InheritedWidget {
  final bottomNaviBloc = BottomNaviBloc();

  //Inicio
  final inicioBloc = InitBloc();

  //Descubre
  final categoryBloc = CategoryBloc();

  //Licenciatarios
  final licenseesBloc = LicenseesBloc();

  ProviderBloc({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BottomNaviBloc bottom(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .bottomNaviBloc;
  }

  //Inicio
  static InitBloc init(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .inicioBloc;
  }

  //Descubre
  static CategoryBloc categories(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .categoryBloc;
  }

  //Licenciatarios
  static LicenseesBloc business(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .licenseesBloc;
  }
}
