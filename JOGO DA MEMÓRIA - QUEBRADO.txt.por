//JOGO DA MEMÓRIA

//CRIADO COMO TAREFA DE DESAFIO 2 (QUEBRANDO TUDO) PARA A TURMA MANHÃ DE BACK-END VAI NA WEB

//AUTORES:
//MARCELO SANTOS
//JOAQUIM BATISTA DA SILVA NETO
//RÔMULO RATIS LEÃO
//MIKAELA TITO
//BRENO RICARDO ANDRADE

//DATA: 22/09/2023

//ESTE É O CÓDIGO RODANDO PLENAMENTE, OU, PELO MENOS NA MINHA MÁQUINA FUNCIONA...BRINCADEIRA SAMUEL...DÁ UM 10 AÍ

//PROPÓSITO DO JOGO
//SERÁ APRESENTA AO JOGADOR UM TABULEIRO COM ALGUMAS PALAVRAS PRÉ-ESTABELECIDAS.
//O JOGADOR TERÁ UM TEMPO PARA MEMORIZAR AS PALAVRAS DE ACORDO COM O NÍVEL ESCOLHIDO.
//APÓS FINALIZADO O TEMPO, SERÁ APRESENTADO UM TABULEIRO VAZIO E O JOGADOR DEVERÁ DIGITAR A PALAVRA CORRESPONDENTE...
//...À POSIÇÃO SOLICITADA.
//O JOGO APRESENTA 3 NÍVEIS DE DIFICULDADE. CADA NÍVEL APRESENTA UM NÚMERO DE TENTATIVAS, ERROS E ACERTOS DIFERENTES TAMBÉM.
//AO ESGOTAR OS ERROS DISPONÍVEIS OU TENTATIVAS DISPONÍVEIS SEM TER COMPLETADO TODO O TABULEIRO, O JOGO É ENCERRADO E APRESENTADO...
//...OS RESULTADOS DA DERROTA AO JOGADOR.
//CASO O JOGADOR CONSIGA COMPLETAR TODO O TABULEIRO SEM TER ESGOTADO AS TENTATIVAS E ERROS DISPONÍVEIS, ELE VENCE O JOGO E...
//...O RESULTADO TAMBÉM É MOSTRADO NA TELA.

programa {
  inclua biblioteca Util --> u
  inclua biblioteca Texto --> tx
  cadeia palavrasEmbaralhadas[9]

 	 cadeia listaDePalavras[] = {
      "Python", "Java", "C++", "JavaScript", "CSharp", "PHP", "GoLang", "Ruby", "Swift", "Rust", "Kotlin", "Perl", "Scala", "SQL", "HTML", "CSS"
    }

	 funcao inicio() {
	   teladeinicio()  
	  }
    
    funcao teladeinicio() {
        cadeia txt
        logico resposta = falso, jogar = falso
        inteiro nivel 
        
        faca{
          escreva("Bem-vindo ao Jogo da Memoria!\n")
          escreva("Pressione 'ENTER' para comecar ou 'S' para sair...\n")
          leia(txt)
          

		escolha(tx.caixa_baixa(txt)){
			caso "s":
				resposta = verdadeiro
        jogar = falso
        pare
			caso "":
				resposta = verdadeiro
				jogar = verdadeiro
			pare
			caso contrario:
				escreva("Opcao invalida")
        u.aguarde(1000)
        limpa()
      
			}
    } enquanto(resposta == falso)

      limpa()

      se(jogar == falso){      
        
        escreva("Eu sabia que voce iria desistir antes mesmo de comecar. Volte quando estiver mais capacitado!")
        retorne
      }
       nivel = escolhanivel()
        loading(nivel)
    }
    
      funcao escolhanivel() {
      inteiro nivel
      cadeia opcao

      faca{
      escreva(" _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _\n")
      escreva("|   Escolha o nivel de dificuldade    |\n")
      escreva("| 1 = Facil | 2 = Medio | 3 = Dificil |\n")
      escreva("               Nivel: ")
      leia(opcao)
       
      escolha (opcao)
			{
				caso "1": 
			 		nivel = 1
          opcao = "0"         
			 	pare
			 	
			 	caso "2": 
			 		nivel = 2
          opcao = "0"
        pare
			 	
			 	caso "3": 
			 		nivel = 3  
          opcao = "0"        
			 	pare
			 	
			 	caso contrario:
          escreva("Opcao Invalida")
			 		u.aguarde(1000)
          limpa()
			}		
      }enquanto(opcao != "0")
      
        
        retorne nivel
    }

    funcao loading(inteiro nivel) {
     palavrasEmbaralhadas = embaralhePalavras(listaDePalavras)   
    	
     limpa()

     escreva("Embaralhando as palavrinhas (já achou o erro do código?)...\n") 
     escreva("####################\n")
     para (inteiro contador = 4; contador >= 0; contador--)
      {
        escreva(">>>>")   
        u.aguarde(1000)
      }
      escreva("\n####################")

      limpa()
      jogo(nivel)
      
    }
    
    funcao cadeia embaralhePalavras(cadeia palavras[]) {
        inteiro sorteiaPosicoesPalavras[9] 
        
        sorteiaPosicoesPalavras = sorteioDeNumerosSemRepeticao(15)

        para(inteiro i = 0; i < 9; i++){      
         palavrasEmbaralhadas[i] = palavras[sorteiaPosicoesPalavras[i]]       
        }

        retorne palavrasEmbaralhadas
    }

    
    funcao memorize(caracter palavras[]) {
      escrevePalavra(0,1,2, palavras[0], palavras[1], palavras[2])
      escrevePalavra(3,4,5,palavras[3], palavras[4], palavras[5])
      escrevePalavra(6,7,8,palavras[6], palavras[7], palavras[8])
    }
    
    funcao jogo(inteiro nivel) {
      cadeia tabuleiroVazio[9] = {"*****", "*****", "*****", "*****", "*****", "*****", "*****", "*****", "*****"}
      inteiro erros, tentativas, acertos, tempo = 0, x = 0, posicao[9], contaErros = 0, contaTentativas = 0
      cadeia respostaPalavra

      escolha(nivel) {
        caso 1:
        erros = 18
        tentativas = 26
        acertos = 0
        tempo = 27
        pare

        caso 2:
        erros = 9
        tentativas = 16
        acertos = 0
        tempo = 18
        pare

        caso 3:
        erros = 5
        tentativas = 14
        acertos = 0
        tempo = 9
        pare
        caso contrario:
         escreva("Op�ao Invalida!")
         u.aguarde(1000)
      } 

      memorizePalavras(tempo)

      posicao = sorteioDeNumerosSemRepeticao(8)

      faca {
        escreva("Erros disponiveis: ", erros)
        escreva(" | Tentativas disponiveis: ", tentativas)
        escreva(" | Acertos: ", acertos)

        memorize(tabuleiroVazio)

        cadeia resposta
        escreva("\n Digite a palavra na posição ", posicao[x], "? ")
        leia(resposta)
        limpa()

        se (tx.caixa_baixa(resposta) == tx.caixa_baixa(palavrasEmbaralhadas[posicao[x]])) {
          acertos++
          tentativas--
          contaTentativas++
          tabuleiroVazio[posicao[x]] = palavrasEmbaralhadas[posicao[x]]
          x++
        } senao {
          erros--
          tentativas--
          contaErros++
          contaTentativas++
        }

        se(acertos == 9){          
          pare
        }

      } enquanto (erros != 0)

      resultado(erros, contaTentativas, acertos, contaErros)
        
    }

    funcao sorteioDeNumerosSemRepeticao(inteiro limit) {
      inteiro numeros[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
      inteiro sorteio[9], i = 0 

      faca {
        inteiro pos = 0
        inteiro num = numeros[u.sorteia(0, limit)]

        enquanto((pos < 8) e (sorteio[pos] != num)){
          pos++    
        }

        se(sorteio[pos] != num) {
          sorteio[i] = num   
          i++   
        }

      } enquanto(i < 9)

      retorne sorteio
  }
    
    funcao resultado(inteiro erros, inteiro tentativas, inteiro acertos, inteiro contaErros) {
        se(erros == 0){
          escreva("GAME OVER!!\n")
          escreva("Numero de acertos: ", acertos, " - Numero de erros: ", contaErros, " - Numero de Tentativas: ", tentativas, "\n")
          u.aguarde(5000)
          limpa()
          inicio()
          retorne

        }

          escreva("Parabens! Voce ganhou!!\n")
          escreva("Numero de acertos: ", acertos, " - Numero de erros: ", contaErros, " - Numero de Tentativas: ", tentativas, "\n")
          u.aguarde(5000)
          limpa()
          inicio()
        
        
    }

    funcao escrevePalavra(inteiro nCarta1, inteiro nCarta2, inteiro nCarta3, cadeia carta1, cadeia carta2, cadeia carta3){
      escreva("\n        "+nCarta1+"                 "+nCarta2+"                 "+nCarta3+"\n")
      escreva(tx.preencher_a_direita('=', 58, "=") + "\n")
      escreva("|     "+tx.preencher_a_direita(' ', 10, carta1)+"   |     "+tx.preencher_a_direita(' ', 10, carta2)+"   |     "+tx.preencher_a_direita(' ', 10, carta3)+"   |\n")
      escreva(tx.preencher_a_direita('=', 58, "="))
    }

    funcao memorizePalavras(inteiro tempo) {
      memorize(palavrasEmbaralhadas)
			escreva("\n\nTempo para memorizar a palavra: ")
      
        para (inteiro contador = tempo; contador >= 0; contador--)
		{
      escreva(" #", contador)
      
			u.aguarde(1000)
		}

		limpa()
		
  
    }

}
