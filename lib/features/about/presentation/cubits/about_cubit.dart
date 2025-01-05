// import 'package:bloc/bloc.dart';
// import 'package:injectable/injectable.dart';

// import "../../../../core/network/base_handling.dart";
// import '../../../../error/failure.dart';
// import "../../../shared/entity/base_entity.dart";
// import '../../domain/entities/general_information_entity.dart';
// import '../../domain/use_cases/get_about_usecase.dart';

// part 'about_state.dart';

// @injectable
// class AboutCubit extends Cubit<AboutState> {
//   final GetAboutUseCase getAboutUseCase;
//   AboutCubit({required this.getAboutUseCase}) : super(AboutInitialState()) {
//     getAbout();
//   }

//   Future<void> getAbout() async {
//     emit(AboutLoadingState());

//     final CustomResponseType<BaseEntity<List<AboutEntity>>>
//         eitherPackagesOrFailure = await getAboutUseCase();

//     eitherPackagesOrFailure.fold((Failure failure) {
//       final FailureToMassage massage = FailureToMassage();
//       emit(AboutErrorState(
//         message: massage.mapFailureToMessage(failure),
//       ));
//     }, (BaseEntity<List<AboutEntity>> response) {
//       emit(AboutReadyState(response));
//     });
//   }
// }
