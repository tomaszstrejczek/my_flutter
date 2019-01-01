import 'package:flutter/material.dart';
import "model.dart";

class VacationPage extends StatefulWidget {
  VacationPage({Key key, this.dataProvider}) : super(key: key);

  final IVacationDataProvider dataProvider;
  @override
  _VacationPageState createState() =>
      _VacationPageState(dataProvider: dataProvider);
}

class _VacationPageState extends State<VacationPage> {
  _VacationPageState({this.dataProvider}) : super();

  final IVacationDataProvider dataProvider;
  Future<Iterable<VacationType>> vacationTypes;

  @override
  void initState() {
    vacationTypes = dataProvider.getVacationInfos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vacation"),
      ),
      body: new Center(
        child: new FutureBuilder<Iterable<VacationType>>(
            future: vacationTypes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Got ${snapshot.data.length}");
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
