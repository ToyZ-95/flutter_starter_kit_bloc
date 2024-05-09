part of 'dashboard_bloc.dart';

class DashboardState {
  ApiResponse? errorData;
  List<ProductModel> products = [];
}

final class DashboardInitial extends DashboardState {}

final class LoadingDashboardDataState extends DashboardState {}

final class DashboardDataLoadedState extends DashboardState {
  DashboardDataLoadedState({required List<ProductModel> products}) {
    this.products = products;
  }
}

final class DashboardErrorState extends DashboardState {
  DashboardErrorState({required ApiResponse errorData}) {
    this.errorData = errorData;
  }
}
