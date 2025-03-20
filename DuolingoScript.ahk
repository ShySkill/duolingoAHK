#SingleInstance Force

F2::
    Loop, 30{
        MainLoop()
    }
    msgbox, Its time to do a lesson to make him less suspicious
    return 


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
    imagesearch, x, y, 0, 0, 1920, 1080, images\review.PNG
    if(ErrorLevel = 0){
        tester := 1
    }


    imagesearch, x, y, 0, 0, 1920, 1080, images\radio.PNG
    ImageWidth := 1920  ;
    ImageHeight := 1080  ; 
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
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, images\multchoice.PNG
    if (ErrorLevel = 0) {
        SendStrokes(1)
        SendStrokes(2)
        SendStrokes(3)
        SendStrokes(4)
    }
    Sleep, 10000
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, images\select.PNG
    if (ErrorLevel = 0) {
        Loop, 5{
            Send, %A_Index%
            Sleep, 50
        }
    }
    Sleep, 32000
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, images\compre.PNG
    if(ErrorLevel = 0){
        Send, {1}
        Send, {2}
    }

    Sleep, 19000
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, images\trato.PNG
    if(ErrorLevel = 0){
        Send, {1}
        Send, {2}
        Send, {3}
    }

    Sleep, 15000
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, images\continue.PNG
    if(ErrorLevel = 0){
        Loop, 6{
            Send, {Enter}
            Sleep, 2000
        }
    }else{
        Loop, 6{
            Send, {Enter}
            Sleep, 2000
        }
    }

    SendWebhook(descriptionText)

}

SendWebhook(descriptionText)
{
    url := "https://discord.com/api/webhooks/ENTERWEBHOOKHERE"
    string := "Completed lessons:" . count
    postdata=
    (
    {
    "embeds": [
        {
        "title": "Finished a lesson in Duolingo!",
        "description": "Completed one lesson for 30xp",
        "url": "https://www.duolingo.com/",
        "color": 8280002,
        "thumbnail": {
            "url": "https://i.imgur.com/rGxIH62.png"
        },
        "image": {
            "url": "https://i.imgur.com/KiRApYa.jpg"
        }
        }
    ]
    }
    )

    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("POST", url, false)
    WebRequest.SetRequestHeader("Content-Type", "application/json")
    WebRequest.Send(postdata)       
}





return


b::
    Esc::ExitApp
