import 'package:flutter_simple_dependency_injection/injector.dart';
import 'vacation/model.dart';
import "vacation/vacation.dart";
import "home.dart";

void initInjector() {
  final injector = Injector.getInjector();

  injector.map<IVacationDataProvider>((i) => new TestVacationDataProvider());
  injector.map<VacationPage>(
      (i) => new VacationPage(dataProvider: i.get<IVacationDataProvider>()));
  injector.map<MyHomePage>((i) => new MyHomePage());
}
