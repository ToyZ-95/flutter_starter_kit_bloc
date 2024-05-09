import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/product_model.dart';
import 'package:starter_kit_bloc/modules/home/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:starter_kit_bloc/modules/home/modules/dashboard/repositories/dashboard_repository.dart';
import 'package:starter_kit_bloc/modules/home/widgets/product_card.dart';
import 'package:starter_kit_bloc/utils/utils.dart';
import 'package:starter_kit_bloc/widgets/height_box.dart';
import 'package:starter_kit_bloc/widgets/paginable_listview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardBloc(dashboardRepository: DashboardRepository())
            ..add(LoadDashboardData()),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardErrorState) {
            Utils.showSnackbar(
                context: context, message: state.errorData?.data["message"]);
          }
        },
        builder: (context, state) {
          DashboardBloc dashboardBloc = context.read<DashboardBloc>();

          if (state is LoadingDashboardDataState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return PaginableListView(
            itemCount: state.products.length,
            isNextPagePossible: dashboardBloc.isNextPagePossible,
            loadMore: () async {
              dashboardBloc.add(LoadDashboardData());
            },
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                productModel: state.products[index],
              );
            },
          );

          // return ListView.separated(
          //   itemCount: state.products.length,
          //   separatorBuilder: (BuildContext context, int index) {
          //     return HeightBox(20.h);
          //   },
          //   itemBuilder: (BuildContext context, int index) {
          //     return ProductCard(
          //       productModel: state.products[index],
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
