import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/providers/job_provider.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:tnp_portal/widgets/all_jobs_list.dart';

class Homepage extends ConsumerStatefulWidget{
  const Homepage({super.key});
  
  @override
  ConsumerState<Homepage> createState() {
    return _Homepage();
  }


}

class _Homepage extends ConsumerState<Homepage>{

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
    //Made to set the 
    final jobs = ref.watch(jobProvider);
    // Here we will set jobs equal to the fetched jobs

    // Fetch All Jobs As A List Here In allJobs (You Can Do It Above As Well, Must Be triggered Everytime The Widget Is Called.)
    // final List<Map<String,String>> fetchedJobs = []; 

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // change from dummy to fetched jobs
      child: AllJobsList(allJobs: _jobs),
    );
    // ListView.builder(itemCount: _jobs.length , itemBuilder: (ctx, index)=> Text(_jobs[index].title));
  }
}