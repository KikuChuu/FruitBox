class QuestAllyPageBot {
  ALLY_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/title-" . width . "_" . height . ".png"
  DEPLOY_ALLY := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/deploy_ally-" . width . "_" . height . ".png"
  EXIT_ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/back-" . width . "_" . height . ".png"
  detector := new Detector

  isAllyList() {
    if (this.detector.detect(this.ALLY_LIST_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isAlly() {
    if (this.detector.detect(this.DEPLOY_ALLY)) {
      return true
    }
    else {
      return false
    }
  }

  deployAlly() {
    if (this.detector.detect(this.DEPLOY_ALLY)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 500
    }
  }

  exitList() {
    if (this.detector.detect(this.EXIT_ALLY_LIST)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      this.setDeployAllyOff()
      sleep 500
    }
  }
}
