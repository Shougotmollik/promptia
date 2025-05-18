import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/common/widgets/loader_indicator.dart';
import 'package:prompita/common/widgets/no_prompt_found.dart';
import 'package:prompita/common/widgets/prompt_card.dart';
import 'package:prompita/features/home/controller/home_controller.dart';
import 'package:prompita/features/profile/screens/profile_drawer.dart';
import 'package:prompita/route/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      endDrawer: ProfileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(
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
                            child: PromptCard(
                              prompt: controller.prompts[index],
                            ),
                          ),
                        )
                      else
                        NoPromptFound(),
                    ],
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addPromptsScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Home'),
      actions: [
        Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.person_2_outlined));
        })
      ],
    );
  }
}
