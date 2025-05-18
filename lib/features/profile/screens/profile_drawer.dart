import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/features/auth/widgets/custom_elevated_button.dart';
import 'package:prompita/features/profile/controller/profile_controller.dart';
import 'package:prompita/route/route_names.dart';

class ProfileDrawer extends StatelessWidget {
  ProfileDrawer({super.key});

  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            CircleAvatar(
              minRadius: 50,
              backgroundColor: Colors.grey.shade400,
            ),
            const SizedBox(height: 8),
            Obx(() => Text(
                  _controller.userName.value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Obx(() => Text(
                  _controller.userEmail.value,
                  style: const TextStyle(fontSize: 14),
                )),
            const Divider(color: Colors.grey, thickness: 1),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff17202a),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(RouteNames.profileScreen);
                      },
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        'My Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              onTap: () {
                if (_controller.isLoading.value == false) {
                  _controller.logout();
                }
              },
              buttonText: 'Sign Out',
            ),
          ],
        ),
      ),
    );
  }
}
