import 'package:covid_alert/shared/enums/request_state_enum.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Denuncia> _denuncias = ObservableList<Denuncia>();

  @observable
  RequestState stateLoadDenuncias;

  List<Denuncia> get listaDenuncias => _denuncias.toList();

  @computed
  Map<DateTime, List<Denuncia>> get denunciasAgrouped {
    final Map<DateTime, List<Denuncia>> _result =
        Map<DateTime, List<Denuncia>>();
    _denuncias.forEach((Denuncia d) {
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

  /// Function for testing with simulated data
  @action
  initialize() {
    stateLoadDenuncias = RequestState.LOADING;
    final temp = List.generate(
            5,
            (index) => Denuncia.fromJson({
                  "dateTime": 1586720580000000,
                  "address": "Rua do Bobo nº 123",
                  "imagesUrls": [],
                  "event": "Festa"
                })) +
        List.generate(
            5,
            (index) => Denuncia.fromJson({
                  "dateTime": 1586630580000000,
                  "address": "Rua do Bobo nº 456",
                  "imagesUrls": [],
                  "event": "Fila"
                })) +
        List.generate(
            5,
            (index) => Denuncia.fromJson({
                  "dateTime": 1586792580000000,
                  "address": "Rua do Bobo nº 789",
                  "imagesUrls": [],
                  "event": "Reunião"
                }));
    _denuncias = temp.asObservable();
    stateLoadDenuncias = RequestState.SUCCESS;
  }
}
