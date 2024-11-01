import 'package:image_picker/image_picker.dart';

extension ImagePickerExt on ImagePicker {
  Future<XFile?> pickImage({required ImageSource source}) async {
    final image = await pickImage(source: source);
    return image != null ? XFile(image.path) : null;
  }
}
