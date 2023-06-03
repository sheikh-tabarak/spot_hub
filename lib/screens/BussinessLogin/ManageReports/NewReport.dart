import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Reports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/ReportSubmited.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class NewReport extends StatefulWidget {
  const NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();

    return _isLoading == false
        ? Scaffold(
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
                      BoxedTextField(
                          TapAction: () {},
                          controller: _titleController,
                          placeholder: 'Title',
                          icon: Icons.title_outlined),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _bodyController,

                        keyboardType: TextInputType.multiline,
                        //minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "What is the problem you are facing?",
                            prefixIcon: Icon(Icons.read_more),
                            fillColor: AppColors.lightBackgroundColor,
                            prefixIconColor: AppColors.PrimaryColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 200, 200, 200)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            //   hoverColor: AppColors.PrimaryColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.PrimaryColor),
                              borderRadius: BorderRadius.circular(05),
                            ),
                            focusColor: AppColors.PrimaryColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 80,
              child: PrimaryButton(
                  TapAction: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    await PostReport(
                        _titleController.text, _bodyController.text);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ReportSubmitted(
                                  reportTitle: _titleController.text,
                                ))));

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  text: 'Post Request ',
                  color: AppColors.PrimaryColor,
                  icon: Icons.add),
            ),
          )
        : Scaffold(
            body: Loading(message: "Sending your report"),
          );
  }
}
