import 'dart:io';

void main(List<String> arguments) {

    mnue();

  int? ch=int.parse(stdin.readLineSync()!);
   if (ch!=1 ||ch!=2 ||ch!=3||ch!=4||ch!=5){
       print(" Plese enter a vaild number!");
   }
  switch(ch){
    case 1: Create_note(); break;
    case 2:{String? title = stdin.readLineSync();
           String? content = stdin.readLineSync();
           Edit_note(title!,content!);
            break;}
    case 3:{String? title = stdin.readLineSync();
           Delete_note(title!);
            break;}
    case 4:{String? title = stdin.readLineSync();
           Search_note(title!);
            break;}
    case 5: print("Exit successfully");   break;
  }
  
}
void mnue(){
  print('Wolcome to our note app:\n 1.Create a note \n 2.Edit a note\n 3.Delete a note \n 4.Search for a note\n 5.Exit');
}
// void Create_note(){
// print("Enter the title of the note:");
//     String? title = stdin.readLineSync();
//     print("Write your note here:");
//     String? content = stdin.readLineSync();
//     Note newNote = Note(
//       title: title!,
//       content: content!,
//     );

//     Note.notes.add(newNote);
// }

 // ignore: non_constant_identifier_names
 void Create_note() {
    print("Enter the title of the note:");
    String? title = stdin.readLineSync();
    print("Write your note here:");
    String? content = stdin.readLineSync();
    Note newNote = Note(
      title: title!,
      content: content!,
    );

    Note.notes.add(newNote);
  }


// void Edit_note(String titelFromUser){
//   var title = Note.title;
//   var content = Note.content;
//   if (titelFromUser==title){
//      print("Write your new note here:");
//      Note newNote = Note(
//       title: title!,
//       content: content!,
//     );

//     Note.notes.add(newNote);

//   }else{
//     print("Note dose note found!");
//     }
//   }
  // ignore: non_constant_identifier_names
  void Edit_note(String titleFromUser, String newContent) {
  bool found = false;

  for (var note in Note.notes) {
    if (note.title == titleFromUser) {
      found = true;
      // Update the content of the note
      note.content = newContent;
      print("Note edited.");
      break; // Exit loop once the note is edited
    }
  }
  if (!found) {
    print("Note not found!");
  }
}

  // void Delete_note(String titelFromUser){
  //   var title = Note Instance.title;
  //   if (titelFromUser==title){
  //     Note.title=Null;
  //     Note.content=Null;
  //     print("Note deleted.");
  //   }else{
  //     print("Note dose note found!");
  //   }
  // }
  // ignore: non_constant_identifier_names
  void Delete_note(String titleFromUser) {
  bool found = false;

  for (int i = 0; i < Note.notes.length; i++) {
    if (Note.notes[i].title == titleFromUser) {
      found = true;
      // Remove the note from the list
      Note.notes.removeAt(i);
      print("Note deleted.");
      break; // Exit loop once the note is deleted
    }
  }

  if (!found) {
    print("Note not found!");
  }
}
  // void Search_note(String titelFromUser){
  //   var title = Note.title;
  //   for ( Note.notes <Note>) {
  //   var newContent;
  //   Note.note.editNote(title, newContent);
  //   if (titelFromUser==title){
  //     print("Note found.");
  //   }else{
  //     print("Note dose note found!");
  //   }
  //   }
  // }
  // ignore: non_constant_identifier_names
  void Search_note(String titleFromUser) {
  bool found = false;

  for (var note in Note.notes) {
    if (note.title == titleFromUser) {
      found = true;
      print("Note found. Content: ${note.content}");
      break; // Exit loop once the note is found
    }
  }

  if (!found) {
    print("Note not found!");
  }
}


class Note {
  static List<Note> notes = [];
   late String title;
   late String content;

  Note({
    required this.title,
    required this.content,
  });
}
