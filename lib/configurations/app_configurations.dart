import 'package:starter_kit_bloc/constants/api_endpoints.dart';
import 'package:starter_kit_bloc/constants/assets.dart';
import 'package:starter_kit_bloc/constants/colors.dart';
import 'package:starter_kit_bloc/constants/con_headers.dart';
import 'package:starter_kit_bloc/managers/network_manager/network_manager.dart';
import 'package:starter_kit_bloc/managers/storage_manager/storage_magager.dart';

late IApiEndPoints apiEndPoints;
late IStorageManager storageManager;
late IAppAssetsConstants assetsConstants;
late IColorsConstants colorsConstants;
late NetworkManager networkManager;
late IAppHeaders? iAppHeaders;

Future<void> initialBaseSetup() async {
  storageManager = IStorageManager.getInstance();
  await storageManager.init();
  assetsConstants = IAppAssetsConstants.getInstance();
  apiEndPoints = IApiEndPoints.getInstance();
  colorsConstants = IColorsConstants.getInstance();
  networkManager = NetworkManager();
  iAppHeaders = AppHeaders();
  // await sharedPreferences.loadData(config);
}
