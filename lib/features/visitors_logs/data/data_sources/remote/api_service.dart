import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kf_ess_mobile_app/core/services/device_service.dart';
import 'package:kf_ess_mobile_app/features/firebase/firebase_service.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/dropdown_model.dart';

Future<List<Item>> fetchItems() async {
  final response = await http.get(
      Uri.parse(
          "https://mpwpayment.diyarme.com/ESSAPI/api/VisitorsLog/GetHosts?date=22"),
      headers: {
        "Accept-Language": LocalData.getLangCode() == "ar" ? "ar-KW" : "en-US",
        "Location":
            "EssPortal", //TODO: //Platform.isAndroid ? "CustomerAndroidApp" : "CustomerIOSApp",
        "DeviceIdentifier": FirebaseMessagingService().token ?? '111111',
        "SessionIdentifier": DeviceService().getDeviceId() ?? '111111',
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
        "Authorization": "Bearer ${LocalData.getUser()?.tokenInfo.token}",
      });

  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    List data = body['data'];
    return data.map((json) => Item.fromJson(json)).toList();
  } else if (response.statusCode == 401) {
    throw Exception('status error 401');
  } else if (response.statusCode == 404) {
    throw Exception('404');
  } else {
    throw Exception('Failed to load items');
  }
}
