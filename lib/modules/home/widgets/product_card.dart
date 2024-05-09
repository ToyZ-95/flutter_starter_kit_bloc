import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/product_model.dart';
import 'package:starter_kit_bloc/widgets/custom_network_image.dart';
import 'package:starter_kit_bloc/widgets/height_box.dart';
import 'package:starter_kit_bloc/widgets/width_box.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: colorsConstants.lightWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: productModel.images?.length,
            itemBuilder: (BuildContext context, int index, _) {
              if (productModel.images != null &&
                  productModel.images![index].isNotEmpty) {
                return CustomNetworkImage(
                  productModel.images![index],
                  fit: BoxFit.contain,
                  scaleWidth: double.maxFinite,
                  scaleHeight: double.maxFinite,
                );
              }
              return const SizedBox();
            },
            options: CarouselOptions(),
          ),
          HeightBox(10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title ?? "",
                  style: TextStyle(fontSize: 20.sp),
                ),
                HeightBox(10.h),
                Text(
                  "\$${productModel.price}",
                  style: TextStyle(fontSize: 16.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                HeightBox(10.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
