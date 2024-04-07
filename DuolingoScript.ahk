#SingleInstance Force

F2::
    Loop, 34{
        MainLoop()
    }

SendStrokes(number){
    Send, {%number%}
    Sleep, 200
    Send, {5}
    Sleep, 200
    Send, {%number%}
    Sleep, 200
    Send, {6}
    Sleep, 200
    Send, {%number%}
    Sleep, 200
    Send, {7}
    Sleep, 200
    Send, {%number%}
    Sleep, 200
    Send, {8}
    Sleep, 200
}

MainLoop(){
    CoordMode, Pixel, Screen
    tester := 0
    imagesearch, x, y, 0, 0, 1366, 768, images\review.PNG
    if(ErrorLevel = 0){
        tester := 1
    }

    imagesearch, x, y, 0, 0, 1366, 768, images\radio.PNG
    ImageWidth := 1366  ;
    ImageHeight := 768  ; 
    ImageCenterX := x + 50
    ImageCenterY := y + 50

    if(tester = 0){
        MouseClick, Left, %ImageCenterX%, %ImageCenterY%
    }
    
    Sleep, 1000
    Send, {Tab}
    Sleep, 500
    Send, {Enter}

    Sleep, 19000
    ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, images\multchoice.PNG
    if (ErrorLevel = 0) {
        SendStrokes(1)
        SendStrokes(2)
        SendStrokes(3)
        SendStrokes(4)
    }
    Sleep, 10000
    ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, images\select.PNG
    if (ErrorLevel = 0) {
        Loop, 5{
            Send, %A_Index%
            Sleep, 50
        }
    }
    Sleep, 32000
    ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, images\compre.PNG
    if(ErrorLevel = 0){
        Send, {1}
        Send, {2}
    }

    Sleep, 19000
    ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, images\trato.PNG
    if(ErrorLevel = 0){
        Send, {1}
        Send, {2}
        Send, {3}
    }

    Sleep, 15000
    ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, images\continue.PNG
    if(ErrorLevel = 0){
        Send, {Enter}
        Sleep, 2000
        Send, {Enter}
        Sleep, 2000
        Send, {Enter}
        Sleep, 2000
        Send, {Enter}
        Sleep, 2000
    }



}


return


b::
    Esc::ExitApp

