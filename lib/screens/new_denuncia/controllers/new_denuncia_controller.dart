import 'package:mobx/mobx.dart';

import '../../../shared/models/denuncia.dart';
part 'new_denuncia_controller.g.dart';

class NewDenunciaController = _NewDenunciaControllerBase
    with _$NewDenunciaController;

abstract class _NewDenunciaControllerBase with Store {
  @observable
  Denuncia denuncia = Denuncia();

  @computed
  bool get isValid {
    if (denuncia.address != null && denuncia.address.isNotEmpty) {
      if (denuncia.event != null && denuncia.event.isNotEmpty) {
        return true;
      }
      return false;
    }
    return false;
  }

  @action
  setTitle(String title) {
    final temp = denuncia;
    temp.title = title;
    denuncia = temp;
  }

  @action
  setAddress(String address) {
    final temp = denuncia;
    temp.address = address;
    denuncia = temp;
  }

  @action
  setDescription(String description) {
    final temp = denuncia;
    temp.description = description;
    denuncia = temp;
  }

  @action
  setEvent(String event) {
    final temp = denuncia;
    temp.event = event;
    denuncia = temp;
  }

  @action
  setDate(DateTime date) {
    final temp = denuncia;
    temp.dateTime = date;
    denuncia = temp;
  }

  @action
  setImagesUrls(List<String> urls) {
    final temp = denuncia;
    temp.imagesUrls = urls;
    denuncia = temp;
  }

  @action
  initialize() {
    denuncia = Denuncia(dateTime: DateTime.now());
  }
}
