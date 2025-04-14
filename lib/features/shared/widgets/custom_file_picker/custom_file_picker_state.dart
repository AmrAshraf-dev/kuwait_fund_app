part of 'custom_file_picker_cubit.dart';

abstract class FilePickerState {}

final class FilePickerInitialState extends FilePickerState {}

final class FilePickerLoadingState extends FilePickerState {}

final class FilePickerEmptyState extends FilePickerState {}

final class FilePickerReadyState extends FilePickerState {
  List<XFile> xFile;
  FilePickerReadyState(this.xFile);
}

class FilePickerErrorState extends FilePickerState {
  final String message;

  FilePickerErrorState({required this.message});
}
