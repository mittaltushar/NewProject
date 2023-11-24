class Data {

  final String entry;
  final int id;


  const Data({
    required this.entry,
    required this.id

  });

  /*factory Data.fromMap(Map<dynamic, dynamic> map) {
    return Data(
      entry: map['entry'] ?? '',
      //phoneNumber: map['phoneNumber'] ?? '',
    );
  }*/
}