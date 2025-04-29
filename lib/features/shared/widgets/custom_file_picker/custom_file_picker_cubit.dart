import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'custom_file_picker_state.dart';

@injectable
class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerInitialState());
  static const maxSizeInBytes = 1048576; // 1MB

  Future<void> pickFile({
    FileType filetype = FileType.custom,
    List<String>? allowedExtensions ,
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
        emit(FilePickerErrorState(message: 'file_size_exceeds_1MB_limit'));
      } else {
        emit(FilePickerReadyState(files));
      }
    } else {
      emit(FilePickerInitialState());
    }
  }

  Future<void> pickCamera({
    FileType filetype = FileType.custom,
    List<String> allowedExtensions = const <String>['jpg', 'png'],
    bool allowMultiple = false,
  }) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final fileSize = await pickedImage.length();
      if (fileSize > maxSizeInBytes) { 
        emit(FilePickerErrorState(message: 'file_size_exceeds_1MB_limit'));
      } else {
        emit(FilePickerReadyState([pickedImage]));
      }
    } else {
      emit(FilePickerInitialState());
    }
  }

  void clear() {
    emit(FilePickerInitialState());
  }
}
