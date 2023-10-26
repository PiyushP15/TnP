import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tnp_portal/widgets/admin/admin_layout.dart';
import 'dart:convert';
import 'package:tnp_portal/widgets/custom_text_field.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  var mca = false;
  var it = false;
  var cs = false;
  var etc = false;
  var mech = false;

  List dept = [];


  @override
  Widget build(context) {
    final nameHandler = TextEditingController();
    final positionHandler = TextEditingController();
    final descriptionHandler =
        TextEditingController(text: 'Enter Job Description Here');
    final sscHandler = TextEditingController(text: '35');
    final hscHandler = TextEditingController(text: '35');
    final ugHandler = TextEditingController(text: '35');

    Future<void> onSubmit() async {
      final name = nameHandler.text;
      final position = positionHandler.text;
      final description = descriptionHandler.text;
      final ssc = sscHandler.text;
      final hsc = hscHandler.text;
      final ug = ugHandler.text;
      

      if (name.isEmpty || position.isEmpty || description.isEmpty || ssc.isEmpty || hsc.isEmpty || ug.isEmpty || dept.isEmpty || dept.isEmpty) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
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
              'ssc_criteria':ssc,
              'hsc_criteria':hsc,
              'grad_criteria':ug,
              'departmets':dept,
            }));

          dept.clear();
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
          Flexible(
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
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Add Criteira',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF96031A),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  'SSC',
                  cont: sscHandler,
                  obscure: false,
                  keyboard: TextInputType.text,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  'HSC',
                  cont: hscHandler,
                  obscure: false,
                  keyboard: TextInputType.text,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  'UG',
                  cont: ugHandler,
                  obscure: false,
                  keyboard: TextInputType.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width+280),
              child: Row(
                children: [
                  Flexible(
                    child: CheckboxListTile(
                    title: const Text("MCA"),
                    value: mca,
                    onChanged: (newValue) {
                      setState(() {
                        mca = newValue!;
                      });
                      if(mca == true){
                          dept.add('MCA');
                        }
                        else{
                          dept.remove('MCA');
                        }
                        print(dept);
                      // print(mca);
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                  ),
                  Flexible(
                    child: CheckboxListTile(
                    title: const Text("IT"),
                    value: it,
                    onChanged: (newValue) {
                      setState(() {
                        it = newValue!;
                      });
                        if(it == true){
                          dept.add('IT');
                        }
                        else{
                          dept.remove('IT');
                        }
                        print(dept);
                      // print(mca);
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                  ),
                  Flexible(
                    child: CheckboxListTile(
                    title: const Text("ETC"),
                    value: etc,
                    onChanged: (newValue) {
                      setState(() {
                        etc = newValue!;
                      });
                        if(etc == true){
                          dept.add('ETC');
                        }
                        else{
                          dept.remove('ETC');
                        }
                          print(dept);
                      // print(mca);
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                  ),
                  Flexible(
                    child: CheckboxListTile(
                    title: const Text("CS"),
                    value: cs,
                    onChanged: (newValue) {
                      setState(() {
                        cs = newValue!;
                      });
                        if(cs == true){
                          dept.add('CS');
                        }
                        else{
                          dept.remove('CS');
                        }
                        print(dept);
                      // print(mca);
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                  ),
                  Flexible(
                    child: CheckboxListTile(
                    title: const Text("Mech"),
                    value: mech,
                    onChanged: (newValue) {
                      setState(() {
                        mech = newValue!;
                      });
                        if(mech == true){
                          dept.add('MECH');
                        }
                        else{
                          dept.remove('MECH');
                        }
                        print(dept);
                      // print(mca);
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
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
