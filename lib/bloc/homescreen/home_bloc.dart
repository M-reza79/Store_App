import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/homescreen/home_event.dart';
import 'package:store_app/bloc/homescreen/home_state.dart';
import 'package:store_app/data/repository/banner_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/di/di.dart';

//میتونستم یه ایونت بدم  با دوتا استیت
class HomeBloc
    extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository =
      locator.get();
  final ICategoryRepository
  _categoryRepository = locator.get();

  HomeBloc() : super(IHomeState()) {
    on<HomeRequestGetInitilzeDataEvent>((
      event,
      emit,
    ) async {
      emit(HomeLodingState());
      final responseBannerHome =
          await _bannerRepository
              .getBannersR();
      final responseCategoryHome =
          await _categoryRepository
              .getCategories();

      emit(
        HomeResponseState(
          responseBannerHome,
          responseCategoryHome,
        ),
      );
    });

    // on<HomeRequestCategoryEvent>((
    //   event,
    //   emit,
    // ) async {
    //   emit(HomeLodingState());
    //   final responseCategoryHome =
    //       await _categoryRepository
    //           .getCategories();
    //   emit(
    //     HomeCategoryResponseState(
    //       responseCategoryHome,
    //     ),
    //   );
    // });
  }
}
