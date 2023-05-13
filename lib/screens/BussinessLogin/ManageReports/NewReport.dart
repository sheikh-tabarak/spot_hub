import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Reports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/ReportSubmited.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class NewReport extends StatefulWidget {
  const NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Post New Request",
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          //  width:,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // BigText(
                //   text: 'Add new food item',
                //   color: Colors.white,
                // ),
                // Container(
                //   child: ,
                // )

                BoxedTextField(
                    TapAction: () {},
                    controller: _titleController,
                    placeholder: 'Title',
                    icon: Icons.title_outlined),

                TextField(
                  controller: _bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Enter your report",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.PrimaryColor))),
                )
                // BoxedTextField(
                //   placeholder: 'Report Content',
                //   icon: Icons.details,
                //   TapAction: () {},
                //   controller: titleController,
                // ),

                // BoxedTextField(
                //   placeholder: 'Category',
                //   icon: Icons.category,
                //   TapAction: () {},
                //   controller: titleController,
                // ),
                // BoxedTextField(
                //   placeholder: 'Price',
                //   icon: Icons.price_check,
                //   TapAction: () {},
                //   controller: titleController,
                // ),
                // BoxedTextField(
                //   placeholder: 'Location',
                //   icon: Icons.pin_drop,
                //   TapAction: () {},
                //   controller: titleController,
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: PrimaryButton(
            TapAction: () async {
              await PostReport(_titleController.text, _bodyController.text);

              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ReportSubmitted())));
            },
            text: 'Post Request ',
            color: AppColors.PrimaryColor,
            icon: Icons.add),
      ),
    );
  }
}
