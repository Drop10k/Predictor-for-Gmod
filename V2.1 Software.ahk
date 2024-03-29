#SingleInstance force

randomPasswordLength := 8  ; Change the length of the random password here if needed

MainGui:
Gui, Main: Font, s14, Arial
Gui, Main: Color, F5F5F5
Gui, Main: Add, Text, x10 y10 w400 h50 Center cBlue, ENTER PASSWORD
Gui, Main: Add, Text, x10 y60 w400 h20 Center, Generate Account:
Gui, Main: Add, Edit, x10 y80 w380 h30 vPasswordInput
Gui, Main: Add, Button, x10 y120 w180 h30 gCheckPassword, Confirm ✔️
Gui, Main: Add, Button, x200 y120 w180 h30 gGeneratePassword, Generate 🎲
Gui, Main: Add, Text, x10 y170 w400 h20 cRed, V2
Gui, Main: Show, w420 h200 Center, Enter Password
return

CheckPassword:
Gui, Main: Submit, NoHide
if (PasswordInput = password) {
    Gui, Main: Destroy
    GoSub, MainMenu
} else {
    MsgBox, 16, Incorrect Password, Incorrect password. Access denied.
}
return

GeneratePassword:
Random, password, 10000000, 99999999
GuiControl,, PasswordInput, %password%
return

MainMenu:
Gui, Main: Font, s14, Arial
Gui, Main: Color, F5F5F5
Gui, Main: Add, Text, x10 y10 w400 h50 Center cBlue, PREDICTORS MENU
Gui, Main: Add, Button, x10 y60 w400 h30 gOpenRoulette, Roulette Predictor 🎰
Gui, Main: Add, Button, x10 y100 w400 h30 gOpenBlackjack, Blackjack Predictor ♠️
Gui, Main: Add, Button, x10 y140 w400 h30 gOpenCoinFlip, Coin Flip Predictor 💰
Gui, Main: Add, Button, x10 y180 w400 h30 gShowCredits, Credits ℹ️
Gui, Main: Add, Text, x10 y220 w400 h20 cRed, V2
Gui, Main: Show, w420 h250 Center, Predictors Menu
return

OpenRoulette:
Gui, Main: Destroy
Gui, Roulette: Font, s14, Arial
Gui, Roulette: Color, F5F5F5
Gui, Roulette: Add, Text, x10 y10 w400 h50 Center cBlue, ROULETTE PREDICTOR 🎲
Gui, Roulette: Add, Text, x10 y60 w400 h20 Center vRouletteOutput, 
Gui, Roulette: Add, Progress, x10 y90 w400 h20 vRouletteProgress, BackgroundWhite cYellow
Gui, Roulette: Add, Button, x10 y130 w200 h30 gGenerateRouletteRole, Role 🔄
Gui, Roulette: Add, Button, x220 y130 w180 h30 gClearRouletteOutput, Clear ❌
Gui, Roulette: Add, Button, x10 y170 w200 h30 gBackToMainRoulette, Back ↩️
Gui, Roulette: Add, Text, x10 y210 w400 h20 cRed, V2
Gui, Roulette: Show, w440 h250 Center, Emoji Role Predictor
return

OpenBlackjack:
Gui, Main: Destroy
Gui, Blackjack: Font, s14, Arial
Gui, Blackjack: Color, F5F5F5
Gui, Blackjack: Add, Text, x10 y10 w400 h50 Center cBlue, BLACKJACK PREDICTOR ♣️
Gui, Blackjack: Add, Text, x10 y60 w200 h20 Center vBlackjackHand, Hand:
Gui, Blackjack: Add, Edit, x220 y60 w180 h20 vHandInput
Gui, Blackjack: Add, Text, x10 y90 w400 h20 Center vBlackjackOutput,
Gui, Blackjack: Add, Button, x10 y130 w100 h30 gCheckBlackjack, Check ✔️
Gui, Blackjack: Add, Button, x120 y130 w100 h30 gClearBlackjackOutput, Clear ❌
Gui, Blackjack: Add, Button, x10 y170 w200 h30 gBackToMainBlackjack, Back ↩️
Gui, Blackjack: Add, Text, x10 y210 w400 h20 cRed, V2
Gui, Blackjack: Show, w440 h250 Center, Blackjack Predictor
return

OpenCoinFlip:
Gui, Main: Destroy
Gui, CoinFlip: Font, s14, Arial
Gui, CoinFlip: Color, F5F5F5
Gui, CoinFlip: Add, Text, x10 y10 w400 h50 Center cBlue, COIN FLIP PREDICTOR 💰
Gui, CoinFlip: Add, Text, x10 y60 w400 h20 Center vCoinFlipOutput, 
Gui, CoinFlip: Add, Button, x10 y100 w400 h30 gPredictCoinFlip, Predict 🎯
Gui, CoinFlip: Add, Button, x10 y140 w400 h30 gClearCoinFlipOutput, Clear ❌
Gui, CoinFlip: Add, Button, x10 y180 w400 h30 gBackToMainMenu, Back ↩️
Gui, CoinFlip: Add, Text, x10 y220 w400 h20 cRed, V2
Gui, CoinFlip: Show, w420 h250 Center, Coin Flip Predictor
return

ShowCredits:
MsgBox, 64, Credits, Credits to Drop10k
return

BackToMainRoulette:
Gui, Roulette: Destroy
GoSub, MainMenu
return

BackToMainBlackjack:
Gui, Blackjack: Destroy
GoSub, MainMenu
return

PredictCoinFlip:
GuiControl, CoinFlip:, PredictCoinFlip, BackgroundBlue
Sleep 100
GuiControl, CoinFlip:, PredictCoinFlip, BackgroundWhite
GuiControl, CoinFlip:, CoinFlipOutput, Loading...
Sleep 1000  ; Simulate loading time (1 second)
Random, rand, 1, 2
if (rand = 1) {
    GuiControl, CoinFlip:, CoinFlipOutput, Red 🔴
} else {
    GuiControl, CoinFlip:, CoinFlipOutput, Black ⚫
}
return

ClearRouletteOutput:
GuiControl, Roulette:, RouletteOutput,
return

ClearBlackjackOutput:
GuiControl, Blackjack:, BlackjackOutput,
GuiControl, Blackjack:, HandInput,
return

ClearCoinFlipOutput:
GuiControl, CoinFlip:, CoinFlipOutput,
return

BackToMainMenu:
Gui, CoinFlip: Destroy
GoSub, MainMenu
return

GenerateRouletteRole:
GuiControl, Roulette:, GenerateRouletteRole, BackgroundBlue
Sleep 100
GuiControl, Roulette:, GenerateRouletteRole, BackgroundWhite
GuiControl, Roulette:, RouletteProgress, 0
GuiControl, Roulette:, RouletteOutput, 
Loop, 100 {
    GuiControl, Roulette:, RouletteProgress, %A_Index%
    Sleep 20
}
Random, rand, 1, 20
if (rand = 1) {
    GuiControl, Roulette:, RouletteOutput, GREEN ♦️
    GuiControl, Roulette:, RouletteOutput, Green
} else {
    Random, rand, 1, 2
    if (rand = 1) {
        GuiControl, Roulette:, RouletteOutput, RED ❤️
        GuiControl, Roulette:, RouletteOutput, Red
    } else {
        GuiControl, Roulette:, RouletteOutput, BLACK ⚫
        GuiControl, Roulette:, RouletteOutput, Black
    }
}
return

CheckBlackjack:
    GuiControlGet, handValue, Blackjack:, HandInput
    if (handValue = "")
        return
    ; Convert hand value to integer for comparison
    handValue := handValue + 0
    if (handValue > 21) {
        GuiControl, Blackjack:, BlackjackOutput, Busted!
        return
    }
    if (handValue = 21) {
        GuiControl, Blackjack:, BlackjackOutput, Blackjack!
        return
    }
    ; Basic strategy rules
    if (handValue <= 8) {
        GuiControl, Blackjack:, BlackjackOutput, Hit
    } else if (handValue = 9) {
        GuiControl, Blackjack:, BlackjackOutput, Double Down (Hit)
    } else if (handValue = 10) {
        GuiControl, Blackjack:, BlackjackOutput, Double Down (Hit)
    } else if (handValue = 11) {
        GuiControl, Blackjack:, BlackjackOutput, Double Down
    } else if (handValue = 12) {
        GuiControl, Blackjack:, BlackjackOutput, Stand (Hit against dealer 4-6)
    } else if (handValue >= 13 && handValue <= 16) {
        GuiControl, Blackjack:, BlackjackOutput, Stand (Hit against dealer 2-6)
    } else if (handValue == 17) {
        GuiControl, Blackjack:, BlackjackOutput, Stand (Hit against dealer 2-8)
    } else if (handValue == 18) {
        GuiControl, Blackjack:, BlackjackOutput, Stand (Hit against dealer 2-8, Stand against dealer 9-A)
    } else if (handValue == 19) {
        GuiControl, Blackjack:, BlackjackOutput, Stand (Stand against dealer 2-6, Hit against dealer 7-A)
    } else if (handValue == 20) {
        GuiControl, Blackjack:, BlackjackOutput, Stand
    } else {
        GuiControl, Blackjack:, BlackjackOutput, Stand
    }
return

GuiClose:
ExitApp
return
