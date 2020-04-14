// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Denuncia>> _$listaDenunciasComputed;

  @override
  List<Denuncia> get listaDenuncias => (_$listaDenunciasComputed ??=
          Computed<List<Denuncia>>(() => super.listaDenuncias))
      .value;
  Computed<Map<DateTime, List<Denuncia>>> _$denunciasAgroupedComputed;

  @override
  Map<DateTime, List<Denuncia>> get denunciasAgrouped =>
      (_$denunciasAgroupedComputed ??= Computed<Map<DateTime, List<Denuncia>>>(
              () => super.denunciasAgrouped))
          .value;

  final _$denunciasAtom = Atom(name: '_HomeControllerBase.denuncias');

  @override
  ObservableStream<List<Denuncia>> get denuncias {
    _$denunciasAtom.context.enforceReadPolicy(_$denunciasAtom);
    _$denunciasAtom.reportObserved();
    return super.denuncias;
  }

  @override
  set denuncias(ObservableStream<List<Denuncia>> value) {
    _$denunciasAtom.context.conditionallyRunInAction(() {
      super.denuncias = value;
      _$denunciasAtom.reportChanged();
    }, _$denunciasAtom, name: '${_$denunciasAtom.name}_set');
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
  dynamic insertDenuncia(Denuncia denuncia) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.insertDenuncia(denuncia);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'denuncias: ${denuncias.toString()},stateLoadDenuncias: ${stateLoadDenuncias.toString()},listaDenuncias: ${listaDenuncias.toString()},denunciasAgrouped: ${denunciasAgrouped.toString()}';
    return '{$string}';
  }
}
