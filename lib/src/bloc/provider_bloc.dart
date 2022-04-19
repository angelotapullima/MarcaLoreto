
import 'package:flutter/material.dart';
import 'package:marca_loreto/src/bloc/bottom_navigation_bloc.dart'; 

//singleton para obtner una unica instancia del Bloc
class ProviderBloc extends InheritedWidget {
  final bottomNaviBloc = BottomNaviBloc();  

  ProviderBloc({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BottomNaviBloc bottom(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.bottomNaviBloc;
  }
 
}
