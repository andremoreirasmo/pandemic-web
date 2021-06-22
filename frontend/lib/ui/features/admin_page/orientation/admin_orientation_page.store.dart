import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/repositories/api_repository.dart';
import 'package:pandemicweb/core/models/orientation.model.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/functions.dart';

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
    var response = await _apiRepository.createOrientation(title, description);
    if (response == null) {
      Functions.showCustomFlushBar(
            'Erro ao criar!',
            ColorsModel.red);
    } else {
       Functions.showCustomFlushBar(
            'Cadastrada com sucesso',
            ColorsModel.greenAccent);
    }
    isBtnCreateLoading = false;
  }

    @action
    deleteOrientation(id) async {
      isFetchLoading = true;
      await _apiRepository.deleteOrientation(id).then((value) {
      if (value) {
        fetch();
        Functions.showCustomFlushBar(
            'A orientação foi removida!',
            ColorsModel.greenAccent);
      } else {
        Functions.showCustomFlushBar('Algum erro ocorreu', ColorsModel.red);
      }
    });
    isFetchLoading= false;
    }
  
}
