import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class StarsCard extends StatelessWidget {
  const StarsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
          Row(
          children: [
         
            Wrap(
              children: List.generate(
                  5,
                  //OverallRating.floor()
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.PrimaryColor,
                        size: 17,
                      )),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: ' 5 Stars (73)'),
          ],
        ),
         const SizedBox(height: 5,),
         Row(
          children: [
     
            Stack(
              children: [

                Wrap(
                children: List.generate(
                    5,
                    //OverallRating.floor()
                    (index) => const Icon(
                          Icons.star,
                          color:Color.fromARGB(255, 244, 206, 149),
                          size: 17,
                        )),
              ),
              Wrap(
                children: List.generate(
                    4,
                    //OverallRating.floor()
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.PrimaryColor,
                          size: 17,
                        )),
              ),
              ],
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: ' 4 Stars (98)'),
          ],
        ),
         const SizedBox(height: 5,),
         Row(
          children: [
            Stack(
              children: [
                Wrap(
                children: List.generate(
                    5,
                    //OverallRating.floor()
                    (index) => const Icon(
                          Icons.star,
                          color:Color.fromARGB(255, 244, 206, 149),
                          size: 17,
                        )),
              ),
              Wrap(
                children: List.generate(
                    3,
                    //OverallRating.floor()
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.PrimaryColor,
                          size: 17,
                        )),
              ),
              ],
            ),
              SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: ' 3 Stars (160)'),
           
          ],
        ),
         const SizedBox(height: 5,),
         Row(
          children: [
           
            Stack(
              children: [

                Wrap(
                children: List.generate(
                    5,
                    //OverallRating.floor()
                    (index) =>const Icon(
                          Icons.star,
                          color:Color.fromARGB(255, 244, 206, 149),
                          size: 17,
                        )),
              ),
              Wrap(
                children: List.generate(
                    2,
                    //OverallRating.floor()
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.PrimaryColor,
                          size: 17,
                        )),
              ),
              ],
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: ' 2 Stars (16)'),
          

          ],
        ),
         const SizedBox(height: 5,),
         Row(
          children: [
            
            
            Stack(
              children: [

                Wrap(
                children: List.generate(
                    5,
                    //OverallRating.floor()
                    (index) => const Icon(
                          Icons.star,
                          color:Color.fromARGB(255, 244, 206, 149),
                          size: 17,
                        )),
              ),
              Wrap(
                children: List.generate(
                    1,
                    //OverallRating.floor()
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.PrimaryColor,
                          size: 17,
                        )),
              ),
              ],
            ),

          SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: ' 1 Stars (45)'),
          ],
        ),
         const SizedBox(height: 5,),
      ],
    );
  }
}