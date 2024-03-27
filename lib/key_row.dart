import 'package:flutter/material.dart';
import 'package:learn_intl/key.dart';

class KeyRow extends StatelessWidget {
  final List<Keye> children;

  const KeyRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700]!.withOpacity(0.3),
            offset: const Offset(20.0, -5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        children: children
            .map((key) => Expanded(
                  flex: key.spans ? 2 : 1,
                  child: key,
                ))
            .toList(),
      ),
    );
  }
}
