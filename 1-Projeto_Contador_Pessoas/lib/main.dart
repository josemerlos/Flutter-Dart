import 'package:flutter/material.dart'; // pacote que traz todos os widgets correspondentes

void main(){
  runApp(const MyApp()); 
}



// widget personalizado para depois adicionar ao runapp

class MyApp extends StatelessWidget { // Myapp representa meu app inteiro - classe que representa as configs do meu app

    const MyApp({super.key});
 //criando widget customizado
   
    @override // estamos sobrescrevendo o metodo build com nosso proprio codigo, pois o mesmo pertence a classe StatelessWidget
    Widget build(BuildContext context){ // funcao que retorna um widget - necessario para a criacao do widget
        return const MaterialApp(    // preciso passar qual aplicativo quero rodar -- no caso ele sera um MaterialApp que contem varios parametros para customizacao      
                  debugShowCheckedModeBanner: false,    
                  home: HomePage(),
                );
         }
}


// poderiamos desenvolver todo nosso código na home, porem nao seria uma boa prática, ficaria um código gigante na home do my app. Paginas tbm sao widgets
// interessante criar um widget para ser a página do meu aplicativo


class HomePage extends StatefulWidget { // para quanto possuo alteracao de estado na minha tela
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int count = 0;

 bool get isEmpty => count == 0;
 bool get isFull => count >= 20;

  void decrement(){
    setState(() {           // informando ao app que teve mudanca de estado de forma que ocorra a atualizacao - Chama novamente o metodo build
      count--;
    });
    print(count);
  }


  void increment(){
    setState(() {
      count++;
    });
    print(count);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(       // Widget utilizado praticamentye em todas as paginas... Como se fosse um modelo para criar as paginas
           backgroundColor: Colors.black,    
           body: Container(
              decoration: const BoxDecoration(
                image:  DecorationImage(
                   image: AssetImage('assets/images/imagem.jpeg'),
                   fit: BoxFit.cover,   // ocupa todo o espaco da tela sem distorcao
                )
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // centralizado verticalmente
              children:  [                                
                 Text(
                     isFull ? "Lotado" : "Pode entrar!",                 // Operador ternário
                     style: const TextStyle(
                     fontSize: 30, 
                     color: Colors.white,
                     fontWeight: FontWeight.w700,
                     letterSpacing: 5,
                     ),
                ),
          
           Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
                  count.toString(),
                    style:  TextStyle(
                      color: isFull ? Colors.red : Colors.white,  
                      fontSize: 100,
                  ),
                ), 
          ),
          
          
          

                Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      TextButton(
                        onPressed: isEmpty ? null : decrement,      // desabilitando botao caso esteja vazio - operador ternário
                        style: TextButton.styleFrom(
                            backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,   
                            //padding: const EdgeInsets.all(32),
                            fixedSize: const Size(100, 100),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                        ),

                        child: const Text(
                            "Saiu", 
                             style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 16,
                             ),
                        ),
                      ),


                      const SizedBox( width: 32,),   // box invisivel para separar os dois elementos


                       TextButton(
                        onPressed: isFull ? null : increment,      // desabilitando botao caso esteja cheio  - operador ternário
                        style: TextButton.styleFrom(
                            backgroundColor: isFull ? Colors.white.withOpacity(0.5) : Colors.white,   
                            fixedSize: const Size(100, 100),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                        ),
                        child: const Text(
                              "Entrou",
                               style: TextStyle(
                               color: Colors.black,
                               fontSize: 16,
                              ),

                          ),
                      ),
                    ],
                ),
              ], 
            )
,
           )

      );   
    }
}








