Sub ListWordCount()
    'In the Visual Basic Editor,
    'go to Tools -> References and check the box for
    'Microsoft Scripting Runtime to access the
    'filesystem object.

    Dim fso As Scripting.FileSystemObject
    Dim fol As Scripting.Folder
    Dim cfil As Variant
    Dim fil_1 As Scripting.File

    Dim s As String

    'The FSO isn't the fastest object in existence
    'and much slower than using the Windows API (or its
    'VB.Net namesake for that matter) but it's convenient
    'and easy to use.
    Set fso = New FileSystemObject
    Set fol = fso.GetFolder("\\syd-file\Practice\Research\Ben\elise")
    Set cfil = fol.Files

    'Helps it run a bit faster...
    Application.ScreenUpdating = False

    For Each fil_1 In cfil

        Select Case fil_1.Type
            'Add any other types that you want to check for
            Case "Microsoft Office Word Document"

            Documents.Open FileName:=fil_1.Path
            Debug.Print "," & Chr(34) & fil_1.Name & Chr(34) & ":"
            Debug.Print ReturnCellContentsToArray(0)

            'TODO: this needs to be fixed, it closes
            'the file that is running the vba
            'everything then procedes to shit itself
            'Documents.Close savechanges:=False

        End Select

    Next

ExitPoint:
On Error Resume Next
Set fil_1 = Nothing
Set cfil = Nothing
Set fol = Nothing
Set fso = Nothing
Application.ScreenUpdating = True
Application.ScreenRefresh
On Error GoTo 0

Exit Sub

ErrorHandler:

MsgBox Err.Number & vbCr & Err.Description

Resume ExitPoint

End Sub

Function ReturnCellContentsToArray(a As Integer)
    Dim intCells As Integer
    Dim celTable As Cell
    Dim strCells() As String
    Dim intCount As Integer
    Dim rngText As Range
    Dim colNum As Integer
    colNum = ThisDocument.Tables(1).Columns.Count

    If ActiveDocument.Tables.Count >= 1 Then
        With ActiveDocument.Tables(1).Range
            intCells = .Cells.Count
            ReDim strCells(intCells)
            intCount = 1
            Dim outputString As String
            outputString = "{"
            
            For Each celTable In .Cells
                Set rngText = celTable.Range
                rngText.MoveEnd Unit:=wdCharacter, Count:=-1
                strCells(intCount) = rngText
                intCount = intCount + 1
                
                Dim s$
                s = rngText
                Dim x&, w$
                Dim charCode As Integer
                Dim result As String
                
                For x = 1 To Len(s)
                    thechar = Mid(s, x, 1)
                    charCode = Asc(thechar)
                    
                    'this checks if there are strange chars
                    'If isLetter(charCode) = 0 Then
                    '    Debug.Print (charCode & " " & thechar)
                    'End If
                    
                    ''13 is <p> 11 is <br>
                    If (charCode = 13) Or (charCode = 11) Or (charCode = 34) Then
                        If (charCode = 13) Or (charCode = 11) Then
                            w = "<br>"
                        ElseIf (charCode = 34) Then
                            w = "&quot;"
                        Else
                            w = w
                        End If
                    Else
                        w = Mid(s, x, 1)
                    End If
                    result = result & w
                Next x
                
                If (intCount Mod colNum = 1) Then
                    Dim final As String
                    Dim newSep As String
                    Dim initial As String
                    initial = Chr(34) & result & Chr(34) & ","
                    newSep = Chr(34) & ": " & Chr(34)
                    final = Replace(initial, "|", newSep)
                    final = Replace(final, "m2", "m<sup>2</sup>")
                    final = Replace(final, "sqm", "m<sup>2</sup>")
                    
                    outputString = outputString & final
                    
                    result = ""
                Else
                    result = result & "|"
                End If
                
            Next celTable
            outputString = outputString & "}"
        End With
    End If
    ReturnCellContentsToArray = outputString
End Function


Function isLetter(code As Integer)
    If code >= 65 And code <= 90 Then
        isLetter = 1
    ElseIf code >= 97 And code <= 122 Then
        isLetter = 1
    Else
        isLetter = 0
    End If
End Function
