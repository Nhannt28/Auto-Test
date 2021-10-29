*** Settings ***
Library    AppiumLibrary
Library    String



Resource    ../resources/devices/${device}.robot
Resource    ../resources/${ENV}/config.robot
Resource    ../variables/language/${lang}.robot
