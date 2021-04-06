import 'package:flutter/material.dart';

enum GenderList { male, female }

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _agreement = false;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new Text(
                  'Номер вашої квартири:',
                  style: TextStyle(fontSize: 20.0),
                ),
                // ignore: missing_return
                new TextFormField(validator: (value) {
                  if (value.isEmpty)
                    return 'Будь ласка, вкажіть номер квартири в якій живете';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Повне імя власника:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty)
                    return 'Будь ласка, вкажіть своє повне імя(Прізвище, імя, по-батькові)';

                  String p =
                      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Це неправильне імя, прізвище чи по- батькові';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Загальна площа квартири(м^2):',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty)
                    return 'Будь ласка вкажіть загальну площу квартири';

                  String p =
                      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Ви неправильно вказали площу квартири';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Поверх, на якому розташовується:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty)
                    return 'Будь ласка вкажіть поверх на якому знаходиться квартира';

                  String p =
                      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Ви неправильно вказали поверх, на якому розташовується квартира';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Підїзд, в якому знаходиться квартира:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty)
                    return 'Будь ласка вкажіть підїзд в якому знаходиться квартира';

                  String p =
                      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Ви неправильно вказали підїзд, в якому розташовується квартира';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Ваш рід:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new RadioListTile(
                  title: const Text('Чоловік'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                new RadioListTile(
                  title: const Text('Жінка'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                new SizedBox(height: 20.0),
                new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Color color = Colors.red;
                      String text;

                      if (_gender == null)
                        text = 'Виберіть свій рід(чол/жін)';
                      else if (_agreement == false)
                        text = 'Необхідно прийняти правила користування ОСББ';
                      else {
                        text = 'Форма успішно заповнена';
                        color = Colors.green;
                      }

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(text),
                        backgroundColor: color,
                      ));
                    }
                  },
                  child: Text('Відправити'),
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ],
            )));
  }
}

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
        appBar: new AppBar(title: new Text('ОСББ')), body: new MyForm())));
