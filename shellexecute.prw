#include "protheus.ch"


User Function ShellExec()

DEFINE DIALOG oDlg TITLE "Exemplo ShellExecute" FROM 180,180 TO 400,600 PIXEL

  b1 := TButton():New( 010, 010, "Executar Calculadora", oDlg,{|| ShellExecute("open","calc.exe", "", "", 1) 	},75,10,,,.F.,.T.,.F.,,.F.,,,.F. )
  b2 := TButton():New( 064, 010, "Excel", oDlg,{|| ShellExecute("open","excel.exe", "c:\\temp\\curvaabc.xlsx", "", 1)	},75,10,,,.F.,.T.,.F.,,.F.,,,.F. )

ACTIVATE DIALOG oDlg CENTERED

Return
