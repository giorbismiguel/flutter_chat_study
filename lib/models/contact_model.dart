class ContactModel {
  final String name;
  final String imageUrl;
  final String message;
  final String device;

  ContactModel(
      {required this.device,
      required this.name,
      required this.imageUrl,
      required this.message});
}

List<ContactModel> contacts = [
  new ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/',
      message: 'Excelent',
      name: 'Oxana', device: 'MOBILE'),
  new ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/',
      message: 'Beatufull',
      name: 'Yaritza', device: 'TABLET'),
  new ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/',
      message: 'Excited',
      name: 'Barbara', device: 'DESKTOP'),
];
