*** Settings ***
Library    AppiumLibrary




*** Variables ***
${email}             id=chat21.android.demo:id/email     
${password}          id=chat21.android.demo:id/password
${botãoLogin}        id=chat21.android.demo:id/login

*** Test Cases ***


Calculadora
        Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554     
...    appPackage=com.android.calculator2    appActivity=com.android.calculator2.Calculator 
...    automationName=Uiautomator2 
