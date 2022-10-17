import 'package:flutter/cupertino.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(
      child: Text('Empty state'),
    ));
  }
}