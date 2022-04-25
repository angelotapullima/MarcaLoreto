import 'package:flutter/material.dart';
import 'package:marca_loreto/src/bloc/Categorias/categorias_blog.dart';
import 'package:marca_loreto/src/bloc/Inicio/inicio_bloc.dart';
import 'package:marca_loreto/src/bloc/Licenciatarios/licenciatarios_bloc.dart';
import 'package:marca_loreto/src/bloc/bottom_navigation_bloc.dart';

//singleton para obtner una unica instancia del Bloc
class ProviderBloc extends InheritedWidget {
  final bottomNaviBloc = BottomNaviBloc();

  //Inicio
  final inicioBloc = InicioBloc();

  //Descubre
  final categoriasBloc = CategoriasBloc();

  //Licenciatarios
  final licenciatariosBloc = LicenciatariosBloc();

  ProviderBloc({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BottomNaviBloc bottom(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.bottomNaviBloc;
  }

  //Inicio
  static InicioBloc inicio(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.inicioBloc;
  }

  //Descubre
  static CategoriasBloc categorias(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.categoriasBloc;
  }

  //Licenciatarios
  static LicenciatariosBloc negocio(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.licenciatariosBloc;
  }
}
