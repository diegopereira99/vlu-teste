import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String labelText;
  final bool obscure;
  final Function(String text) onChanged;
  InputWidget({@required this.labelText, @required this.obscure, 
  @required this.onChanged});
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
              data: ThemeData(
                primaryColor: Colors.purple
              ), 
              child: TextField(
                onChanged: widget.onChanged,
                obscureText: widget.obscure,
                decoration: InputDecoration(
                  labelText: widget.labelText
                ),
              ),
            );
  }
}