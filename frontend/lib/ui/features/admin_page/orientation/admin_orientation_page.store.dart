
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/repositories/orientation_repository.dart';

part 'admin_orientation_page.store.g.dart';

class AdminOrientationPageStore = _AdminOrientationPageStoreBase
    with _$AdminOrientationPageStore;

abstract class _AdminOrientationPageStoreBase with Store {

  OrientationRepository _orientationRepository = OrientationRepository();

  @observable
  PickedFile image;

  @observable 
  bool isLoading = false;


  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String responseMessage = '';

   @observable
  bool  error = false;

  @observable
  List <Orientation>

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }


  @action
  fetch() async { 
    orientations = await _orientationRepository.getOrientations();
  }

  @action 
  create() async { 
    isLoading = true;
    responseMessage = '';
    var response = await  _orientationRepository.createOrientation(title, description);
    if(response == null) {
      error = true;
      responseMessage = 'Erro ao criar orientação';
    } else { 
      responseMessage = 'Sucesso ao criar orientação';
      error = false;
    }
    isLoading = false;
  }




  @action
  pickImage() async {
     image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

  }
}
