import 'package:flutter/material.dart';

class WatingScreen extends StatelessWidget {
  const WatingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: CircularProgressIndicator(
        color: colorScheme.tertiary,
      ),
    );
  }
}
