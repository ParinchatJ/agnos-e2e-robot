*** Settings ***

Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn
Library           YAMLLibrary

# Variables
Variables        ${CURDIR}/../test_data/data.yaml

# Page
Resource         ${CURDIR}/../pages/_global/open_browser.resource
Resource         ${CURDIR}/../pages/login/login.resource
Resource         ${CURDIR}/../pages/dashboard/dashboard.resource

# Keywords
Resource         ${CURDIR}/../keywords/open_browser.resource
Resource         ${CURDIR}/../keywords/login.resource
Resource         ${CURDIR}/../keywords/dashboard.resource