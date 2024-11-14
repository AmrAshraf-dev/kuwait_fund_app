import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_notifications_usecase.dart';
import '../../domain/entities/notifications_entity.dart';
import '../../data/models/request/notifications_request_model.dart';

part 'notifications_state.dart';





@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  NotificationsCubit({required this.getNotificationsUseCase}) : super(NotificationsInitialState());

  Future<void> getNotifications(
      {required NotificationsRequestModel notificationsModel}) async {
    emit(NotificationsLoadingState());

    final CustomResponseType<BaseEntity<NotificationsEntity>> eitherPackagesOrFailure =
        await getNotificationsUseCase(notificationsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(NotificationsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<NotificationsEntity> response) {
      emit(NotificationsReadyState(response));
    });
  }
}















