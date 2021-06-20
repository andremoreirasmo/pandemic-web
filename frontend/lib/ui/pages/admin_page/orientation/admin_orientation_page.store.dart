import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
part 'admin_orientation_page.store.g.dart';



class AdminOrientationPageStore = _AdminOrientationPageStoreBase with _$AdminOrientationPageStore;

abstract class _AdminOrientationPageStoreBase with Store {
  
  @observable
  var image;


  @action
  pickImage() async {
    image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  }


}
