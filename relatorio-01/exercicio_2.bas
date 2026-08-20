Dim PIN As Integer
Dim PINDIGITADO As Integer

PIN = 2206

Input PINDIGITADO

While PINDIGITADO <> PIN
    Print "PIN invalido. Tente novamente."
    Input PINDIGITADO
Wend

Print "Transacao autorizada!"
Sleep
