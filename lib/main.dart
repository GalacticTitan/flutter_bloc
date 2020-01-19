import 'package:bloc/bloc.dart';
import 'package:bloctest/blocs/searchbloc.dart';
import 'package:bloctest/repository/searchrepository.dart';
import 'package:bloctest/services/apifetch.dart';
import 'package:bloctest/widgets/searchview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => {

BlocSupervisor.delegate = SimpleBlocDelegate(),

runApp(MyApp(repository:SearchRepository(apiFetch: ApiFetch())))
};

class MyApp extends StatelessWidget {
  final SearchRepository repository;

  const MyApp({Key key, this.repository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<SearchBloc>(create: (BuildContext context) =>
      SearchBloc(repository),
      child: MaterialApp(
          title: 'Employee App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: new Text( "hai" ),
                elevation: 4.0,
              ),
              body: SearchView())));
}}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
