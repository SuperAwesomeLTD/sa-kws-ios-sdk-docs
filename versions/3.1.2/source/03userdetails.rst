Get user details
================

To obtain information on the user you're authenticated as you'll need to use the **UserServiceProtocol** and call:

* **getUser**

This function will take: 

============== ======== ========
Value           Type 	Meaning
============== ======== ========
userId          Int  	The current authenticated user id
token           String  The current authenticated user token
============== ======== ========

As such:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let user = sdk.getService(withType: UserServiceProtocol.self)
  
  userService?.getUser(userId: 123, token: "AAA.BBB.CCC") { (result, error) in

    if result != nil {
      //Success! We have a valid result
    } else {
      //Uh-oh! It seems there's an error...
    }
  }


The callback will pass the following values on completion:

=========== ======================== ======
Value       Type                     Meaning
=========== ======================== ======
result      UserDetailsModelProtocol If non-null, the SDK was able to retrieve information about a user
error       Error                    If non-null, an error occurred
=========== ======================== ======

The **UserDetailsModelProtocol** object has the following fields:

====================== ========================= =======
Field                  Type                  	 Meaning
====================== ========================= =======
id                     Integer               	 Unique Id of the user
name                   String                	 Username for this app only
firstName              String                	 First name of user
lastName               String                	 Last name of user
dateOfBirth            String                	 Date of birth of user
gender                 String                	 Either 'm' or 'f'
language               String                	 Two letter country code
email                  String                	 User email
isMinor                Boolean               	 Flag if user is a minor
hasSetParentEmail	   String				 	 Flag if a parent email has been set
consentAgeForCountry   Int				 	 	 Age for minimum check if user is a minor
createdAt   		   String				 	 Date of user creation
address                AddressModelProtocol      Address object
points                 PointsModelProtocols      Points object
applicationPermissions PermissionsModelProtocols Available permissions object
applicationProfile     AppProfileModelProtocol   Application profile object
====================== ========================= =======

The **AddressModelProtocol** object has the following fields:

============ ========== ========
Field 	 	 Type    	Meaning
============ ========== ========
street 		 String  	Street address of user
city 	     String 	City of user
postCode     String 	Postal Code of user
country      String 	Country of user
countryCode  String 	Country code of user
countryName  String 	Country name of user
============ ========== ========

The **PointsModelProtocols** object has the following fields:

======== ======= ========
Field 	 Type    Meaning
======== ======= ========
pending  Integer Points that have yet to be approved
received Integer Total points actually received
total    Integer Total received + pending
inApp 	 Integer Points received in this app
balance  Integer Available balance
======== ======= ========

The **PermissionsModelProtocols** object has the following fields:

============= ==== =======
Field         Type Meaning
============= ==== =======
address       Bool If the user's parent allows your app to access user's address
competition   Bool If the user's parent allows your app to add the user to competitions
firstName     Bool If the user's parent allows your app to access user's first name
lastName      Bool If the user's parent allows your app to access user's last name
email         Bool If the user's parent allows your app to access user's email address
streetAddress Bool If the user's parent allows your app to access user's street address
postalCode    Bool If the user's parent allows your app to access user's postal code
country       Bool If the user's parent allows your app to access user's country
notifications Bool If the user's parent allows your app to send push notifications
newsletter    Bool If the user's parent allows your app to send newsletters
============= ==== =======

The **AppProfileModelProtocol** object has a set of custom fields, specific for each app:

============= ======== =======
Field         Type 	   Meaning
============= ======== =======
name          String   If the user's parent allows your app to access user's address
avatarId      Integer  If the user's parent allows your app to access user's address
customField1  Integer  If the user's parent allows your app to access user's first name
customField2  Integer  If the user's parent allows your app to access user's last name
============= ======== =======

.. note::

	Please note that depending on the available permissions you have (detailed in the **PermissionsModelProtocols**) you may or may not
	see the various pieces of information associated with a user.

.. note::

  Also note that a parent may withdraw permission to access a user's details at any time. Your app should handle this scenario gracefully as well.
