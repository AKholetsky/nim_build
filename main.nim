import osproc
import os
import strutils

proc toNim(fileName: string): string = 
    result = fileName
    if not fileName.endsWith(".nim"):
        result = fileName & ".nim"

proc toExe(fileName: string): string = 
    result = fileName
    if not fileName.endsWith(".exe"):
        result = fileName & ".exe"

proc build(fileName: string, outputFileName: string) =
    let my_sis = "E:\\Projects\\MY_SIS"
    let errCode = execCmd("nim c --out:" & outputFileName.toExe & " --outdir:" & my_sis & " " & fileName.toNim)
    if errCOde != 0:
        echo errCOde

if paramCount() == 0:
    echo "Not enough params"
elif paramCount() == 1:
    let fileName = paramStr(1)
    build fileName, fileName
else:
    let fileName = paramStr(1)
    let outputFileName = paramStr(2)
    build fileName, outputFileName