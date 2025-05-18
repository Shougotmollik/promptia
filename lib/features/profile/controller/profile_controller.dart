import 'package:get/get.dart';
import 'package:prompita/api/auth_api.dart';
import 'package:prompita/api/prompts_api.dart';
import 'package:prompita/common/model/prompt_model.dart';
import 'package:prompita/services/auth_service.dart';
import 'package:prompita/services/supabase_services.dart';

class ProfileController extends GetxController {
  late final AuthService authService;
  late final AuthApi authApi;
  late final PromptsApi promptsApi;
  RxBool isLoading = false.obs;

  RxList<PromptModel> prompts = [PromptModel()].obs;
  RxBool noDataFound = false.obs;

  final userName = ''.obs;
  final userEmail = ''.obs;

  @override
  void onInit() {
    authService = AuthService(SupabaseServices.supabase);
    authApi = AuthApi(SupabaseServices.supabase);
    userName.value = authService.userName();
    userEmail.value = authService.userEmail() ?? '';
    promptsApi = PromptsApi(SupabaseServices.supabase);
    fetchUserPrompts();
    super.onInit();
  }

//   Fetch user Prompts
  void fetchUserPrompts() async {
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

//   LogOut
  void logout() async {
    isLoading.value = true;
    await authApi.logout();
    isLoading.value = false;
  }

  //   to delete prompts
  void deletePrompt(PromptModel promptModel) async {
    await promptsApi.deletePrompt(promptModel.id!);
  }
}
