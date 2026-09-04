Identificação: Mariana Novais Portugal - 746
# Exercício 1
Histórico de Prompts:
  (Pergunta que foi enviada)
  estou fazendo um código em Rust, e não sei como funciona a estrutura de loop(com break). me explique 

  (Resposta obtida)
  Claro! Em Rust, loop é uma estrutura usada para repetir um trecho de código continuamente. O break serve para parar o loop quando uma condição for atendida.

1. Estrutura básica
loop
{
    println!("Isso vai repetir!");
}
Esse código nunca para, porque não existe nada dizendo para ele parar.
É aí que entra o break:

loop
{
    println!("Isso vai repetir!");

    break;
}

Nesse caso:

Entra no loop;
Executa o println!;
Encontra o break;
Sai do loop.
2. Usando uma condição

Normalmente, usamos if para decidir quando parar:

loop
{
    let numero = 10;

    if numero == 10
    {
        break;
    }
}

Podemos pensar assim:
"Fique repetindo até acontecer alguma coisa. Quando acontecer, dê break."

3. Um exemplo mais parecido com exercício

Imagine que queremos pedir uma senha até o usuário acertar:

use std::io;

fn main()
{
    loop
    {
        let mut entrada = String::new();

        println!("Digite a senha:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let senha: i32 = entrada.trim().parse().unwrap_or(0);

        if senha == 1234
        {
            println!("Senha correta!");
            break;
        }
        else
        {
            println!("Senha incorreta. Tente novamente!");
        }
    }
}

O funcionamento é:

          começa
             ↓
          LOOP
             ↓
       pede a senha
             ↓
       senha == 1234?
          /       \
        NÃO       SIM
         ↓         ↓
   tenta de novo  break
                   ↓
               sai do loop
4. O ponto mais importante

O loop não sabe sozinho quando parar.
Quem determina isso é o break.
Por exemplo:

loop
{
    if condicao
    {
        break;
    }
}

Significa:

"Repita enquanto for necessário. Quando condicao for verdadeira, execute break e saia."
E o break não precisa estar diretamente dentro de um if, mas é muito comum usá-lo assim.
Se você me mandar o exercício que está fazendo, posso te mostrar exatamente onde colocar o loop, o if e o break, sem fazer o código inteiro por você.

Relatório de Aprendizado: A resposta me ajudou a entender como utilizar a estrutura loop em Rust para repetir uma operação até que uma condição seja satisfeita.
A resposta explicou que o loop mantém a repetição e que o break é utilizado para encerrar o laço quando a condição desejada é alcançada. Com isso, foi possível compreender a lógica de utilizar uma estrutura tipo if dentro do loop: enquanto a condição não for atendida, o programa continua repetindo; quando for atendida, o break encerra a repetição. Isso foi essencial para fazer os outros exercícios que precisaram dessa estrutura.
