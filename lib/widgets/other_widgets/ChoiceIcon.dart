import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class ChoiceIcon extends StatelessWidget {
  final ImageProvider iconImage;
  final String icontitle;
  final Function TaptoDo;
  

  ChoiceIcon({
    Key? key,
    required this.iconImage,
    required this.icontitle, required this.TaptoDo,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () => TaptoDo(),
      
      child: Column(
        children:  [
          Image(
            image:iconImage,
            width: 40,
            height: 40,
          ),
          SizedBox(height: 5,),
          SmallText(text:icontitle)
        ],
      ),
    );
  }
}
