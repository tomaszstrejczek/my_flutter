import 'package:flutter/material.dart';

import 'ent/app.dart';
import 'ent/home.dart';
import 'ent/vacation.dart';

void main() => runApp(MyApp(
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(),
        '/vacation': (BuildContext context) => new VacationPage()
      },
    ));
