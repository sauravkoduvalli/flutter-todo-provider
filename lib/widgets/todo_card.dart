import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool readStatus;
  final Function(bool) onStatusChange;
  final Function()? onTodoTap;
  const TodoCard({
    super.key,
    required this.title,
    required this.readStatus,
    required this.onStatusChange,
    required this.onTodoTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTodoTap,
      child: Container(
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
              onChanged: (value) => onStatusChange,
            ),
          ],
        ),
      ),
    );
  }
}
