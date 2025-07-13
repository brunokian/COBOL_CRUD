      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WRK-VALUE PIC X(10) VALUE ' '.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            ACCEPT WRK-VALUE FROM CONSOLE.
            DISPLAY "TESTEANDO" WRK-VALUE
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
