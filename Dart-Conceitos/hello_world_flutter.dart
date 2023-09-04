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
        return const MaterialApp(              // preciso passar qual aplicativo quero rodar -- no caso ele sera um MaterialApp que contem varios parametros para customizacao
                   home: HomePage(),
                );
         }
         

}


// poderiamos desenvolver todo nosso código na home, porem nao seria uma boa prática, ficaria um código gigante na home do my app. Paginas tbm sao widgets
// interessante criar um widget para ser a página do meu aplicativo


class HomePage extends StatelessWidget { // classe  responsavel pela pagina do meu app - pagina principal
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(    // precisamos passar qual a home, a tela principal -- container é como se fosse uma box que voce pode personalizar
                   color: Colors.black,     
                   alignment: Alignment.center,        
                   child: const Text("Olá mundo"),    // Quando quero especificar um widget dentro do outro utilizamos chield                                                     
            );
    }
}
