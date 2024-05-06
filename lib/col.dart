import 'package:flutter/material.dart';
import 'package:learn_multi_ic_launcher/key.dart';

class Col extends StatelessWidget {
  final List<Keye> children;

  const Col({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700]!.withOpacity(0.3),
            offset: const Offset(-5.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: children
            .map(
              (key) => Expanded(
                flex: key.spans ? 2 : 1,
                child: key,
              ),
            )
            .toList(),
      ),
    );
  }
}
