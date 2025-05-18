import 'package:get/get.dart';
import 'package:prompita/api/prompts_api.dart';
import 'package:prompita/common/model/prompt_model.dart';
import 'package:prompita/services/supabase_services.dart';

class HomeController extends GetxController {
  late final PromptsApi promptsApi;
  RxList<PromptModel> prompts = [PromptModel()].obs;
  RxBool isLoading = false.obs;
  RxBool noDataFound = false.obs;

  @override
  void onInit() {
    promptsApi = PromptsApi(SupabaseServices.supabase);
    fetchPrompts();
    super.onInit();
  }

//   Fetch Data
  void fetchPrompts() async {
    isLoading.value = true;
    noDataFound.value = false;
    List<dynamic> response = await promptsApi.fetchPrompts();
    if (response.isNotEmpty) {
      prompts.value = [for (var item in response) PromptModel.fromJson(item)];
    } else {
      noDataFound.value = true;
    }
    isLoading.value = false;
  }
}
