import 'package:flutter/material.dart';

// Class to hold sample data for doctors
class SampleData {
  final String imageUrl, doctorName, rating, specialty;

  SampleData({required this.specialty, required this.imageUrl, required this.doctorName, required this.rating});
}

final List<SampleData> sampleData = [
  SampleData(imageUrl: 'assets/doc1.png', doctorName: 'Dr Mike', rating: '4.5', specialty: 'Psychologist'),
  SampleData(imageUrl: 'assets/doc2.png', doctorName: 'James', rating: '4.5', specialty: 'Peer Counsellor'),
  SampleData(imageUrl: 'assets/doctor.png', doctorName: 'Dr Linda', rating: '4.5', specialty: 'Therapist'),
  SampleData(imageUrl: 'assets/doc1.png', doctorName: 'Dave', rating: '4.5', specialty: 'Therapist'),
  SampleData(imageUrl: 'assets/doc2.png', doctorName: 'Frank', rating: '4.5', specialty: 'Peer Counsellor'),
  SampleData(imageUrl: 'assets/doctor.png', doctorName: 'Stephen', rating: '4.5', specialty: 'Therapist'),
  SampleData(imageUrl: 'assets/doc2.png', doctorName: 'Vince', rating: '4.5', specialty: 'Psychologist'),
];

// Class to hold data for hot topics
class HotTopics {
  String icon;
  String name;
  Color color;

  HotTopics({required this.icon, required this.name, required this.color});
}

final List<HotTopics> topicItems = [
  HotTopics(icon: 'assets/discussion.png', name: 'Counselling', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/therapy.jpeg', name: 'Therapy', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/icon_stress.png', name: 'Stress', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/self_harm.jpeg', name: 'Suicide', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/anxiety.jpeg', name: 'Anxiety', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/self_harm_icon.png', name: 'Self Harm', color: Colors.blue.shade200),
  HotTopics(icon: 'assets/depression_icon.png', name: 'Depression', color: Colors.blue.shade200),
];

// Class to hold data for articles
class YourArticles {
  String image;
  String articleImage;
  String articleTitle;
  String articleCategories;
  String time;
  String date;
  Color? color;
  String description;

  YourArticles({
    required this.image,
    required this.articleCategories,
    required this.color,
    required this.description,
    required this.time,
    required this.date,
    required this.articleImage,
    required this.articleTitle,
  });
}

final List<YourArticles> yourArticles = [
YourArticles(
image: 'assets/therapy.jpeg',
articleCategories: 'Therapy',
color: Colors.blue.shade200,
description: '''There is a significant overlap between self-therapy and self-help therapy.
That’s because both terms describe self-driven methods of treating psychological problems
or growing our internal capabilities. ‘Self help therapy’ implies that a specific problem is
being addressed, though there’s no strict definition of it. ‘Self-therapy’ encompasses growing
our capabilities. Another thing you may notice is that ‘self-help therapy’ and ‘self-therapy’
are very often used to describe Cognitive Behavioral Therapy (CBT). It’s worth noting that, while
both can involve CBT to some degree or another, it’s more common in mainstream media to see CBT being
linked more explicitly with the former (Anxiety Canada, 2018; NHS Inform, 2018). In short, both are
almost the same, and neither is linked exclusively to CBT. As we’ll see, self-therapy can be used
to describe many different techniques.''',
time: '13:00',
date: 'June 23',
articleImage: 'assets/therapy.jpeg',
articleTitle: 'Self Therapy Methods',
),
YourArticles(
image: 'assets/anxiety.jpeg',
articleCategories: 'Anxiety',
color: Colors.blue.shade200,
description: '''Social isolation: Individuals who experience social isolation or loneliness
often have a reduced quantity or quality of social contacts compared to those who report positive
social relationships. Social isolation can lead to difficulty initiating social interactions with
others, often leading to feelings of rejection and insecurity.

Childhood trauma: Childhood trauma such as physical, emotional, or sexual abuse, or neglect, can
cause long-lasting effects on a person’s mental health. Experiencing childhood trauma can predispose
people to developing anxiety. This can be due to changes in brain development affecting our fight or
flight response, memory, and emotion regulation.

Societal pressures: Societal pressures can contribute to feelings of stress or anxiety, as people
feel the need to meet cultural or societal expectations, standards, or norms. For example, the
idealisation of a ‘perfect’ body can lead to body dissatisfaction and anxiety about physical appearance.
The pressure to be successful, achieve high grades, or excel in your career can also lead to anxiety
about performance and fear of failure.''',
time: '14:00',
date: 'June 23',
articleImage: 'assets/anxiety.jpeg',
articleTitle: 'Causes of anxiety',
),
YourArticles(
image: 'assets/depression_icon.png',
articleCategories: 'Depression',
color: Colors.blue.shade200,
description: '''Stay in touch: Don't withdraw from life. Socialising can improve your mood. Keeping
in touch with friends and family means you have someone to talk to when you feel low.

Be more active: Take up some form of exercise. There's evidence that exercise can help lift your mood.
If you haven't exercised for a while, start gently by walking for 20 minutes every day.

Face your fears: Don't avoid the things you find difficult. When people feel low or anxious, they
sometimes avoid talking to other people. Some people can lose their confidence in going out, driving or travelling.''',
time: '18:00',
date: 'June 23',
articleImage:
'assets/depression_icon.png',
  articleTitle: 'How To Cope With Depression',
),
  YourArticles(
    image: 'assets/self_harm.jpeg',
    articleCategories: 'Self Harm',
    color: Colors.blue.shade200,
    description: '''Self-harm, the act of deliberately inflicting pain or injury on oneself, can stem from various underlying causes. Emotional distress is a primary factor, where individuals use self-harm as a coping mechanism for overwhelming feelings such as sadness, anger, or frustration. Mental health conditions like depression, anxiety, and borderline personality disorder significantly increase the likelihood of self-harm. Trauma and abuse, whether physical, emotional, or sexual, can lead to self-harm as individuals try to regain a sense of control or distract themselves from emotional pain. Additionally, feelings of isolation, low self-esteem, and self-loathing contribute to the behavior. Social factors, including peer pressure and exposure to others who self-harm, can also play a role. Understanding these causes is crucial for providing appropriate support and interventions.''',
    time: '16:00',
    date: 'June 23',
    articleImage: 'assets/self_harm.jpeg',
    articleTitle: 'Reasons for Self Harm',
  ),
  YourArticles(
    image: 'assets/stress.jpeg',
    articleCategories: 'Stress',
    color: Colors.blue.shade200,
    description: '''Dealing with stress effectively involves several strategies. Start by identifying the causes of your stress, possibly by keeping a journal. Regular exercise is beneficial, as it releases endorphins that improve mood. Incorporate relaxation techniques like deep breathing, meditation, or yoga to calm your mind and body. Maintaining a healthy lifestyle, with a balanced diet, sufficient sleep, and limited caffeine, alcohol, and nicotine, is crucial. Effective time management helps reduce feelings of being overwhelmed. Seek social support by talking to friends, family, or a therapist. Set boundaries to avoid overcommitting yourself and ensure a balance between work, leisure, and rest. Engage in hobbies you enjoy to provide a break from stress. Staying positive and practicing gratitude can shift your perspective. If stress becomes unmanageable, seek professional help from a mental health expert. By integrating these strategies, you can better manage and reduce stress.''',
    time: '13:01',
    date: 'June 23',
    articleImage: 'assets/stress.jpeg',
    articleTitle: 'How To Relieve Stress',
  ),
];
class Appointment {
  final String doctorName;
  final String specialty;
  final DateTime dateTime;
  final String callID;

  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    required this.callID,
  });
}

List<Appointment> appointments = [];
