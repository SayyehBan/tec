import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tec/controller/file_controller.dart';

FilePickerController _filePickerController = Get.put(FilePickerController());
Future pickFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  _filePickerController.file.value = result!.files.first;
}
