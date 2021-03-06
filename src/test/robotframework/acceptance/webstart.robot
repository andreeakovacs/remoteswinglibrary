*** Settings ***
Library    RemoteSwingLibrary        debug=True
Library    FileServer
Suite Setup     FileServer.Start
Suite Teardown    FileServer.Stop
Force tags      Webstart

*** Variables ***
${WEBSTART DIR}=    ${CURDIR}/webstart


*** Test Cases ***
Webstart Test
    [Timeout]    60 seconds
    Start Application    test-app    javaws ${WEBSTART DIR}/test-app/test-application.jnlp    30    close_security_dialogs=True
    Set Jemmy Timeouts     15
    Select Main Window
    List Components In Context
    Ensure Application Should Close    5 seconds   Push Button  systemExitButton
