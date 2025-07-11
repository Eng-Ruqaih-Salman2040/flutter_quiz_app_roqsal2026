import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final String? image;
  Category(this.id, this.name, {this.image});
}
//('Dart'), ('Flutter'), ('C++'), ('Python');
//C# , Java PHP, ASP,
// HTML, CSS, JavaScript, SQL, Ruby, Swift, Kotlin, Go, Rust, TypeScript, R, Scala, Perl, Haskell, Lua, Dart, learval, Cartoon & Animation,Ardoino,
// Game Development, Web Development, Mobile Development, Data Science, Machine Learning, Cyber Security, Cloud Computing, Blockchain, Internet of Things (IoT), DevOps, UI/UX Design, Software Testing, Agile Methodologies,
// Project Management,
final List<Category> categories = [
  Category(1,"Dart", image: 'assets/topic/image2.jpg'),
  Category(2,"Flutter", image: 'assets/topic/image13.jpg'),
  Category(3,"C++",image: 'assets/topic/image5.jpg'),
  Category(4,"Python", image: 'assets/topic/image16.jpg'),
  Category(5,"C# ", image: 'assets/topic/image22.jpg'),
  Category(6,"java", image: 'assets/topic/image14.jpg'),
  Category(7,"PHP", image: 'assets/topic/image9.jpg'),
  Category(8,"ASP", image: 'assets/topic/image18.jpg'),
  Category(9,"HTML",image: 'assets/topic/image10.jpg'),
  Category(10,"CSS",image: 'assets/topic/image20.jpg'),
  Category(11,"JavaScript", image: 'assets/topic/image2.jpg'),
  Category(12,"SQL",image: 'assets/topic/image12.jpg'),
  Category(13,"Ruby", image: 'assets/topic/image15.jpg'),
  Category(14,"Swift",image: 'assets/topic/image3.jpg'),
  Category(15,"Kotlin", image: 'assets/topic/image11.jpg'),
  Category(16,"Go",image: 'assets/topic/image7.jpg'),
  Category(17,"Rust", image: 'assets/topic/image21.jpg'),
  Category(18,"TypeScript",image: 'assets/topic/image17.jpg'),
  Category(19,"R", image: 'assets/topic/image19.jpg'),
  Category(20,"Perl", image: 'assets/topic/image2.jpg'),
  Category(21,"Haskell",image: 'assets/topic/image8.jpg'),
  Category(22,"learval", image: 'assets/topic/image6.jpg'),
  Category(23,"Ardoino",image: 'assets/topic/image4.jpg'),
];