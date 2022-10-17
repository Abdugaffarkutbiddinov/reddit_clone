import 'package:flutter/material.dart';

const DEFAULT_MESSAGE = 'Something went wrong';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget([this.message]);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? DEFAULT_MESSAGE,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
