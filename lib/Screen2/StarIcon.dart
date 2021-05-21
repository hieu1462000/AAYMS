import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStar extends StatefulWidget {
  @override
  _CustomStarState createState() => _CustomStarState();
}

class _CustomStarState extends State<CustomStar> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: InkWell(
          onTap: (){
            setState(() {
              _value = !_value;
            });
          },
          child: _value
              ?Icon(Icons.star_border_purple500_sharp,color: Colors.black,)
              :Icon(Icons.star,color: Colors.red,),
        )
    );
  }
}