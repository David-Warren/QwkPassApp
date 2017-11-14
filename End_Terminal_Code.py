#!/usr/bin/env python
#title           :Termial_Code.py
#description     :Import data from a Firebase
#author          :Brendan Hart
#date            :10/15/2017
#version         :1.0
#usage           :python pyscript.py
#notes           : Qwkpass Terminal Script  
#python_version  :3.6.1
#==============================================================================

#Libraries
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import auth
from firebase import firebase
import requests
import datetime
import time
import glob
import json
import sys
import os

#Test Variables
test = '2l3TmZ1rRqhxWcPqS0FJbFhHtcp1' #This one is in DB
test2 = '2l3TmZ1rRqhxWcPqS0FJbFhHtcp2' #This one should not be in DB

#API Token
token = 'AIzaSyBIzEsqTlE5GvUHS1ZBxR8BNDnwGYzfxk4'
DNS = 'https://qwkpass.firebaseio.com/'
path = r'C:\Users/Brendan\Desktop\qwkpass-firebase-adminsdk-nsrie-62475f3567.json'
users = '/Users'

#Authentication
cred = credentials.Certificate(path)
default_app = firebase_admin.initialize_app(cred)
db = firebase.FirebaseApplication(DNS)

#Main
while 1==1:

    name = input('Please scan your pass! \n')

    info = db.get(users, name)
    info_str = (str(info))
        
    if info_str == 'None':
        print('Error! You are not registered!')
        
    else:
        #Update#
        db.put(DNS + 'Users/' + name, 'End Location', 'San Francisco')
        print('Thank you come again!')
        time.sleep(3)
        print()
        print()
        print()






