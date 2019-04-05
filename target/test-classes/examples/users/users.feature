Feature: sample karate test script

  Background:
  * url 'http://10.1.14.62:8088/mockNumberConversionSoapBinding'

  Scenario: Probar servicio mockeado

  Given request
    """
   <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://www.dataaccess.com/webservicesserver/">
   <soapenv:Body>
      <web:NumberToDollars>
         <web:dNum>12</web:dNum>
      </web:NumberToDollars>
   </soapenv:Body>
   </soapenv:Envelope>
    """
  When soap action 'mockNumberConversionSoapBinding'
  Then status 200
  And print 'AAAAAAAAAAAAA1:' , response
  And match /Envelope/Body/NumberToDollarsResponse/NumberToDollarsResult == 'Es mayor a 10'







#Background:
#* url 'https://jsonplaceholder.typicode.com'
#
#Scenario: get all users and then get the first user by id
#
#Given path 'users'
#When method get
#Then status 200
#
#* def first = response[0]
#
#Given path 'users', first.id
#When method get
#Then status 200
#
#Scenario: create a user and then get it by id
#
#* def user =
#"""
#{
#    "name": "Test User",
#    "username": "testuser",
#    "email": "test@user.com",
#    "address": {
#      "street": "Has No Name",
#      "suite": "Apt. 123",
#      "city": "Electri",
#      "zipcode": "54321-6789"
#    }
#}
#"""
#
#Given url 'https://jsonplaceholder.typicode.com/users'
#And request user
#When method post
#Then status 201
#
#* def id = response.id
#* print 'created id is: ' + id
#
#Given path id
# When method get
# Then status 200
# And match response contains user

