import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool readStatus;
  final Function onStatusChange;

  const TodoCard({
    super.key,
    required this.title,
    required this.readStatus,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Checkbox.adaptive(
            value: readStatus,
            onChanged: (value) => onStatusChange(readStatus),
          ),
        ],
      ),
    );
  }
}
