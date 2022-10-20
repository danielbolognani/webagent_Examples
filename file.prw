#include "protheus.ch"

User Function WAFiles ()

  Local carquivo := "C:\\temp\\arquivoteste.txt"
  Local cConteudo := "", cVar := "", nI, cCont

  // Verifico se o arquivo existe
  if (File(carquivo))
    // Se já existe, apago
    FErase(carquivo)
  endif

  nHdl := FCREATE( carquivo )

  if nHdl > 0
    FWrite(nHdl, Time())
    FCLOSE(nHdl)
  endif

  aRet := Directory("C:\\temp\\*.*",'D')

  for nI := 1 to Len(aRet)
    cVar += aRet[nI][1] + CRLF
  next

  DEFINE DIALOG oDlg TITLE "Exemplo Acesso Arquivos" FROM 180,180 TO 800,600 PIXEL
  
  oTMultiget1 := tMultiget():new( 01, 01, {| u | if( pCount() > 0, cVar := u, cVar ) }, oDlg, 200, 200, , , , , , .T. )

  nHdl := FOpen(carquivo)
  if (nHdl>0)
    FRead(nHdl, cConteudo, 20)
    FClose( nHdl )
  endif

  cCont := "Conteúdo do arquivo " + carquivo + ":" + CRLF + cConteudo
  oTMultiget2 := tMultiget():new( 180, 01, {| u | if( pCount() > 0, cCont := u, cCont ) }, oDlg, 200, 200, , , , , , .T. )

  ACTIVATE DIALOG oDlg CENTERED

Return
