program Jogo_Da_Velha;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  JogoDaVelha;

var tabuleiro: TipoTabuleiro;
    jogadores: TipoJogador2;
    jogada: TipoJogada;

begin
  {DONE -oDouglas -cTreinamento : Aqui voce vai criar}
  tabuleiro := TipoTabuleiro.Create;
  jogadores[0] := TipoJogador.Create;
  jogadores[1] := TipoJogador.Create;


  zerar(tabuleiro);
  criar_jogadores(jogadores);
  imprimir(tabuleiro);

  while (not tabuleiro_cheio(tabuleiro) and not jogo_acabou(tabuleiro)) do
  begin
    jogada := aguardar_jogada(jogadores[0]);

    realizar_jogada(tabuleiro, jogada, jogadores[0]);
    imprimir(tabuleiro);
  end;
  

//  writeln(' i: ' + IntToStr(jogada.i) + ' - j: ' + IntToStr(jogada.j));



  jogadores[0].Free;
  jogadores[1].Free;

  readln;

  //jogada.Free ?   {TODO -oDouglas -cTreinamento : sera que vamos liberar aqui ???}
end.
