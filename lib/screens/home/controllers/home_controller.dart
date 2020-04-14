import 'package:covid_alert/shared/enums/request_state_enum.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:covid_alert/shared/service/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _repository = GetIt.I.get<Repository>();

  @observable
  ObservableStream<List<Denuncia>> denuncias;

  @observable
  RequestState stateLoadDenuncias;

  @computed
  List<Denuncia> get listaDenuncias => denuncias.hasError ? [] : denuncias.data;

  @computed
  Map<DateTime, List<Denuncia>> get denunciasAgrouped {
    final Map<DateTime, List<Denuncia>> _result =
        Map<DateTime, List<Denuncia>>();

    if (listaDenuncias == null || listaDenuncias.isEmpty) return _result;

    listaDenuncias.forEach((Denuncia d) {
      DateTime _atualDate =
          DateTime(d.dateTime.year, d.dateTime.month, d.dateTime.day);

      if (_result.containsKey(_atualDate)) {
        _result[_atualDate].add(d);
      } else {
        _result[_atualDate] = <Denuncia>[d];
      }
    });

    final sortedKeys = _result.keys.toList()..sort();
    final Map<DateTime, List<Denuncia>> _sortedMap =
        Map<DateTime, List<Denuncia>>();

    sortedKeys.reversed.forEach((key) {
      _sortedMap[key] = _result[key]
        ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });

    return _sortedMap;
  }

  @action
  initialize() {
    denuncias = _repository.getDenuncias().asObservable();
  }

  @action
  insertDenuncia(Denuncia denuncia) {}
}
