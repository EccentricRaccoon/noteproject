import 'package:flutter/material.dart';
import 'package:noteproject/blueprint/note_blueprint.dart';
import 'package:noteproject/display/addnote.dart';
import 'package:noteproject/widget/nt_card.dart';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({super.key});

  @override
  State<HomeDisplay> createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Notepad",
            style: TextStyle(fontFamily: 'MartianMono', color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, i) {
            return NtCard(
              note: notes[i],
              i: i,
              onDeleteNote: onDeleteNote,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNote(
                    onAddNote: onAddNote,
                  )));
        },
        backgroundColor: Colors.amber[400],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void onAddNote(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onDeleteNote(int i) {
    notes.removeAt(i);
    setState(() {});
  }
}
