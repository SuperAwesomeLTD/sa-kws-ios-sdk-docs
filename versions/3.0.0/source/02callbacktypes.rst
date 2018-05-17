The callbacks
=============

As mentioned previously, the communication between your app and the SDK will be made through a single entry point, the **ComplianceSDK** and the return response will be in a form of a **callback**.

This callback will be as **model protocols** that can be of the type:

* **ModelProtocol**
* **BaseErrorModelProtocol**

The ModelProtocol
-----------------

Most of the callbacks of the Kids Web Service SDK will have an **model protocol** that you'll be able retrieve information from.

These will be explained in more details in the description of each functionality but, as an example, let's look at the usage of **RandomUsernameModelProtocol** when generating a random username.

This will be using the **UsernameServiceProtocol**, briefly mentioned in the previous page.

.. code-block:: swift

	let myEnvironment = MyEnvironment()
	let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
	let usernameService = sdk.getService(withType: UsernameServiceProtocol.self)

	usernameService?.getRandomUsername() { (result, error) in
		
        if result != nil {
          //Success! We have a 'result' we can use. Let's get the username
          var myGeneratedRandomUsername = result?.randomUsername 
        } else {
          //Uh-oh! It seems there's an error...
        }
    }

The **RandomUsernameModelProtocol** will be explained better and with more detail in it's appropriate page, but in this snippet we can see that when the **result** is not null, we can access the property **randomUsername** that will be your random generated username for that method call.

What about in the eventuality of something going wrong? Fear nothing: enter **BaseErrorModelProtocol** models.

The BaseErrorModelProtocol
--------------------------

When something goes wrong while using the Kids Web Services functionalities, an error will be presented in the callback. This error can be due to multiple things and the SDK will be ready to catch the issue, providing informative data so you can respond in the best possible way to the different outcomes.

This error response is in a form of a KWS **ErrorWrapperModelProtocol** - as the name suggests, this will be a wrapper around the errors that can occur.

The **ErrorWrapperModelProtocol** object has the following fields:

=========== ==================================== ==========
Field 		Type 					             Meaning
=========== ==================================== ==========
code 		Integer  				  			 The error code, optional value
codeMeaning String 				   	  			 The code meaning, optional value
invalid     InvalidTypeErrorWrapperModelProtocol The invalid wrapper object, optional value
message 	String 				   	             The error message, optional value
error 		String 				   	             A different type of error, optional value
errorCode 	String 				   	             A different type of error code, optional value
=========== ==================================== ==========

The **IInvalidTypeErrorWrapperModel** object has the following fields:

=============== ================== ========
Field  			Type     	       Meaning
=============== ================== ========
password        ErrorModelProtocol The invalid type of 'password', optional value
username        ErrorModelProtocol The invalid type of 'username', optional value
addressCountry 	ErrorModelProtocol The invalid type of 'addressCountry', optional value
addressPostCode ErrorModelProtocol The invalid type of 'addressPostCode', optional value
addressStreet 	ErrorModelProtocol The invalid type of 'addressStreet', optional value
country         ErrorModelProtocol The invalid type of 'country', optional value
dateOfBirth 	ErrorModelProtocol The invalid type of 'dateOfBirth', optional value
oauthClientId 	ErrorModelProtocol The invalid type of 'oauthClientId', optional value
parentEmail 	ErrorModelProtocol The invalid type of 'parentEmail', optional value
permissions 	ErrorModelProtocol The invalid type of 'permissions', optional value
token           ErrorModelProtocol The invalid type of 'token', optional value
=============== ================== ========

The **ErrorModelProtocol** object has the following fields:

=========== ======== ========
Field 		Type     Meaning
=========== ======== ========
message     String 	 The message of the invalid type, optional value
code        Integer  The code of the invalid type, optional value
codeMeaning String   The codeMeaning of the invalid type, optional value
=========== ======== ========

As you can see, the error models contain **optional fields**. This is by desing and to help handling the different errors that can occur in a graceful way, splitting them by layers of details that are easier to manage.

We will now see an example of an actual error and our suggestion on how to deal with it:

.. code-block:: swift

	let myEnvironment = MyEnvironment()
	let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
	let myService = sdk.getService(withType: MyServiceProtocol.self)

	myService?.methodCall() { (result, error) in
		
        if result != nil {
          //Success! All went well
        } else {
          //Uh-oh! It seems there's an error...

          if let myError : ErrorWrapper = (error as! ErrorWrapper){
            //use the error accordingly
          
        }
    }