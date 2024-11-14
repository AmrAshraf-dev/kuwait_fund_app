// TabCubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  void changeTab(int index) => emit(index);
}
