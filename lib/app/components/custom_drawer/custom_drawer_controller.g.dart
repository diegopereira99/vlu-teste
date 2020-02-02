// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_drawer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomDrawerController on _CustomDrawerBase, Store {
  final _$teamsListAtom = Atom(name: '_CustomDrawerBase.teamsList');

  @override
  ObservableList<String> get teamsList {
    _$teamsListAtom.context.enforceReadPolicy(_$teamsListAtom);
    _$teamsListAtom.reportObserved();
    return super.teamsList;
  }

  @override
  set teamsList(ObservableList<String> value) {
    _$teamsListAtom.context.conditionallyRunInAction(() {
      super.teamsList = value;
      _$teamsListAtom.reportChanged();
    }, _$teamsListAtom, name: '${_$teamsListAtom.name}_set');
  }

  final _$removeTeamAsyncAction = AsyncAction('removeTeam');

  @override
  Future removeTeam(dynamic id) {
    return _$removeTeamAsyncAction.run(() => super.removeTeam(id));
  }

  final _$addTeamAsyncAction = AsyncAction('addTeam');

  @override
  Future addTeam(dynamic id) {
    return _$addTeamAsyncAction.run(() => super.addTeam(id));
  }
}
