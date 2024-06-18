import 'package:flutter/material.dart';
import 'package:online_database_firebase/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();
  // text controller
  final TextEditingController textController = TextEditingController();

  // open a dialog
  void openNoteBox(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            // text user input
            controller: textController,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  // add a new save
                  firestoreService.addNote(textController.text);

                  // clear the text controller
                  textController.clear();

                  // close the box
                  Navigator.pop(context);
                },
                child: Text("Add"),
            )
          ],
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
