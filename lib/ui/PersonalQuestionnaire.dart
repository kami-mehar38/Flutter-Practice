import 'package:flutter/material.dart';

class PersonalQuestionnaire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalQuestionnaireState();
  }
}

class _PersonalQuestionnaireState extends State<PersonalQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Goals",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
