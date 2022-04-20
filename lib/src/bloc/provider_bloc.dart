import 'package:flutter/material.dart';
import 'package:marca_loreto/src/bloc/Inicio/inicio_bloc.dart';
import 'package:marca_loreto/src/bloc/bottom_navigation_bloc.dart';

//singleton para obtner una unica instancia del Bloc
class ProviderBloc extends InheritedWidget {
  final bottomNaviBloc = BottomNaviBloc();

  //Inicio
  final inicioBloc = InicioBloc();

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
}
