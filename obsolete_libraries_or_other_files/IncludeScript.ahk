﻿#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; =================================================================================================
; ----------------------------- USER Configuration files
; =================================================================================================
#include UserInput.txt

; =================================================================================================
; ---------------------------------- Non-member helper functions ----------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\Decorate.ahk
#include %A_ScriptDir%\includes\lib\EncloseInSingleQuotes.ahk
#include %A_ScriptDir%\includes\lib\GuiConstructor.ahk
#include %A_ScriptDir%\includes\lib\Log.ahk
#include %A_ScriptDir%\includes\lib\PrettyPrintAssociativeArray.ahk
#include %A_ScriptDir%\includes\lib\PrintAssociativeArrayOfArrays.ahk
#include %A_ScriptDir%\includes\lib\SB.ahk

; =================================================================================================
; ---------------------------------------- GDI+ functions -----------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\Gdip.ahk

; =================================================================================================
; ------------------------------------------- Classes ---------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\AllyApprovalPageBot.ahk
#include %A_ScriptDir%\includes\lib\AllyPageBot.ahk
#include %A_ScriptDir%\includes\lib\AppPlayerBot.ahk
#include %A_ScriptDir%\includes\lib\BingoBot.ahk
#include %A_ScriptDir%\includes\lib\ClubRookBot.ahk
#include %A_ScriptDir%\includes\lib\ConnectionErrorBot.ahk
#include %A_ScriptDir%\includes\lib\Controller.ahk
#include %A_ScriptDir%\includes\lib\DatabaseQuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\DatabaseTowerBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\Detector.ahk
#include %A_ScriptDir%\includes\lib\FantaTacticsBot.ahk
#include %A_ScriptDir%\includes\lib\InboxBot.ahk
#include %A_ScriptDir%\includes\lib\LoginBonusBot.ahk
#include %A_ScriptDir%\includes\lib\MainPageBot.ahk
#include %A_ScriptDir%\includes\lib\MaintenanceBot.ahk
#include %A_ScriptDir%\includes\lib\ObjectInteraction.ahk 
#include %A_ScriptDir%\includes\lib\QuestAllyBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattleBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\QuestMenuBot.ahk
#include %A_ScriptDir%\includes\lib\QuestUnitBot.ahk
#include %A_ScriptDir%\includes\lib\QuestResultsBot.ahk
#include %A_ScriptDir%\includes\lib\RollTheDiceBot.ahk
#include %A_ScriptDir%\includes\lib\SQLiteDB.ahk
#include %A_ScriptDir%\includes\lib\StartPageBot.ahk
#include %A_ScriptDir%\includes\lib\TowerBattleBot.ahk
#include %A_ScriptDir%\includes\lib\TowerBot.ahk
#include %A_ScriptDir%\includes\lib\TowerResultsBot.ahk
#include %A_ScriptDir%\includes\lib\TrainingBot.ahk
#include %A_ScriptDir%\includes\lib\TrainingPageBot.ahk

; =================================================================================================
; --------------------------------------- SQLite scripts -------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\setup\InitializeDatabaseQuestBattlePoints.ahk
#include %A_ScriptDir%\includes\setup\InitializeTowerPoints.ahk

; =================================================================================================
; ----------------------------------- Global variables --------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\GlobalConstants.ahk

