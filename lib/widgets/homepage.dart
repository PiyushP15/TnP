import 'package:flutter/material.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:tnp_portal/widgets/all_jobs_list.dart';

class Homepage extends StatefulWidget{
  const Homepage({super.key});
  
  @override
  State<Homepage> createState() {
    return _Homepage();
  }


}

class _Homepage extends State<Homepage>{

  final List<AllJobs> _jobs = [
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
    AllJobs(companyName: 'TCS',title: 'SDE 1', desc: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas quos cumque, ad fugiat pariatur officiis, deleniti quisquam, natus inventore non amet incidunt architecto qui? Fugit vitae provident odit aut, reprehenderit, quis aspernatur illo voluptatem mollitia est iste laboriosam ratione ducimus harum et vel tenetur, ea esse laudantium magni quidem exercitationem!'),
  ];

  @override
  Widget build(context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AllJobsList(allJobs: _jobs),
    );
    // ListView.builder(itemCount: _jobs.length , itemBuilder: (ctx, index)=> Text(_jobs[index].title));
  }
}