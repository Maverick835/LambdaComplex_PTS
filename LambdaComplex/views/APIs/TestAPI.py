import json
from flask import jsonify, request ,Blueprint
from SessionManagement import SessionManagement
from LambdaComplex_Entities.Common import Response

TestAPI = Blueprint("TestAPI",__name__)


@TestAPI.route('/DataRead/<userId>')
@SessionManagement('Admin,Lead,Dev')
def DataRead(userId):
    data =  [
        {
            "ID": 1,
            "Name": "John Doe",
            "Age": 30,
            "JoiningDate": "2023-01-15",
            "Progress": 50,
            "Rating": 4.2,
            "availability": 1
        },
        {
            "ID": 2,
            "Name": "Jane Smith",
            "Age": 25,
            "JoiningDate": "2022-11-20",
            "Progress": 75,
            "Rating": 3.9,
            "availability": 0
        },
        {
            "ID": 3,
            "Name": "Michael Johnson",
            "Age": 35,
            "JoiningDate": "2023-03-05",
            "Progress": 90,
            "Rating": 4.5,
            "availability": 1
        },        {
            "ID": 4,
            "Name": "John Doe",
            "Age": 30,
            "JoiningDate": "2023-01-15",
            "Progress": 50,
            "Rating": 4.2,
            "availability": 1
        },
        {
            "ID": 5,
            "Name": "Jane Smith",
            "Age": 25,
            "JoiningDate": "2022-11-20",
            "Progress": 75,
            "Rating": 3.9,
            "availability": 0
        },
        {
            "ID": 6,
            "Name": "Michael Johnson",
            "Age": 35,
            "JoiningDate": "2023-03-05",
            "Progress": 90,
            "Rating": 4.5,
            "availability": 1
        },        {
            "ID": 7,
            "Name": "John Doe",
            "Age": 30,
            "JoiningDate": "2023-01-15",
            "Progress": 50,
            "Rating": 4.2,
            "availability": 1
        },
        {
            "ID": 8,
            "Name": "Jane Smith",
            "Age": 25,
            "JoiningDate": "2022-11-20",
            "Progress": 75,
            "Rating": 3.9,
            "availability": 0
        },
        {
            "ID": 9,
            "Name": "Michael Johnson",
            "Age": 35,
            "JoiningDate": "2023-03-05",
            "Progress": 90,
            "Rating": 4.5,
            "availability": 1
        },        {
            "ID": 10,
            "Name": "John Doe",
            "Age": 30,
            "JoiningDate": "2023-01-15",
            "Progress": 50,
            "Rating": 4.2,
            "availability": 1
        },
        {
            "ID": 11,
            "Name": "Jane Smith",
            "Age": 25,
            "JoiningDate": "2022-11-20",
            "Progress": 75,
            "Rating": 3.9,
            "availability": 0
        },
        {
            "ID": 12,
            "Name": "Michael Johnson",
            "Age": 35,
            "JoiningDate": "2023-03-05",
            "Progress": 90,
            "Rating": 4.5,
            "availability": 1
        },        {
            "ID": 13,
            "Name": "John Doe",
            "Age": 30,
            "JoiningDate": "2023-01-15",
            "Progress": 50,
            "Rating": 4.2,
            "availability": 1
        },
        {
            "ID": 14,
            "Name": "Jane Smith",
            "Age": 25,
            "JoiningDate": "2022-11-20",
            "Progress": 75,
            "Rating": 3.9,
            "availability": 0
        },
        {
            "ID": 15,
            "Name": "Michael Johnson",
            "Age": 35,
            "JoiningDate": "2023-03-05",
            "Progress": 90,
            "Rating": 4.5,
            "availability": 1
        },
    ]
    return jsonify(data)


@TestAPI.route('/Resource/<userId>')
@SessionManagement('Admin,Lead,Dev')
def TestResource(userId):
    try:
        response = Response()
        resource = {} 

        resource["Fields"] = {
            "ID" : {"type" : "number"},
            "Name" : {"type" : "string"},
            "Age" : {"type" : "number"},
            "JoiningDate" : {"type": "date"},
            "Progress": {"type": "number"},
            "Rating": {"type": "number"},
            "Availability": {"type": "number"},
        }

        resource["Columns"] = [
            {
                "field" : "ID",
                "title" : "Employee ID",
            },
            {
                "field" : "Name",
                "title" : "Employee Name",
            },
            {
                "field" : "Age",
                "title" : "Employee Age",
            },
            {
                "field" : "JoiningDate",
                "title" : "Employee joining date",
                "format" : "{0:dd-MM-yyyy}",
            },
            {
                "field": "Availability", 
                "title": "Availability",
                "template": "<div id=\"badge#: ID #\"></div>",
                "width":200,
            },
            {
                "field": "Progress", 
                "title": "Progress",
                "template": "<div id=\"progressBar#: ID #\"></div>",
                "width":200,
            },
            {
                "field": "Rating", 
                "title": "Rating",
                "template": "<div id=\"ratingBar#: ID #\"></div>",
                "width":200,
            },
        ]
        
        resource["ReadURL"] = "TestAPI/DataRead/" + userId
        resource["EditURL"] = "TestAPI/DataRead/" + userId
        resource["DeleteURL"] = "TestAPI/DataRead/" + userId
        
        resource["Template"] = """
            <div class="list-item">
                <span class="list-item__field"><strong>ID:</strong> #: ID #</span>
                <span class="list-item__field"><strong>Name:</strong> #: Name #</span>
                <span class="list-item__field"><strong>Age:</strong> #: Age #</span>
                <span class="list-item__field"><strong>Joining Date:</strong> #: JoiningDate #</span>
            </div>
        """
        response.Data = resource
        response.WasSuccessful = True
    except Exception as ex:
        response.Message = str(ex)
        response.WasSuccessful = False
        
    jsonRes = jsonify(response.__dict__) 
    return jsonRes
