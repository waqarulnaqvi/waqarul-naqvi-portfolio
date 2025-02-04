import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';


class DrawerTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const DrawerTile({ required this.icon, required this.title,
    required this.onTap,
    super.key});

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  bool _isHover=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHighlightChanged: (value){
        setState(() {
          _isHover= !_isHover;
        });
      },
      child: Container(
        color: _isHover? CustomColor.yellowSecondary.withOpacity(0.4):Colors.transparent ,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(widget.icon,color: _isHover?Colors.white:Colors.black,),
            const SizedBox(width: 15),
            Flexible(child: FittedBox(
              child: Text(widget.title,
                style: TextStyle(
                  fontSize: 14,
                  color: _isHover?Colors.white:Colors.black,
              ),
            ))
        ),
        ],
      ),
    ),
    );
  }
}
