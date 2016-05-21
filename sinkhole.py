#!/usr/bin/env python

from __future__ import print_function
import sys
import SocketServer
from threading import Thread
from datetime import datetime

port = sys.argv[1] 
logfile = 'logs/' + 'sinkhole_'+str(port)+'.log'
lf = open(logfile,'a')

infectionlog = 'logs/' + 'infection.log'
inf = open(infectionlog,'a')

class service(SocketServer.BaseRequestHandler):
    def handle(self):
        data = 'dummy'
        connectiontime=str(datetime.now()) 
	lf.write(connectiontime + " Client " + str(self.client_address) + " connected on port " + str(port) + '\n')
	lf.flush()        
	self.request.send("HTTP/1.0 200 OK\n")
	self.request.send("Content-Type: text/plain\n")
	self.request.send("X-Sinkhole: malware sinkhole\n")

	dumpfile = 'data/' + str(port) + '/' + connectiontime.replace (" ", "_") + str(self.client_address).replace (" ", "_") + '_' + str(port) + '.data'
 	df = open(dumpfile, 'w')

	while len(data):
            data = self.request.recv(1024)
	    datahex = (" ".join(hex(ord(n)) for n in data)) 
	    if datahex.find('0x42 0x0 0x45 0x0 0x54 0x0 0x54 0x0 0x41 0x0') != -1:
	        inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "BETTA" + '\n')
		inf.flush()
            if datahex.find('0x88 0x26 0x87 0x01 0x70 0x0 0x0 0x0 0x53 0x45 0x52 0x56') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "SERV" + '\n')
                inf.flush()
	    if (data.find ('GET /3000') != -1) and (data.find ('ndbssh.com') != -1):
	   	inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "ndbssh" + '\n')
	        inf.flush() 
            if data.find ('trandocs') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Enfal" + '\n')
                inf.flush()
            if data.find ('POST http://dell.tvcaotw.com:80/') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "tvcaotw" + '\n')
                inf.flush()
            if data.find ('Gh0st') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Gh0st" + '\n')
                inf.flush()
            if data.find ('V0.9.9a-') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "v099a" + '\n')
                inf.flush()
            if data.find ('V0.9.11') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "v0911" + '\n')
                inf.flush()
            if data.find ('/xnocz1') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "xnocz1" + '\n')
                inf.flush()
            if data.find ('POST /cgi-bin/Trpq8.cgi') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Enfal" + '\n')
                inf.flush()
            if data.find ('POST /cgi-bin/Owpq4.cgi') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Enfal" + '\n')
                inf.flush()
            if data.find ('httpdocs/mm/') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Enfal" + '\n')
                inf.flush()
            if data.find ('E-HOST:') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Haoni" + '\n')
                inf.flush()
            if data.find ('GET /pingmac.asp?uid=') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "ClickDownloadMac" + '\n')
                inf.flush()
            if data.find ('GET /country.asp?st=') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Bifrose" + '\n')
                inf.flush()
            if data.find ('GET /cjh/update/cjhSetup.exe') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Trojan.DownLoader8.17569" + '\n')
                inf.flush()
            if data.find ('POST /docx/logon.php HTTP/1.1') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Witthy" + '\n')
                inf.flush()
            if data.find ('ju4s8ak') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Juasek" + '\n')
                inf.flush()
            if data.find ('\\\\\\\\\\\\\\\\') != -1:
                inf.write(connectiontime + "," + str(self.client_address[0]) + "," + str(port) + "," + "Slasher" + '\n')
                inf.flush()
	    df.write(data)	
	    df.flush()

	disconnecttime=str(datetime.now())
        df.close() 
	lf.write(disconnecttime + " Client " + str(self.client_address) + " disconnected on port " + str(port) + '\n')
        self.request.close()
	lf.flush()

class ThreadedTCPServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    pass

t = ThreadedTCPServer(('',int(port)), service)
t.serve_forever()
