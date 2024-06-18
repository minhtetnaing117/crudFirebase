import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService{
  // get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  
  
  // create : add a new note
Future<void> addNote(String note){
  return notes.add(
      {
        'note': note,
        'timestamp': Timestamp.now(),
      }
  );
}
}