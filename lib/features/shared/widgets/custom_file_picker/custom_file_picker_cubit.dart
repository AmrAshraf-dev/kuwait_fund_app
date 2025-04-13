import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilePickerCubit extends Cubit<List<XFile>> {
  FilePickerCubit() : super(<XFile>[]);
  static const maxSizeInBytes = 1048576; // 1MB
  Future<void> pickFile({
    FileType filetype = FileType.custom,
    List<String> allowedExtensions = const <String>['pdf'],
    bool allowMultiple = false,
  }) async {
    final FilePickerResult? pickedImage = await FilePicker.platform.pickFiles(
      type: filetype,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
    );
    await Future.delayed(Duration(milliseconds: 100));
    emit(pickedImage?.xFiles ?? <XFile>[]);
  }

  Future<void> pickCamera({
    FileType filetype = FileType.custom,
    List<String> allowedExtensions = const <String>['jpg', 'jpeg', 'png'],
    bool allowMultiple = false,
  }) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null)
      emit(<XFile>[pickedImage]);
    else
      emit(<XFile>[]);
  }
}
