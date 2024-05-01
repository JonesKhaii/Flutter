import 'package:flutter/material.dart';
import 'package:contact/models/contact.dart';
import 'package:contact/models/contact.dart';


class AddNewScreen extends StatefulWidget {
  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone numbers'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: noteController,
              decoration: InputDecoration(labelText: 'Note'),
              maxLines: 3,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String phone = phoneController.text;
                String note = noteController.text;

                ContactModel newContact = ContactModel(
                  name: name,
                  phone: phone,
                  note: note,
                );

                saveNewContact(newContact);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void saveNewContact(ContactModel newContact) async {
    List<ContactModel> contacts = await loadContacts();
    contacts.add(newContact);
    await saveContacts(contacts);
    setState(() {

    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
