import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        mobileController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        fatherController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        dateController.text.trim().isEmpty ||
        statusController.text.trim().isEmpty ||
        religionController.text.trim().isEmpty ||
        languageController.text.trim().isEmpty ||
        qualificationController.text.trim().isEmpty ||
        experienceController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please Fill in all field')));
      return;
    }

    await firestore.collection('students').add({
      'name': nameController.text.trim(),
      'mobile': mobileController.text.trim(),
      'emailid': emailController.text.trim(),
      'father': fatherController.text.trim(),
      'gender': genderController.text.trim(),
      'date': dateController.text.trim(),
      'status': statusController.text.trim(),
      'religion': religionController.text.trim(),
      'lanuage': languageController.text.trim(),
      'qualification': qualificationController.text.trim(),
      'experience': experienceController.text.trim(),
      'address': addressController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data Saved succesfully')));

    nameController.clear();
    mobileController.clear();
    emailController.clear();
    fatherController.clear();
    genderController.clear();
    dateController.clear();
    statusController.clear();
    religionController.clear();
    languageController.clear();
    qualificationController.clear();
    experienceController.clear();
    addressController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    fatherController.dispose();
    genderController.dispose();
    dateController.dispose();
    statusController.dispose();
    religionController.dispose();
    languageController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bio Data'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Mobile No.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: fatherController,
              decoration: const InputDecoration(
                labelText: 'Fathers Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date Of Birth',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: statusController,
              decoration: InputDecoration(
                labelText: 'Marital Status',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: religionController,
              decoration: InputDecoration(
                labelText: 'Religion',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: languageController,
              decoration: InputDecoration(
                labelText: 'Languanges Known',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: qualificationController,
              decoration: InputDecoration(
                labelText: 'Qualification',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: experienceController,
              decoration: InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}