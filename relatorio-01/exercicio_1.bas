Dim peso As Double
Dim quantidade As Double
Dim metadiaria As Double

Input "Qual o seu peso em kg? ", peso
Input "Qual a quantidade de agua ingerida em ml? ", quantidade

metadiaria = peso * 35

if quantidade >= metadiaria Then
    Print "Meta atingida!"
else
    Print "Meta nao atingida"
end if
Sleep
