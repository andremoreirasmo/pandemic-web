import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/repositories/api_repository.dart';
import 'package:pandemicweb/core/models/orientation.model.dart';

part 'admin_orientation_page.store.g.dart';

class AdminOrientationPageStore = _AdminOrientationPageStoreBase
    with _$AdminOrientationPageStore;

abstract class _AdminOrientationPageStoreBase with Store {
  ApiRepository _apiRepository = ApiRepository();


   _AdminOrientationPageStoreBase() {
    initStore();
  }


  @observable
  PickedFile image;

  @observable
  bool isBtnCreateLoading = false;

  @observable
  bool isFetchLoading = false;

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String createResponseMessage = '';

  @observable
  bool error = false;

   @observable
   List<Orientation> orientations;

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }


  @action
  initStore() {
    fetch();
  }

  @action
  fetch() async {
    
    orientations = await _apiRepository.getOrientations();
  }

  @action
  create() async {
    isBtnCreateLoading = true;
    createResponseMessage = '';
    var response = await _apiRepository.createOrientation(title, description);
    if (response == null) {
      error = true;
      createResponseMessage = 'Erro ao criar orientação';
    } else {
      createResponseMessage = 'Sucesso ao criar orientação';
      error = false;
    }
    isBtnCreateLoading = false;
  }

    @action
    delete(id)async {
      isFetchLoading = true;
       var response = await _apiRepository.deleteOrientation(id);

    }

}
