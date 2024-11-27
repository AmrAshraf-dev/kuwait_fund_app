import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_orders_usecase.dart';
import '../../domain/entities/orders_entity.dart';
import '../../data/models/request/orders_request_model.dart';

part 'orders_state.dart';





@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  OrdersCubit({required this.getOrdersUseCase}) : super(OrdersInitialState());

  Future<void> getOrders(
      {required OrdersRequestModel ordersModel}) async {
    emit(OrdersLoadingState());

    final CustomResponseType<BaseEntity<OrdersEntity>> eitherPackagesOrFailure =
        await getOrdersUseCase(ordersModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(OrdersErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<OrdersEntity> response) {
      emit(OrdersReadyState(response));
    });
  }
}















