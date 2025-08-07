import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: isDarkMode ? Colors.black : Colors.grey.shade500,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            blurRadius: 13,
            color:
                isDarkMode
                    ? const Color.fromARGB(255, 55, 55, 55)
                    : Colors.white,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
