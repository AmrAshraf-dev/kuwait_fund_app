part of 'custom_file_picker_cubit.dart';

abstract class FilePickerFamilyState {}

final class FilePickerFamilyInitialState extends FilePickerFamilyState {}

final class FilePickerFamilyLoadingState extends FilePickerFamilyState {}

final class FilePickerFamilyEmptyState extends FilePickerFamilyState {}

final class FilePickerFamilyReadyState extends FilePickerFamilyState {
  List<XFile> xFile;
  FilePickerFamilyReadyState(this.xFile);
}

class FilePickerFamilyErrorState extends FilePickerFamilyState {
  final String message;

  FilePickerFamilyErrorState({required this.message});
}
