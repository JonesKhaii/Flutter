import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ContactModel {
  String name;
  String phone;
  String note;

  ContactModel({
    required this.name,
    required this.phone,
    required this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'note': note,
    };
  }

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      phone: json['phone'],
      note: json['note'],
    );
  }
}

Future<List<ContactModel>> loadContacts() async {
  try {
    final file = File('${(await getApplicationDocumentsDirectory()).path}/contacts.json');
    if (file.existsSync()) {
      final jsonString = await file.readAsString();
      final List<dynamic> jsonList = json.decode(jsonString);
      List<ContactModel> contacts = jsonList.map((item) => ContactModel.fromJson(item)).toList();
      return contacts;
    } else {
      print('Contacts file does not exist.');
    }
  } catch (e) {
    print('Error loading contacts: $e');
  }
  return [];
}

Future<void> saveContacts(List<ContactModel> contacts) async {
  try {
    final file = File('${(await getApplicationDocumentsDirectory()).path}/contacts.json');
    final jsonString = json.encode(contacts.map((contact) => contact.toJson()).toList());
    await file.writeAsString(jsonString);
    print('Contacts saved successfully.');
  } catch (e) {
    print('Error saving contacts: $e');
  }
}
