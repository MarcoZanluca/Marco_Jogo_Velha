program Jogo_Da_Velha;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  JogoDaVelha;

var t: tabuleiro;
    jogadores: TJogador2;

begin
  zerar(t);
  criar_jogadores(jogadores);
  imprimir(t);
  readln;

end.
