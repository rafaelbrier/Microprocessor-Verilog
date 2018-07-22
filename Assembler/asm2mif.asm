@begin LD 0
IN 0
SR 12
SET in1
IN 0
SR 8
AND 15
SET in2
IN 0
SR 4
AND 15
SET op
LD 4
EQU 0
JNZ somaLab
LD op
EQU 1
JNZ subLab
LD op
EQU 3
JNZ mltLab
LD op
EQU 4
JNZ divLab
@somaLab LD in1
ADD in2
JMP fim
@subLab LD in1
SUB in2
JMP fim
@mltLab LD in1
MLT in2
JMP fim
@divLab LD in1
DIV in2
JMP fim
@fim OUT 0
JMP begin


