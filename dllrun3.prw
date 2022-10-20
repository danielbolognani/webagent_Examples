#define MB_OK                       0
#define MB_OKCANCEL                 1
#define MB_YESNO                    4
#define MB_ICONHAND                 16
#define MB_ICONQUESTION             32
#define MB_ICONEXCLAMATION          48
#define MB_ICONASTERISK             64
 
User Function DllTeste()
  
Local hHdl := 0,buffer := "",xRet1 := 0
// Abre Dll
hHdl := ExecInDLLOpen( "dllprotheus_x64.dll" )
  
// ----------------------------------------------------------------
// Envia comando para execução, repare que estamos
// usando a opção "1" no momento de chamar a DLL.
// ----------------------------------------------------------------
 
// ExecInDllRun não retorna valor da DLL
buffer:= "Executando a partir da ExecInDllRun..."
xRet1 := ExecInDllRun( hHdl, 1, buffer )
MessageBox("Retorno da ExeDllRun: " + xRet1, "ExeDllRun", MB_ICONEXCLAMATION)
   
// ExecInDllRun retorna valor numérico da DLL
buffer:= "Executando a partir da ExeDllRun..."
xRet2 := ExecInDllRun( hHdl, 2, @buffer )
MessageBox("Retorno da ExeDllRun: " + xRet2, "ExeDllRun", MB_ICONEXCLAMATION)
 

// ----------------------------------------------------------------
// Fecha a DLL
ExecInDllClose( hHdl )
  
Return
