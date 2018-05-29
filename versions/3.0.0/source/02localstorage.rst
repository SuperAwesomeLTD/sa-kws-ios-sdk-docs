Local storage
==============

The Kid Web Service SDK allows you to quickly and swiftly manage your session.

This is done using the **SessionServiceProtocol** and its methods.

But before that, do you know the **LoggedUserModelProtocol** that has been mentioned before? Well, there's an actual implementation of that **model protocol** that will be very useful for the next steps.

The logged model implementation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We named it **LoggedUserModel**, no surprises here.

This model has the following fields:

============== ========= ========
Field          Type      Meaning
============== ========= ========
token          String    The token of the current authenticated user
id             Integer   The id of the current authenticated user
tokenData      TokenData The token data object
============== ========= ========

The **TokenData** object has the following fields:

============== ========= ========
Field          Type      Meaning
============== ========= ========
userId         Integer   The user id for the parsed token
appId          Integer   The app id for the parsed token
clientId       String    The client id for the parsed token
scope          String    The scope for the parsed token
iss            String    The issue entity for the parsed token
iat            Long      The issued time as timestamp
exp            Long      The expiry time as timestamp
============== ========= ========

To handle the session and the token data, these models will come in handy. 

Speaking of which, what about that **TokenData** model? Well, that's another internal **model** of the SDK that will map the token into readable data.

There's two ways of getting the data from the authentication token:
	
	* using the **Utils** class - see documentation page
	* by storing the user using the **SessionServiceProtocol** - will be looked into next

.. note::

	All of the above are only suggestions on how to handle a session and the token data. 

Let's talk about the session now.

Store a user
^^^^^^^^^^^^

To store a certain user in your local storage, just call:

	* **saveLoggedUser**

This function will take: 

============== ======================== ==========
Value           Type              	     Meaning
============== ======================== ==========
user            LoggedUserModelProtocol  A valid session model
============== ======================== ==========

And should look like:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let sessionService = sdk.getService(withType: SessionServiceProtocol.self)

  //'user' is considered a valid model, as a LoggedUserModelProtocol implementation

  let success = sessionService?.saveLoggedUser(user: user)


This is a **sync** operation that returns:

===== =========
Type  Meaning
===== =========
Bool  Success of the operation
===== =========

Is there a user stored locally?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To check if there's a valid cached user, just call:

	* **isUserLoggedIn**

This function will **not** take any parameters.

It should look like:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let sessionService = sdk.getService(withType: SessionServiceProtocol.self)

  let isUserLoggedIn = sessionService?.isUserLoggedIn()

This is a **sync** operation that returns:

===== =========
Type  Meaning
===== =========
Bool  Success of the operation
===== =========

Get current stored user
^^^^^^^^^^^^^^^^^^^^^^^

To store a certain user in your local storage, just call:

	* **getLoggedUser**

This function will **not** take any parameters.

It should look like:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let sessionsService = sdk.getService(withType: SessionServiceProtocol.self)
  
  //we get a 'currentLoggedUser' by casting it to a 'LoggedUserModelProtocol' implementation, the 'LoggedUserModel'
  let currentLoggedUser = sessionsService?.getLoggedUser() as? LoggedUserModel

  return currentLoggedUser

This is a **sync** operation that returns:

================== =========
Type               Meaning
================== =========
ILoggedUserModel   If non-null, the currently locally cached user
================== =========

.. note::
	You need to cast the response model of **getCurrentUser** to the **LoggedUserModel** implementation highlighted in the beginning of this page.


Logout current stored user
^^^^^^^^^^^^^^^^^^^^^^^^^^

To logout a certain user from your local storage, just call:
  
  * **clearLoggedUser**

This function will **not** take any parameters.

It should look like:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let sessionsService = sdk.getService(withType: SessionServiceProtocol.self)

  let success = sessionService?.clearLoggedUser()

This is a **sync** operation that returns:

============== ================== =========
Value           Type               Meaning
============== ================== =========
success         Bool               Success of the operation
============== ================== =========

.. note::
	After a user is logged out you won't be able to perform any of the SDK actions, like obtaining details, checking score, etc.

