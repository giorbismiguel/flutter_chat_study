import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;

  ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  bool _isTyped = false;

  void _handledSubmit(String text) {
    _textController.clear();

    setState(() {
      _isTyped = false;
    });

    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(microseconds: 700), vsync: this),
      name: widget.name,
    );

    setState(() {
      _messages.insert(0, message);

      var data = messageData.firstWhere((t) => t.name == widget.name);

      data.message = message.text;
    });

    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isTyped = text.length > 0;
                  });
                },
                decoration: new InputDecoration.collapsed(hintText: "Enviar mensaje"),
              ),
            ),
            new Container(
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _isTyped
                    ? () => _handledSubmit(_textController.text)
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.name),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
            )),
            new Divider(height: 1.0),
            new Container(
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;
  final AnimationController animationController;

  const ChatMessage(
      {Key? key,
      required this.text,
      required this.animationController,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      // Type of animation for the messages
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(
                  child: new Text(name[0]),
                )),
            new Expanded(
                // Fill all the available space.
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name, style: Theme.of(context).textTheme.subtitle1),
                new Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
