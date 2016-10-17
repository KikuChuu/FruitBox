class QuestBattleBot {
  SPEED_UP_QUEST := "FANTASICA IMAGES/Quest/QuestBattle/speed_up_quest-" . width . "_" . height . ".png"
  UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/unit_points-" . width . "_" . height . ".png"
  UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/unit_list-" . width . "_" . height . ".png"
  ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/ally_list-" . width . "_" . height . ".png"
  TOTAL_UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/total_unit_points-" . width . "_" . height . ".png"
  REMAINING_UNIT_POINTS_45 := "FANTASICA IMAGES/Quest/QuestBattle/45_remaining_points-" . width . "_" . height . ".png"
  DEPLOYABLE_UNITS_4 := "FANTASICA IMAGES/Quest/QuestBattle/four_units_deployable-" . width . "_" . height . ".png"
  DEPLOYABLE_ALLIES_2 := "FANTASICA IMAGES/Quest/QuestBattle/two_deployable_allies-" . width . "_" . height . ".png"
  CONFIRM := "FANTASICA IMAGES/Quest/QuestBattle/confirm-" . width . "_" . height . ".png"
  CANCEL := "FANTASICA IMAGES/Quest/QuestBattle/cancel-" . width . "_" . height . ".png"
  MINA_DIALOG := "FANTASICA IMAGES/Quest/QuestBattle/mina_dialog-" . width . "_" . height . ".png"
  detector := new Detector
 
  __New() {
    global DEPLOY_NUMBER
    this.questBattlePoints := new QuestBattlePoints
    this.databaseQuestBattlePoints := new databaseQuestBattlePoints
    this.databaseTowerBattlePoints := new databaseTowerBattlePoints
    this.controller := new Controller

    this.deployableMapSquareState := true
    this.deployUnitState := true
    this.deployAllyState := true

    this.DEFAULT_UNIT_USED_VALUE := 0
    this.unitSize := DEPLOY_NUMBER ; DEPLOY_NUMBER is defined in the UserInput.txt file
    this.unitUsed := this.DEFAULT_UNIT_USED_VALUE

    this.keys := []
  }

  pushKey(key) {
    this.keys.push(key)
  }

  clearKeys() {
    this.keys := []
  }
 
  getUnitSize() {
    return this.unitSize
  }

  getUnitUsed() {
    return this.unitUsed
  }

  setUnitUsed(theValue) {
    this.unitUsed := theValue
  }

  setMapSquareStateOff() {
    this.deployableMapSquareState := false
  }

  setMapSquareStateOn() {
    this.deployableMapSquareState := true
  }

  getMapSquareState() {
    return this.deployableMapSquareState
  }

  isMapFull() {
    if (this.getMapSquareState() == false) {
      return true
    }
    else {
      return false
    }
  }

  setDeployUnitOff() {
    this.deployUnitState := false
  }

  setDeployUnitOn() {
    this.deployUnitState := true
  }

  getDeployUnitState() {
    return this.deployUnitState
  }

  setDeployAllyOff() {
    this.deployAllyState := false
  }

  setDeployAllyOn() {
    this.deployAllyState := true
  }

  getDeployAllyState() {
    return this.deployAllyState
  }

  skipDialog() {
    if (this.detector.detect(this.MINA_DIALOG)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  isQuestBattle() {
    if (this.detector.detect(this.UNIT_POINTS)) {
      return true
    }
    else {
      return false
    }
  }

  isPlacingUnit() {
    if (this.detector.detect(this.CANCEL)) {
      return true
    }
    else {
      return false
    }
  }

  searchPoint() {
    loop % this.questBattlePoints.getKeySetSize() {
      this.questBattlePoints.nextKey(key)
      point := this.questBattlePoints.getPoint()
      this.controller.setPoint(point[1], point[2])
      this.controller.clickAndUpdateHistory()

      if (this.detector.detect(this.CONFIRM)) {
        this.questBattlePoints.index--
        return true
      }
    }
    return false
  }

  searchTowerDatabasePoint(theTower) {
    if (this.databaseTowerBattlePoints.getKeySetSize() == 0) {
      this.databaseTowerBattlePoints.readFromTable(theTower)
    }

    loop % this.databaseTowerBattlePoints.getKeySetSize() {
      this.databaseTowerBattlePoints.nextKey(key)
      point := this.databaseTowerBattlePoints.getPoint()
      this.controller.setPoint(point[1], point[2])
      this.controller.clickAndUpdateHistory()

      if (this.detector.detect(this.CONFIRM)) {
        this.databaseTowerBattlePoints.index--
        return true
      }
    }
    return false
  }

  searchDatabasePoint(theEpisode, theQuest) {
    if (this.databaseQuestBattlePoints.getKeySetSize() == 0) {
      this.databaseQuestBattlePoints.readFromTable(theEpisode, theQuest)
    }

    loop % this.databaseQuestBattlePoints.getKeySetSize() {
      this.databaseQuestBattlePoints.nextKey(key)
      point := this.databaseQuestBattlePoints.getPoint()
      this.controller.setPoint(point[1], point[2])
      this.controller.clickAndUpdateHistory()

      if (this.detector.detect(this.CONFIRM)) {
        this.databaseQuestBattlePoints.index--
        return true
      }
    }
    return false
  }

  confirmPlacement() {
    if (this.detector.detect(this.CONFIRM)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  cancelPlacement() {
    if (this.detector.detect(this.CANCEL)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  speedUpQuest() {
    if (this.detector.detect(this.SPEED_UP_QUEST)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }


  isUnitListAvailable() {
    if (this.detector.detect(this.UNIT_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  unitList() {
    if (this.detector.detect(this.UNIT_LIST)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 500
    }
  }

  isAllyListAvailable() {
    if (this.detector.detect(this.ALLY_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  allyList() {
    if (this.detector.detect(this.ALLY_LIST)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 500
    }
  }
}
