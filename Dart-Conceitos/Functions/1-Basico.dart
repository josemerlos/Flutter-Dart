void main() {
  
saudacoes();
  
  // ou
  
 String a = agora();
 print(a);
 print(agora());
}



void saudacoes(){ // void nao espera um retorno
  print('Saudacoes');
  print('Bem vindo.');
  print('Agora é ${agora()}');
  
}

String agora() {  // espera um retorno
  DateTime agora = DateTime.now();
  return agora.toString();
  
}
