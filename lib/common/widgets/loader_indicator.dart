import 'package:flutter/material.dart';

class LoaderIndicator extends StatelessWidget {
  const LoaderIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 28.0),
        child: CircularProgressIndicator(color: Colors.black87),
      ),
    );
  }
}
