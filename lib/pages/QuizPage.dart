import 'package:flutter/material.dart';

class CountrieQuiz{
   String url;
   String question;
   List<String>questions;
   int respondeIndex;

   CountrieQuiz(this.url,this.question,this.questions,this.respondeIndex);

   String response(){
     return questions[respondeIndex];
   }
   bool isCorrectAnswer(String userResponse){
     return questions[respondeIndex]==userResponse;
   }
   static List<CountrieQuiz>getCountries(){

     return [
       CountrieQuiz("https://flagcdn.com/w320/ws.png","Quelle est la capitale de la Norverge ?",
       ["Samoa",'Kolog',"Bring"],0),
       CountrieQuiz("https://mainfacts.com/media/images/coats_of_arms/ws.png","Quelle est la capitale de la TOMOTO ?",
           ["Samoa",'Kolog',"Bring"],0)
     ];
   }
}
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    final CountrieQuiz countrieQuiz;
    countrieQuiz=CountrieQuiz.getCountries()[index];

    return Scaffold(
      body: Center(
        child:Text("helo")
      ),
    );
  }
}
/**
 * Column(
    children: [
    Container(
    height: 200,
    width: double.infinity,
    child: Image.network(countrieQuiz.url)
    ),
    Column(
    children: [
    Text(CountrieQuiz.getCountries()[0].question,
    style: const TextStyle(
    fontSize: 18
    ),),
    for(String proposition in countrieQuiz.questions)
    ElevatedButton(onPressed: () {
    if(countrieQuiz.isCorrectAnswer(proposition)){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Bravo!"))
    );
    }else{
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("la bonne reponse est  ${countrieQuiz.response()}!"))
    );
    }
    setState(() {
    if(index<2){
    index++;
    }
    });
    },
    child: Text(proposition,
    style: TextStyle(fontSize: 18),
    )
    )
    ],
    )

    ],
    )
 */