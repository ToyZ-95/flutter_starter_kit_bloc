import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';
import 'package:starter_kit_bloc/models/product_model.dart';
import 'package:starter_kit_bloc/modules/home/modules/dashboard/repositories/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepository dashboardRepository;

  int currentOffset = 0;
  int perPageCount = 10;
  bool isNextPagePossible = true;

  DashboardBloc({required this.dashboardRepository})
      : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {});
    on<LoadDashboardData>(_onLoadDashboardDataEvent);
  }

  FutureOr<void> _onLoadDashboardDataEvent(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    List<ProductModel> productList = [];

    if (currentOffset == 0) {
      currentOffset = 1;
    } else {
      currentOffset = currentOffset + perPageCount;
    }

    if (state.products.isEmpty) {
      emit(LoadingDashboardDataState());
    } else {
      productList = state.products;
    }

    ApiResponse apiResponse = await dashboardRepository.fetchProducts(
        offset: currentOffset, limit: perPageCount);

    if (apiResponse.statusCode == 200) {
      if (apiResponse.data.length > 0) {
        for (var element in apiResponse.data) {
          productList.add(ProductModel.fromJson(element));
        }

        emit(DashboardDataLoadedState(products: productList));
      } else {
        isNextPagePossible = false;
        emit(DashboardDataLoadedState(products: productList));
      }
    } else {
      emit(DashboardErrorState(errorData: apiResponse));
    }
  }
}
