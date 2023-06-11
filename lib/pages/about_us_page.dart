import 'package:flutter/material.dart';
import 'package:saloni_heart_foundation/util/listtiles.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  Map<String, String> team = {'Milli Seth':'Co-Founder & President', 'Himanshu Seth':'Co-Founder & Ex-Chairman',
    'Girish Badola':'Secretary', 'Varun Gariney':'Treasurer', 'Shuchi Sarkar':'Director of Marketing',
    'Ann Kumar': 'Chair of Medical Opinions', 'Muskan Seth':'Youth Chair' };

  //TODO: save scroll state after switching pages
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Our Mission',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text('Patient Consultation: Provide free unbiased consultation from the world\'s Top doctors to families of children with complex heart condition.'),
                    SizedBox(height: 10,),
                    Text('Doctor Training: Enable doctors from India to learn skills from the world\'s best pediatric cardio-thoracic surgeons and cardiologists so that children living in India can get the best care.'),
                    SizedBox(height: 10,),
                    Text('Medical Education: Provide scholarships to deserving scholars from economically weaker sections in India, for education in the field of medicine & science.'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text('Email: admin@saloniheartfoundation.org', textAlign: TextAlign.left,),
                      Text('Call/WhatsApp: +1 (650) 770-5000', textAlign: TextAlign.left,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [for (var member in team.keys) Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/TeamMembers/${member.replaceAll(' ', '')}.jpg',
                              width: 75,
                              height: 75,
                            )
                          ),
                          Text(member, style: const TextStyle(
                            fontSize: 12
                          )),
                          Text(team[member] ?? 'error', style: const TextStyle(
                            fontSize: 9
                          )),
                        ],
                      ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    //TODO: remove notes
    // about us tile with beginning of story - read more thing takes user to separate page with whole story
    // our team tile
    // some way to incorporate mission/vision?
    // smth to subscribe for updates?
  }
}

class TeamMember {
  final String name;
  final String title;
  TeamMember(this.name, this.title);
}