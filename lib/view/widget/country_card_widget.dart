import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String id;
  final String cid;
  final String name;
  const CountryCard({
    Key key,
    @required this.id,
    @required this.cid,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.blueAccent[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: .1,
            color: Colors.black,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Text(cid),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 21),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(id),
            ],
          )),
    );
  }
}
