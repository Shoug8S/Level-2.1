import 'dart:io';

void main(List<String> arguments) {
  int? ch;
  while (ch != 5) {
    mnue();

    ch = int.parse(stdin.readLineSync()!);

    switch (ch) {
      case 1:
        Create_note();
        break;
      case 2:
        Edit_note();
        break;
      case 3:
        Delete_note();
        break;
      case 4:
        Search_note();
        break;
      case 5:
        print("Exit successfully");
        break;
      default:
        print("Please enter a valid number!");
        break;
    }
  }
}

void mnue() {
  print('Welcome to our note app:');
  print('1. Create a note');
  print('2. Edit a note');
  print('3. Delete a note');
  print('4. Search for a note');
  print('5. Exit');
}

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
  print("Note created.");
}

void Edit_note() {
  print("Enter the title of the note to edit:");
  String? title = stdin.readLineSync();
  print("Enter the new content:");
  String? content = stdin.readLineSync();

  bool found = false;
  for (var note in Note.notes) {
    if (note.title == title) {
      found = true;
      note.content = content!;
      print("Note edited.");
      break;
    }
  }
  if (!found) {
    print("Note not found!");
  }
}

void Delete_note() {
  print("Enter the title of the note to delete:");
  String? title = stdin.readLineSync();

  bool found = false;
  for (var note in Note.notes) {
    if (note.title == title) {
      found = true;
      Note.notes.remove(note);
      print("Note deleted.");
      break;
    }
  }
  if (!found) {
    print("Note not found!");
  }
}

void Search_note() {
  print("Enter the title of the note to search:");
  String? title = stdin.readLineSync();

  bool found = false;
  for (var note in Note.notes) {
    if (note.title == title) {
      found = true;
      print("Note found. Content: ${note.content}");
      break;
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
