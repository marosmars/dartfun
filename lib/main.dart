import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Calc(),
    ),
  );
}

class Calc extends StatelessWidget {
  Calc({Key key}) : super(key: key);

  WeightInput _input;
  Text _label;

  @override
  Widget build(BuildContext context) {
    _input = new WeightInput();
    _label = new Text('Starting as ${_input.toString()}');

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Calculator'),
      ),
      body: new Center(
        child: new Column(children: [_input, _label]),

      ),
      floatingActionButton: new FloatingActionButton(
        // onPressed: _update,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class WeightInput extends StatefulWidget {
  WeightInput({Key key}) : super(key: key);

  @override
  _WeightInputState createState() => new _WeightInputState();
}

/// State that corresponds to [WeightInput]
class _WeightInputState extends State<WeightInput> {
  /// Track the current input state
  InputValue _currentInput;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(_currentInput.text), // Display the text of the current input
        new Input(
          onChanged: _handleInputChange,
          value: _currentInput,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // The empty constructor for InputValue
    // will initial an InputValue with an empty string
    _currentInput = const InputValue();
  }

  /// Handle callbacks from Input, when the text is changed
  void _handleInputChange(InputValue input) {
    setState(() {
      _currentInput = input;
    });
  }
}
