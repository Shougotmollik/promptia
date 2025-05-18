import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/common/widgets/loader_indicator.dart';
import 'package:prompita/common/widgets/no_prompt_found.dart';
import 'package:prompita/common/widgets/prompt_card.dart';
import 'package:prompita/features/auth/widgets/custom_elevated_button.dart';
import 'package:prompita/features/profile/controller/profile_controller.dart';
import 'package:prompita/route/route_names.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed(RouteNames.homeScreen);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.0,
            children: [
              Text(controller.authService.userName()),
              Text(controller.authService.userEmail()!),
              SizedBox(
                  width: 150,
                  child: Obx(
                    () => CustomElevatedButton(
                        onTap: () {
                          if (controller.isLoading.value == false) {
                            controller.logout();
                          }
                        },
                        buttonText: controller.isLoading.value
                            ? 'Loading...'
                            : 'Signed Out'),
                  )),
              SizedBox(height: 08.0),
              Obx(
                () => controller.isLoading.value
                    ? LoaderIndicator()
                    : Column(
                        children: [
                          ...[
                            if (controller.isLoading.value == false &&
                                controller.noDataFound.value == false)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.prompts.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: GestureDetector(
                                    onLongPress: () => controller.deletePrompt(
                                        controller.prompts[index]),
                                    child: PromptCard(
                                      prompt: controller.prompts[index],
                                    ),
                                  ),
                                ),
                              )
                            else
                              NoPromptFound(),
                          ],
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
