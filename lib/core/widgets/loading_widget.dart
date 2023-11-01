import 'package:micro_tech_movies/core/constants/assets_refs.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            gif_loading,
            width: 80,
          ),
          const Text('Loading...'),
        ],
      ),
    );
  }
}