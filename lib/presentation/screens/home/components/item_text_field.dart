import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
    required this.textEditingController,
    required this.isReadOnly,
  });
  final bool isReadOnly;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: isReadOnly,
              controller: textEditingController,
            ),
          ),
          IconButton(
            onPressed: () {
              textEditingController.text = '';
            },
            icon: const Icon(Icons.delete_outlined),
          ),
        ],
      ),
    );
  }
}
