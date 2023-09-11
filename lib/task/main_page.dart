import 'package:flutter/material.dart';
import 'package:hngix_task2/task/model/user_model.dart';
import 'package:hngix_task2/task/util/const.dart';

import 'widgets/description_text.dart';

class MainPage extends StatefulWidget {
  static String route = '/';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController fullnameController = TextEditingController();
    final TextEditingController slackUsernameController =
        TextEditingController();
    final TextEditingController githubHandleController =
        TextEditingController();
    final TextEditingController personalBioController = TextEditingController();

    fullnameController.text = userModel.fullname;
    slackUsernameController.text = userModel.slackUsername;
    githubHandleController.text = userModel.githubHandle;
    personalBioController.text = userModel.personalBio;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HNGi-X Task 2',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Requirement 1: Full Name
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DescriptionText(description: 'Full Name'),
                Text(
                  userModel.fullname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Requirement 2: Slack Name
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DescriptionText(description: 'Slack Username'),
                Text(
                  userModel.slackUsername,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Requirement 3: GitHub Handle
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DescriptionText(description: 'GitHub Handle'),
                Text(
                  userModel.githubHandle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Requirement 4: A brief personal bio
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DescriptionText(description: 'Brief Personal Bio'),
                Text(
                  userModel.personalBio,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit CV Details',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          onPressed: Navigator.of(context).pop,
                          icon: Icon(
                            Icons.cancel,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 5) {
                          return null;
                        } else {
                          return 'Please enter your full name';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: slackUsernameController,
                      decoration: InputDecoration(
                        labelText: 'Slack Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 5) {
                          return null;
                        } else {
                          return 'Please enter your slack username';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: githubHandleController,
                      decoration: InputDecoration(
                        labelText: 'GitHub Handle',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 5) {
                          return null;
                        } else {
                          return 'Please enter your github handle';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: personalBioController,
                      decoration: InputDecoration(
                        labelText: 'Brief Personal Bio',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 5) {
                          return null;
                        } else {
                          return 'Please enter a longer bio about yourself';
                        }
                      },
                      minLines: 5,
                      maxLines: 8,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        String fullname = fullnameController.text;
                        String slackUsername = slackUsernameController.text;
                        String githubHandle = githubHandleController.text;
                        String personalBio = personalBioController.text;

                        setState(() {
                          userModel = UserModel(
                            fullname: fullname,
                            slackUsername: slackUsername,
                            githubHandle: githubHandle,
                            personalBio: personalBio,
                          );
                        });

                        Navigator.of(context).pop();
                      },
                      autofocus: true,
                      child: Container(
                        width: 70,
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        tooltip: 'Edit CV Details...',
        child: Icon(
          Icons.edit,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
