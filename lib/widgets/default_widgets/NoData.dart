import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class NoData extends StatelessWidget {
  String ImageLink;
  String title;
  String subtitle;

  NoData({
    super.key,
    this.ImageLink: "assets/images/404yet.png",
    this.title = "Whoops !!! Something wrong",
    this.subtitle = "We are sorry but due to some reason 404 Error Occured",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 35, left: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image(image: AssetImage(ImageLink)),
          ),
          BigText(
            text: title,
            color: AppColors.PrimaryColor,
          ),
          const SizedBox(
            height: 15,
          ),
          SmallText(iscentre: true, text: subtitle
              //  "There is nothing in the chats, start a new Conversation to see chats here"
              )
        ],
      ),
    );
  }
}
