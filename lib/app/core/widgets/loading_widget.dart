import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Loading",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ).paddingSymmetric(horizontal: 20.0),
        ],
      ),
    );
  }
}
