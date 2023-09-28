import 'package:flutter/material.dart';
import 'package:noteproject/blueprint/note_blueprint.dart';

class NtView extends StatelessWidget {
  const NtView({
    super.key,
    required this.note,
    required this.i,
    required this.onDeleteNote,
  });
  final Note note;
  final int i;
  final Function(int) onDeleteNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Note View',
          style: TextStyle(fontFamily: 'MartianMono'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete this note?'),
                      content:
                          Text("Note ${note.title} is going to be deleted!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onDeleteNote(i);
                            Navigator.of(context).pop();
                          },
                          child: const Text("DELETE"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("CANCEL"))
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontFamily: 'MartianMono', fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              note.body,
              style: const TextStyle(fontSize: 18, fontFamily: 'MartianMono'),
            ),
          ],
        ),
      ),
    );
  }
}
