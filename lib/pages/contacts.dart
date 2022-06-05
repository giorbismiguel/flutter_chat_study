import 'package:flutter/material.dart';
import 'package:flutter_chat/models/contact_model.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Seleccionar contacto"),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, i) => Column(
                children: <Widget>[
                  ListTile(
                    leading: new CircleAvatar(
                      backgroundImage: NetworkImage(contacts[i].imageUrl),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          contacts[i].name,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new Text(
                          contacts[i].device,
                          style: new TextStyle(color: Theme.of(context).accentColor),
                        )
                      ],
                    ),
                    subtitle: new Container(
                      child: new Text(contacts[i].message),
                    ),
                  ),
                  new Divider(
                    height: 10.0,
                  ),
                ],
              )),
    );
  }
}
