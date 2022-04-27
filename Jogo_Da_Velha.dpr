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
    jogar_novamente: integer;
    I: Integer;

begin
  tabuleiro := TipoTabuleiro.Create;
  jogadores[0] := TipoJogador.Create;
  jogadores[1] := TipoJogador.Create;
  numero_jogador := 0;
  jogar_novamente := 1;

  while (jogar_novamente = 1) do
  begin
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
              writeln('-------------------------------------------');
              writeln('     Jogada invalida. Tente novamente.');
              writeln('-------------------------------------------');
              writeln('');
            end;
     end;

     if   (jogo_acabou(tabuleiro)) then
            begin
              numero_jogador := (numero_jogador + 1) mod 2;
              ganhador := jogadores[numero_jogador];

              writeln('');
              writeln('------------------------');
              writeln('     ' + ganhador.nome + ' ganhou!');
              writeln('------------------------');
              writeln('');
            end
     else
            begin
              writeln('');
              writeln('---------------');
              writeln('     VELHA');
              writeln('---------------');
              writeln('');
            end;

    writeln('Você quer jogar de novo?');
    writeln('[1] - SIM');
    writeln('[2] - NAO');
    read(jogar_novamente);

    for I := 0 to 30 do
    begin
      writeln(#13);
    end;

  end;

     jogadores[0].Free;
     jogadores[1].Free;

  //jogada.Free ?   {TODO -oDouglas -cTreinamento : sera que vamos liberar aqui ???} ]

  // PRO MARCO DO FUTURO - NÃO FIZ NEHUMA LIBERAÇÃO DE MEMÓRIA NO DELPHI
end.
