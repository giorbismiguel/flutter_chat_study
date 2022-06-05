class ChatModel {
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.imageUrl});
}

List<ChatModel> messageData = [
 new ChatModel(
      name: "Saurabh",
      message: "Hey, how are you?",
      time: "15:30",
      imageUrl: "https://randomuser.me/api/portraits/",
 ),
 new ChatModel(
      name: "Otra Saurabh",
      message: "Otra Hey, how are you?",
      time: "15:30",
      imageUrl: "https://otra_randomuser.me/api/portraits/",
 )
];
