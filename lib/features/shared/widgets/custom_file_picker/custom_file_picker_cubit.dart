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
      withData: true,
    );

    if (pickedImage != null) {
      final files = pickedImage.files
          .where((file) => file.size <= maxSizeInBytes) // Filter files by size
          .map((file) => XFile(file.path!))
          .toList();

      if (files.length != pickedImage.files.length) {
        // Emit an empty state if any file exceeds the size limit
        emit(<XFile>[]);
        throw Exception("File size exceeds 1 MB limit.");
      } else {
        emit(files);
      }
    } else {
      emit(<XFile>[]);
    }
  }

  Future<void> pickCamera({
    FileType filetype = FileType.custom,
    List<String> allowedExtensions = const <String>['jpg', 'jpeg', 'png'],
    bool allowMultiple = false,
  }) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final fileSize = await pickedImage.length();
      if (fileSize > maxSizeInBytes) {
        emit(<XFile>[]);
        throw Exception("File size exceeds 1 MB limit.");
      } else {
        emit(<XFile>[pickedImage]);
      }
    } else {
      emit(<XFile>[]);
    }
  }

  void clear() {
    emit(<XFile>[]);
  }
}
