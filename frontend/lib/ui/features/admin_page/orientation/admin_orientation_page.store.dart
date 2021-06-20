import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'admin_orientation_page.store.g.dart';

class AdminOrientationPageStore = _AdminOrientationPageStoreBase
    with _$AdminOrientationPageStore;

abstract class _AdminOrientationPageStoreBase with Store {
  @observable
  PickedFile image;

  @action
  pickImage() async {
    image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  }
}
