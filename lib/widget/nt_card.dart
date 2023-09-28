import 'package:flutter/material.dart';
import 'package:noteproject/widget/nt_view.dart';

import 'package:noteproject/blueprint/note_blueprint.dart';

class NtCard extends StatelessWidget {
  const NtCard({
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NtView(
                  note: note,
                  i: i,
                  onDeleteNote: onDeleteNote,
                )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(fontSize: 20, fontFamily: 'MartianMono'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.body,
                style: const TextStyle(fontSize: 20, fontFamily: 'MartianMono'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.currentTime,
                style: const TextStyle(fontSize: 16, fontFamily: 'MartianMono'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
