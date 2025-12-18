import os
from dotenv import load_dotenv
TOKEN = "8561137105:AAEsY4BeR8cxeAbIZE-36eKv6j8Um42cKg0"

def gettoken():
    global TOKEN
    load_dotenv("config.env")
    TOKEN = os.environ.get("TOK")

gettoken()
if TOKEN == None:
    token = input("Please enter the TOKEN\nGenerated from Botfather : ")
    with open("config.env", "w") as f:
        f.write(f"TOK={token}")
    gettoken()
