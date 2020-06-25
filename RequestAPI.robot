*** Settings ***
Documentation     Request Clã Clash Royale
Library           RequestsLibrary
Library           Collections

*** Variables ***
${URL_API}      https://api.clashroyale.com
${auth}   eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImUzZDdhODVmLWQ0NGUtNGQyYy04NDE4LWIzNjhlNDRlOGIxNCIsImlhdCI6MTU5MzAyOTM3OCwic3ViIjoiZGV2ZWxvcGVyLzViMmZlMjIwLWZmYjItMDkzOC0wMzIyLTNlYjhmNDE1YmI4NCIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxOTEuMjU0LjkwLjExNCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.snh7qchDyndnxRQP5ZyKCdvO3aIpaJGhld9EOnT2lHsANXMnZaPMVz1pmU_Z51SawRhH_XeUTrJjENKbwa3UcQ
@{headers}    {'User-Agent': 'python-requests/2.24.0', 'Accept-Encoding': 'gzip, deflate', 'Accept': '*/*', 'Connection': 'keep-alive'}

#*** Test Cases ***
#Busca dos Clans Clash Royale
#    Conectar API
#    Buscar Lista Cla

*** Keywords ***
Conectar API
    Create Session   CRAPI   ${URL_API}
##https://api.clashroyale.com/v1/clans?name=The%20resistance&locationId=57000038&Authorization=Bearer%20eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImQyYzNjY2UwLTUzODktNDY5ZC1iYzU3LTc5NDZmMmJkYmY1NSIsImlhdCI6MTU5MzEwMjU5OSwic3ViIjoiZGV2ZWxvcGVyLzViMmZlMjIwLWZmYjItMDkzOC0wMzIyLTNlYjhmNDE1YmI4NCIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNTIuMjUwLjg5LjIxMyJdLCJ0eXBlIjoiY2xpZW50In1dfQ.i6cFHHF_0gOC_t08R3ZjUOLaBCOxUrnbXWT9M5A2h8vZ5kf_wPv4DcW8bCc7HGzTUT5RxlTKju0FNqEsjcQcrg

Buscar Lista Cla
    ${RetornoListaCla}   Get Request     CRAPI    v1/clans
    Log     ${RetornoListaCla.text}
