import 'package:flutter/material.dart';
import 'package:text_area/text_area.dart';
import 'package:tnp_portal/widgets/custom_text_field.dart';

class AddJob extends StatelessWidget {
  const AddJob({super.key});

  @override
  Widget build(context) {
    final nameHandler = TextEditingController();
    final positionHandler = TextEditingController();
    final descriptionHandler = TextEditingController(text: 'Enter Job Description Here');

    void onSubmit() {
      final name = nameHandler.text;
      final position = positionHandler.text;
      final description = descriptionHandler.text;

      if (name.isEmpty || position.isEmpty || description.isEmpty) {
        print('Empty');
      }
      else{
        print(name);
        print(position);
        print(description);
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
              style: TextStyle(fontSize: 52),
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
            onPressed: onSubmit, 
            child: const Text('Post Job'),
          ),
        ],
      ),
    );
  }
}
