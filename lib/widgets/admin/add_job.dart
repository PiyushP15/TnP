import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tnp_portal/widgets/admin/admin_layout.dart';
import 'dart:convert';
import 'package:tnp_portal/widgets/custom_text_field.dart';

class AddJob extends StatelessWidget {
  const AddJob({super.key});

  @override
  Widget build(context) {
    final nameHandler = TextEditingController();
    final positionHandler = TextEditingController();
    final descriptionHandler =
        TextEditingController(text: 'Enter Job Description Here');

    Future<void> onSubmit() async {
      final name = nameHandler.text;
      final position = positionHandler.text;
      final description = descriptionHandler.text;

      if (name.isEmpty || position.isEmpty || description.isEmpty) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Please Enter All Details'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
        return;
      } else {
        final appl = ['a'];
        final myurl = Uri.https(
            'tnp-portal-63ea2-default-rtdb.firebaseio.com', 'jobs.json');
        await http.post(myurl,
            headers: {'Cotent-Type': 'application/json'},
            body: json.encode({
              'cname': name,
              'position': position,
              'description': description,
              'applicants': appl,
            }));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Add Job',
              style: TextStyle(
                fontSize: 52,
                color: Color(0xFF96031A),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  'Company Name',
                  cont: nameHandler,
                  obscure: false,
                  keyboard: TextInputType.text,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  'Position',
                  cont: positionHandler,
                  obscure: false,
                  keyboard: TextInputType.text,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextFormField(
                controller: descriptionHandler,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 25,
                // expands: true,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onSubmit();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AdminLayout()));
            },
            child: const Text('Post Job'),
          ),
        ],
      ),
    );
  }
}
