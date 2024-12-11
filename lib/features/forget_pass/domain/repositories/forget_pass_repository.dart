import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/forget_pass_request_model.dart";

/// Data operations for the ForgetPass collection
abstract class ForgetPassRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<bool>>> getForgetPass({
    required ForgetPassRequestModel forgetPassParams,
  });

  Future<CustomResponseType<BaseEntity<bool>>> verifyOtp(
      {required ForgetPassRequestModel forgetPassParams});
  Future<CustomResponseType<BaseEntity<bool>>> changePassword(
      {required ForgetPassRequestModel forgetPassParams});
}
