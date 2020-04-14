// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_denuncia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewDenunciaController on _NewDenunciaControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$denunciaAtom = Atom(name: '_NewDenunciaControllerBase.denuncia');

  @override
  Denuncia get denuncia {
    _$denunciaAtom.context.enforceReadPolicy(_$denunciaAtom);
    _$denunciaAtom.reportObserved();
    return super.denuncia;
  }

  @override
  set denuncia(Denuncia value) {
    _$denunciaAtom.context.conditionallyRunInAction(() {
      super.denuncia = value;
      _$denunciaAtom.reportChanged();
    }, _$denunciaAtom, name: '${_$denunciaAtom.name}_set');
  }

  final _$stateSaveAtom = Atom(name: '_NewDenunciaControllerBase.stateSave');

  @override
  RequestState get stateSave {
    _$stateSaveAtom.context.enforceReadPolicy(_$stateSaveAtom);
    _$stateSaveAtom.reportObserved();
    return super.stateSave;
  }

  @override
  set stateSave(RequestState value) {
    _$stateSaveAtom.context.conditionallyRunInAction(() {
      super.stateSave = value;
      _$stateSaveAtom.reportChanged();
    }, _$stateSaveAtom, name: '${_$stateSaveAtom.name}_set');
  }

  final _$saveDenunciaAsyncAction = AsyncAction('saveDenuncia');

  @override
  Future saveDenuncia({List<File> images}) {
    return _$saveDenunciaAsyncAction
        .run(() => super.saveDenuncia(images: images));
  }

  final _$_NewDenunciaControllerBaseActionController =
      ActionController(name: '_NewDenunciaControllerBase');

  @override
  dynamic setTitle(String title) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setTitle(title);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAddress(String address) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setAddress(address);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setDescription(description);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEvent(String event) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setEvent(event);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(DateTime date) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setDate(date);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImagesUrls(List<String> urls) {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.setImagesUrls(urls);
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initialize() {
    final _$actionInfo =
        _$_NewDenunciaControllerBaseActionController.startAction();
    try {
      return super.initialize();
    } finally {
      _$_NewDenunciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'denuncia: ${denuncia.toString()},stateSave: ${stateSave.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
