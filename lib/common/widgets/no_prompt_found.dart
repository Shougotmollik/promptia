import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/route/route_names.dart';

class NoPromptFound extends StatelessWidget {
  const NoPromptFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 18,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No Data Found! You haven't create one!!!"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff17202a),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                Get.toNamed(RouteNames.addPromptsScreen);
              },
              child: Text('Create a prompt'))
        ],
      ),
    );
  }
}
