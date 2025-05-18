import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prompita/app.dart';
import 'package:prompita/services/supabase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase initialize
  await Get.putAsync<SupabaseServices>(() async => SupabaseServices());
  await GetStorage.init();
  runApp(const PromptiaApp());
}
