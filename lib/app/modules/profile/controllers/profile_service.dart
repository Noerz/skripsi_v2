import 'dart:convert';

import 'package:skripsi_v2/app/modules/profile/model/profile.dart';
import 'package:skripsi_v2/common/network/api_config.dart';
import 'package:skripsi_v2/common/network/dio_client.dart';
import 'package:skripsi_v2/di.dart';

class ProfileService {
  static Future<List<Profile>> getProfiles() async {
    final DioClient dioClient = getIt<DioClient>();
    var response = await dioClient.dio.get(ApiConfig.profile);
    if (response.statusCode == 200) {
      var responseData = response.data;
      if (responseData is List) {
        var profiles = profileFromJson(json.encode(responseData));
        return profiles;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load profiles');
    }
  }
}