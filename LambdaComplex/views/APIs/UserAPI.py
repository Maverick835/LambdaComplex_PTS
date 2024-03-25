import json
from flask import Flask, jsonify, session, render_template, request, redirect, url_for,Blueprint
from SessionManagement import SessionManagement
from LambdaComplex_DataAccess.UserModule import UserModule
from LambdaComplex_Entities.Common import Response

UserAPI = Blueprint("UserAPI",__name__)

@UserAPI.route('/GetUserDetails/<userId>')
@SessionManagement('Admin,Lead,Dev')
def GetUserDetails(userId):
    try:
        response = Response()
        userDetails = UserModule.GetUserDetails(userId)
        response.Data = userDetails
        response.WasSuccessful = True
    except Exception as ex:
        response.Message = str(ex)
        response.WasSuccessful = False

    return jsonify(response.__dict__)


@UserAPI.route('/UpdateUserDetails/', methods = ['POST'])
@SessionManagement('Admin,Lead,Dev')
def UpdateUserDetails():
    try:
        response = Response()        
        userDetails = json.loads(request.data)
        UserModule.UpdateUserDetails(userDetails)
        response.Data  = None
        response.WasSuccessful = True
    except Exception as ex:
        response.Message = str(ex)
        response.WasSuccessful = False

    return jsonify(response.__dict__)


@UserAPI.route('/ChangePassword/', methods = ['POST'])
@SessionManagement('Admin,Lead,Dev')
def ChangePassword():
    try:
        response = Response()        
        userDetails = json.loads(request.data)
        UserModule.ChangePassword(userDetails)
        response.Data  = None
        response.WasSuccessful = True
    except Exception as ex:
        response.Message = str(ex)
        response.WasSuccessful = False

    return jsonify(response.__dict__)