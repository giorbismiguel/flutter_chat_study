import 'package:flutter_chat/models/chat_model.dart';

class StatusModel {
  final String imageUrl;
  final String name;
  final String time;

  StatusModel({required this.name, required this.time, required this.imageUrl});
}

List<StatusModel> status = [
  new StatusModel(
    name: messageData[0].name,
    time: "15:30",
    imageUrl: messageData[0].imageUrl,
  ),
  new StatusModel(
    name: messageData[1].name,
    time: "15:30",
    imageUrl: messageData[1].imageUrl,
  )
];
