import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/banner_data.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<Banners>>>
  getBannersR();
}

class BannerRepository
    extends IBannerRepository {
  final IBannerData _bannerData = locator
      .get();

  @override
  Future<Either<String, List<Banners>>>
  getBannersR() async {
    try {
      var responseBanner = await _bannerData
          .getBannersD();
      return right(responseBanner);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }
}
