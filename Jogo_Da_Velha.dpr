program Jogo_Da_Velha;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  JogoDaVelha;

var tabuleiro: TipoTabuleiro;
    jogadores: TipoJogador2;
    jogada: TipoJogada;
    numero_jogador: integer;
    ganhador: TipoJogador;

begin
  tabuleiro := TipoTabuleiro.Create;
  jogadores[0] := TipoJogador.Create;
  jogadores[1] := TipoJogador.Create;
  numero_jogador := 0;

  zerar(tabuleiro);
  criar_jogadores(jogadores);
  imprimir(tabuleiro);

  while (not tabuleiro_cheio(tabuleiro) and not jogo_acabou(tabuleiro)) do
  begin
    jogada := aguardar_jogada(jogadores[numero_jogador]);

    if   realizar_jogada(tabuleiro, jogada, jogadores[numero_jogador]) then
         begin
           imprimir(tabuleiro);
           numero_jogador := (numero_jogador + 1) mod 2;
         end
    else
         begin
           writeln('');
           writeln('---------------------------------');
           writeln('Jogada invalida. Tente novamente.');
           writeln('---------------------------------');
           writeln('');
         end;

    if   (jogo_acabou(tabuleiro)) then
         begin
           numero_jogador := (numero_jogador + 1) mod 2;
           ganhador := jogadores[numero_jogador];

           writeln('');
           writeln('-------------------');
           writeln('O jogador ' + ganhador.nome + ' ganhou!');
           writeln('-------------------');
           writeln('');
         end
   else
         begin
           writeln('');
           writeln('-------------');
           writeln('Ninguem venceu');
           writeln('-------------');
           writeln('');
         end;

  end;

  jogadores[0].Free;
  jogadores[1].Free;

  readln;

  //jogada.Free ?   {TODO -oDouglas -cTreinamento : sera que vamos liberar aqui ???}
end.
