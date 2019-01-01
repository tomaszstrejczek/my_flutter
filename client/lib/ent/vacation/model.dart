import 'package:meta/meta.dart';
import 'dart:async';

class VacationType {
  const VacationType._(
      {this.type,
      this.availableFromPreviousYears,
      this.availableForCurrentYear,
      this.usedForCurrentYear});

  @required
  final String type;

  @required
  final int availableFromPreviousYears;

  @required
  final int availableForCurrentYear;

  @required
  final int usedForCurrentYear;
}

class VacationData {
  const VacationData._({this.vacationInfos});

  @required
  final Iterable<VacationType> vacationInfos;
}

abstract class IVacationDataProvider {
  Future<Iterable<VacationType>> getVacationInfos();
}

class TestVacationDataProvider implements IVacationDataProvider {
  Future<Iterable<VacationType>> getVacationInfos() {
    var result = [
      new VacationType._(
          type: "Regular",
          availableFromPreviousYears: 0,
          availableForCurrentYear: 26,
          usedForCurrentYear: 3),
      new VacationType._(
          type: "Parent",
          availableFromPreviousYears: 0,
          availableForCurrentYear: 2,
          usedForCurrentYear: 1),
    ];

    return new Future.delayed(const Duration(milliseconds: 400), () => result);
  }
}
