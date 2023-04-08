import 'package:flutter/material.dart';

class LoadingViewWidget extends StatelessWidget {
  const LoadingViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: ThemeData(),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
