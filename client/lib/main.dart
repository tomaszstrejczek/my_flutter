import 'package:flutter/material.dart';

import 'package:flutter_simple_dependency_injection/injector.dart';

import 'ent/app.dart';
import 'ent/home.dart';
import 'ent/vacation/vacation.dart';
import 'ent/inject.dart';

void main() {
  initInjector();
  var injector = Injector.getInjector();

  return runApp(MyApp(
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => injector.get<MyHomePage>(),
      '/vacation': (BuildContext context) => injector.get<VacationPage>()
    },
  ));
}
