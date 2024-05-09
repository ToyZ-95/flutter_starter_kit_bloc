import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/modules/home/modules/dashboard/views/dashboard.dart';
import 'package:starter_kit_bloc/modules/home/bloc/home_screen_bloc.dart';
import 'package:starter_kit_bloc/modules/home/modules/profile/views/profile.dart';
import 'package:starter_kit_bloc/repositories/user_repository.dart';
import 'package:starter_kit_bloc/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(
        userRepository: context.read<UserRepository>(),
      )..add(HomeScreenEvent()),
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is LoadingUserProfileErrorState) {
            Utils.showSnackbar(
              context: context,
              message: state.errorData?.data["message"],
            );
          }
        },
        builder: (context, state) {
          HomeScreenBloc homeScreenBloc = context.read<HomeScreenBloc>();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Welcome"),
            ),
            body: Builder(
              builder: (context) {
                if (state is LoadingUserProfileState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return getSelectedScreen(homeScreenBloc);
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeScreenBloc.selectedNavigationBarItem.index,
              onTap: (int selectedIndex) {
                homeScreenBloc.add(
                  ChangeNavigationBarItemEvent(
                      selectedBaseScreen:
                          NavigationBarItems.values[selectedIndex]),
                );
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Dashboard",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person_2_rounded),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getSelectedScreen(HomeScreenBloc homeScreenBloc) {
    switch (homeScreenBloc.selectedNavigationBarItem) {
      case NavigationBarItems.dashboard:
        return const Dashboard();
      case NavigationBarItems.profile:
        return const Profile();
      default:
        return const Dashboard();
    }
  }
}
