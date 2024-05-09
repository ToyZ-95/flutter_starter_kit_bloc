import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/modules/home/modules/profile/bloc/profile_bloc.dart';
import 'package:starter_kit_bloc/routers/navigation_helper.dart';
import 'package:starter_kit_bloc/widgets/height_box.dart';
import 'package:starter_kit_bloc/widgets/primary_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LoggedOutState) {
            moveToLoginScreen(context: context);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(storageManager.userModel?.name ?? ""),
                HeightBox(10.h),
                PrimaryButton(
                  onTap: () {
                    context.read<ProfileBloc>().add(LogOutEvent());
                  },
                  title: "Log Out",
                  width: 100.w,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
