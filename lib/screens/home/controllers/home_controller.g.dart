// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<Map<DateTime, List<Denuncia>>> _$denunciasAgroupedComputed;

  @override
  Map<DateTime, List<Denuncia>> get denunciasAgrouped =>
      (_$denunciasAgroupedComputed ??= Computed<Map<DateTime, List<Denuncia>>>(
              () => super.denunciasAgrouped))
          .value;

  final _$_denunciasAtom = Atom(name: '_HomeControllerBase._denuncias');

  @override
  ObservableList<Denuncia> get _denuncias {
    _$_denunciasAtom.context.enforceReadPolicy(_$_denunciasAtom);
    _$_denunciasAtom.reportObserved();
    return super._denuncias;
  }

  @override
  set _denuncias(ObservableList<Denuncia> value) {
    _$_denunciasAtom.context.conditionallyRunInAction(() {
      super._denuncias = value;
      _$_denunciasAtom.reportChanged();
    }, _$_denunciasAtom, name: '${_$_denunciasAtom.name}_set');
  }

  final _$stateLoadDenunciasAtom =
      Atom(name: '_HomeControllerBase.stateLoadDenuncias');

  @override
  RequestState get stateLoadDenuncias {
    _$stateLoadDenunciasAtom.context
        .enforceReadPolicy(_$stateLoadDenunciasAtom);
    _$stateLoadDenunciasAtom.reportObserved();
    return super.stateLoadDenuncias;
  }

  @override
  set stateLoadDenuncias(RequestState value) {
    _$stateLoadDenunciasAtom.context.conditionallyRunInAction(() {
      super.stateLoadDenuncias = value;
      _$stateLoadDenunciasAtom.reportChanged();
    }, _$stateLoadDenunciasAtom, name: '${_$stateLoadDenunciasAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic initialize() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.initialize();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'stateLoadDenuncias: ${stateLoadDenuncias.toString()},denunciasAgrouped: ${denunciasAgrouped.toString()}';
    return '{$string}';
  }
}
