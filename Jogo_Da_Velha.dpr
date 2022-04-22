program Jogo_Da_Velha;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  JogoDaVelha;

var tabuleiro: TipoTabuleiro;
    jogadores: TipoJogador2;
    jogada: TipoJogada;

begin
  {TODO -oDouglas -cTreinamento : Aqui voce vai criar}
  tabuleiro := TipoTabuleiro.Create;
  jogadores[0] := TipoJogador.Create;
  jogadores[1] := TipoJogador.Create;


  zerar(tabuleiro);
  criar_jogadores(jogadores);
  imprimir(tabuleiro);

  jogada := aguardar_jogada(jogadores[0]); // ***REVESAR QUE ESTÁ DANDO ERRO***
  writeln(jogada);                         // """""""""""""""""""""""""""""""""

  readln;

  jogadores[0].Free;
  jogadores[1].Free;

  //jogada.Free ?   {TODO -oDouglas -cTreinamento : sera que vamos liberar aqui ???}
end.
