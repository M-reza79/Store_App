import 'package:dio/dio.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IBannerData {
  Future<List<Banners>> getBannersD();
}

class BannerRemotData extends IBannerData {
  final Dio _dio = locator.get();

  @override
  Future<List<Banners>> getBannersD() async {
    try {
      var responseBanner = await _dio.get(
        'collections/banner/records',
      );
      return responseBanner.data['items']
          .map<Banners>(
            (jsonObject) =>
                Banners.fromMapJson(
                  jsonObject,
                ),
          )
          .toList();

      //
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
