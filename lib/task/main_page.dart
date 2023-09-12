import 'package:flutter/material.dart';

import 'data/db.dart';
import 'model/user_model.dart';
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
    // Controllers for handling user inputs
    final TextEditingController fullnameController = TextEditingController();
    final TextEditingController slackUsernameController =
        TextEditingController();
    final professionController = TextEditingController();
    final skillsController = TextEditingController();
    final TextEditingController githubHandleController =
        TextEditingController();
    final TextEditingController personalBioController = TextEditingController();

    // Setting the default value for the text fields.
    // To allow the user to edit what they actually want to edit without the need to
    // type all the details again.
    fullnameController.text = userModel.fullname;
    slackUsernameController.text = userModel.slackUsername;
    professionController.text = userModel.profession;
    skillsController.text = userModel.skills;
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
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // Profession
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DescriptionText(description: 'Profession'),
                  Text(
                    userModel.profession,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // Skills
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DescriptionText(description: 'Skills'),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    children: userModel.skills
                        .split(',')
                        .map(
                          (e) => Chip(
                            label: Text(e.trim()),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

      // A button that grants user editing capabilities
      floatingActionButton: FloatingActionButton(
        // Show a page that gives user editing capabilities
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
                    height: 15,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          // The text form field that enables editing "Full Name" detail
                          TextFormField(
                            controller: fullnameController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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

                          // The text form field that enables editing "Slack Username" detail
                          TextFormField(
                            controller: slackUsernameController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Slack Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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

                          // The text form field that enables editing "Profession" detail
                          TextFormField(
                            controller: professionController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Profession',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length >= 5) {
                                return null;
                              } else {
                                return 'Please enter your profession';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // The text form field that enables editing "Skills" detail
                          TextFormField(
                            controller: skillsController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Skills (separate with comma)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length >= 20) {
                                return null;
                              } else {
                                return 'Please list all your skills';
                              }
                            },
                            minLines: 2,
                            maxLines: 4,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // The text form field that enables editing "GitHub Handle" detail
                          TextFormField(
                            controller: githubHandleController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'GitHub Handle',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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

                          // The text form field that enables editing "Brief Personal Bio" detail
                          TextFormField(
                            controller: personalBioController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Brief Personal Bio',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isDense: true,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length >= 50) {
                                return null;
                              } else {
                                return 'Please provide a longer bio about yourself';
                              }
                            },
                            minLines: 5,
                            maxLines: 8,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // The save button to save the chnages made to the user CV details
                  InkWell(
                    onTap: () {
                      // Get the details from each text form fields.
                      String fullname = fullnameController.text;
                      String slackUsername = slackUsernameController.text;
                      String profession = professionController.text;
                      String skills = skillsController.text;
                      String githubHandle = githubHandleController.text;
                      String personalBio = personalBioController.text;

                      if (fullname.length < 5 ||
                          slackUsername.length < 5 ||
                          profession.length < 5 ||
                          skills.length < 20 ||
                          githubHandle.length < 5 ||
                          personalBio.length < 50) {
                        // Display a message notifying the user that their details have
                        // have not been filled properly.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please fill in all the fields properly...',
                            ),
                            dismissDirection: DismissDirection.down,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      // Call setState() to update the UI after changing the information
                      setState(() {
                        userModel = UserModel(
                          fullname: fullname,
                          slackUsername: slackUsername,
                          profession: profession,
                          skills: skills,
                          githubHandle: githubHandle,
                          personalBio: personalBio,
                        );
                      });

                      // Display a message notifying the user that their details have
                      // updated successfully
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User details updated successfully...'),
                          dismissDirection: DismissDirection.down,
                        ),
                      );

                      // Close the bottom sheet and let user view their changes
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
                ],
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
