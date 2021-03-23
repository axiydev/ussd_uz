import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin MyMixin{
  showSim(BuildContext context,{String? text,String? text1}){
    showDialog(
      context:context,
      builder:(context)=>SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        children: [
          ListTile(
            isThreeLine: false,
            leading: Text("${text}"),
          ),
          ListTile(
            isThreeLine: false,
            leading: Text('${text1}'),
          ),
        ],
      )
    );
}
}