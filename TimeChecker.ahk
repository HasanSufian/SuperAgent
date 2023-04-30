checkDate(){
    if (A_MM > 10){
        timeCheckerGui()
    }
}
timeCheckerGui(){
    Gui timeCheckerGui:new, -SysMenu +Owner
    Gui,add,Text,,Software needs to be updated.
    gui,add,link,,You can find the new version <a href="#">here</a>
    gui,show,w300 h300,Old Version
}
checkDate()