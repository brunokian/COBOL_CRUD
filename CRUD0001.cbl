      ******************************************************************
      * Author: Bruno Kian
      * Date: 26/06/2025
      * Purpose: Aprimorar habilidades em Cobol
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRUD0001.
      ***************************************************************
       ENVIRONMENT DIVISION.
      *************************************************************
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO 'CLIENTES.DAT'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           FILE STATUS IS CLIENTES-STATUS
           RECORD KEY IS CLIENTES-CHAVE.
       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 CLIENTES-REG.
           05 CLIENTES-CHAVE.
               10 CLIENTES-FONE PIC 9(09).
           05 CLIENTES-NOME PIC X(30).
           05 CLIENTES-EMAIL PIC X(40).


       WORKING-STORAGE SECTION.
       77 WRK-OPTION PIC X(1).
       77 WRK-MODULO PIC X(25) VALUE '__TITLE__'.
       77 WRK-TECLA PIC X(1).
       77 CLIENTES-STATUS PIC 9(2).
       SCREEN SECTION.
       01 TELA.
           05 LIMPA-TELA.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 PIC X(20) ERASE EOL
               BACKGROUND-COLOR 3.
               10 LINE 01 COLUMN 25 PIC X(20) BACKGROUND-COLOR 3
               FOREGROUND-COLOR 0 FROM 'SISTEMA DE CLIENTES'.
               10 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 1 FROM WRK-MODULO.

      ******************************************************************
      *No cobol, não há "redesenho automático da tela" como nas
      *interfaces gráficas modernas.
      *
      *Quando você escreve um novo texto em uma posição da tela, ele
      *apenas sobrepõe os caracteres, e não apaga o que sobrou se o
      *novo texto for mais curto. Por isso, é interessante criar uma
      * função para limpar a tela
      ******************************************************************

       01 MENU.
           03 LINE 07 COLUMN 15 VALUE '1 - INCLUIR'.
           03 LINE 08 COLUMN 15 VALUE '2 - CONSULTAR'.
           03 LINE 09 COLUMN 15 VALUE '3 - ALTERAR'.
           03 LINE 10 COLUMN 15 VALUE '4 - EXCLUIR'.
           03 LINE 11 COLUMN 15 VALUE '5 - RELATORIO'.
           03 LINE 12 COLUMN 15 VALUE '6 - SAIDA'.
           03 LINE 13 COLUMN 15 VALUE '7 - OPCAO:'.
           03 LINE 13 COLUMN 25 USING WRK-OPTION.

      *****************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
       0001-PRINCIPAL.
           PERFORM 1000-INICIAR.
           PERFORM 2000-PROCESSAR.
           PERFORM 3000-FINALIZAR.
           STOP RUN.


       1000-INICIAR.
           OPEN I-O CLIENTES
               IF CLIENTES-STATUS = 35 THEN
                   OPEN OUTPUT CLIENTES
                   CLOSE CLIENTES
                   OPEN I-O CLIENTES
               END-IF


           DISPLAY TELA.
           ACCEPT MENU.


       2000-PROCESSAR.
           EVALUATE WRK-OPTION
               WHEN 1
                   PERFORM 5000-INCLUIR
               WHEN 2
                   CONTINUE
               WHEN OTHER
                   IF WRK-OPTION NOT EQUAL 'X'
                       DISPLAY 'ENTRE COM OPCAO VALIDA' AT 1620


                   END-IF
           END-EVALUATE.

       3000-FINALIZAR.
           CLOSE CLIENTES.

       5000-INCLUIR.
           MOVE 'MODULO INCLUSAO' TO WRK-MODULO.
           DISPLAY TELA.
           ACCEPT WRK-TECLA AT 1620.
