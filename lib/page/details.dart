import 'package:flutter/material.dart';
import 'package:contact/models/contact.dart';

class DetailsScreen extends StatelessWidget {
  final ContactModel contact;

  DetailsScreen(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact.name}'),
            Text('Phone numbers: ${contact.phone}'),
            Text('Note: ${contact.note}'),
          ],
        ),
      ),
    );
  }
}
