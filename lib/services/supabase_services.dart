import 'package:get/get.dart';
import 'package:prompita/constants/supabase_constants.dart';
import 'package:prompita/route/route_names.dart';
import 'package:prompita/utils/storage_constants.dart';
import 'package:prompita/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices extends GetxService {
  @override
  void onInit() async {
    await Supabase.initialize(url: supabaseURL, anonKey: supabaseKEY);
    // Calling the auth listener
    listenAuthChanges();
    super.onInit();
  }

//   Supabase instance
  static final SupabaseClient supabase = Supabase.instance.client;

// To listen auth Events
  void listenAuthChanges() async {
    SupabaseServices.supabase.auth.onAuthStateChange.listen(
      (data) {
        if (data.event == AuthChangeEvent.signedIn) {
          StorageService.box.write(StorageConstants.authKey, data.session);
          Get.offNamed(RouteNames.homeScreen);
        } else if (data.event == AuthChangeEvent.signedOut) {
          StorageService.box.remove(StorageConstants.authKey);
          Get.offAllNamed(RouteNames.logInScreen);
        } else if (data.event == AuthChangeEvent.tokenRefreshed) {
          StorageService.box.remove(StorageConstants.authKey);
          Get.offAllNamed(RouteNames.logInScreen);
        }
      },
    );
  }
}
