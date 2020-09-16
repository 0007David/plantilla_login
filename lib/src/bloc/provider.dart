


import 'package:flutter/cupertino.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _instancia;

  final loginBloc = new LoginBloc();

  factory Provider({Key key, Widget child}) {
    if( _instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child})
    : super(key: key, child: child);

  // Provider({Key key, Widget child})
    // : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context){
    // del contexto (arbol de widget) busca un widget con el mismo tipo (provider).
    // return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}
