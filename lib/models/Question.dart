class Question {
  String? query;
  String? aswer;
  String? createdAt;

  Question();
  Map<String, dynamic> toJson() => {'query' : query, 'aswer' : aswer, 'createdAt' : createdAt};

  Question.fromSnapshot(snapshot)
  : query = snapshot.data()['query'],
    aswer = snapshot.data()['aswer'],
    createdAt = snapshot.data()['createdAt'].toDate().toString();
}