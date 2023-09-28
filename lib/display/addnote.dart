import 'package:flutter/material.dart';
import 'package:noteproject/blueprint/note_blueprint.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key, required this.onAddNote});
  final Function(Note) onAddNote;
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Note',
          style: TextStyle(
            fontFamily: 'MartianMono',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
                controller: titleController,
                style: const TextStyle(fontSize: 32, fontFamily: 'MartianMono'),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(fontFamily: 'MartianMono'))),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: bodyController,
                style: const TextStyle(fontSize: 20, fontFamily: 'MartianMono'),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Body',
                    hintStyle: TextStyle(fontFamily: 'MartianMono'))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          DateTime now = DateTime.now();

          String convertedDateTime =
              "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";
          final note = Note(
            body: bodyController.text,
            title: titleController.text,
            currentTime: convertedDateTime,
          );
          widget.onAddNote(note);
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.amber[400],
        child: const Icon(
          Icons.save,
          color: Colors.black,
        ),
      ),
    );
  }
}
