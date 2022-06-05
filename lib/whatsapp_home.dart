import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/camera_alt.dart';
import 'package:flutter_chat/pages/status_screen.dart';
import 'package:flutter_chat/pages/calls.dart';
import 'package:flutter_chat/pages/chat_list.dart';
import 'package:flutter_chat/pages/contacts.dart';

class WhatsAppHome extends StatefulWidget {
  WhatsAppHome({Key? key}) : super(key: key);

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        
        appBar: AppBar(
          title: Text("Flutter Chat"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              Tab(text: "ESTADOS"),
              Tab(text: "LLAMADAS"),
            ],
          )
        ),
        body: TabBarView(
          children: <Widget>[
            Camera(),
            ChatList(),
            Status(),
            Calls(),
        ]),
        floatingActionButton: new FloatingActionButton(
          onPressed: (){
            var router = new MaterialPageRoute(
              builder: (BuildContext context) => new Contacts()
            );

            Navigator.of(context).push(router);
          },
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.message,
            color: Colors.white,
          ),
        ) 
      ),
    );
  }
}
