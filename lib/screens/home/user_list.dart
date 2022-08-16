import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/models/Question.dart';
import 'package:mb_school/models/cours.dart';
import 'package:mb_school/models/user.dart';
import 'package:mb_school/screens/home/homeScreens/cards/question_card.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Object> _historyList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gestUserQuestionsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("past questions"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _historyList.length,
            itemBuilder: (context, index){
            return QuestionCard(question: _historyList[index] as Question);
            }),
      ),
    );
  }

  Future gestUserQuestionsList() async {
    final uid = "1tKUog9ki8sIjxgQfRgq";
    var data = await FirebaseFirestore.instance
        .collection('hasard')
        .doc(uid)
        .collection('questions')
        .orderBy('createdAt', descending: true)
        .get();
    setState(() {
      _historyList = List.from(data.docs.map((doc) => Question.fromSnapshot(doc)));
    });
  }
}
