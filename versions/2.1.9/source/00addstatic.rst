Add the SDK as a static library
===============================

You can download the latest `KidsWebServicesSDK-<sdk_version>.iOS.lib.zip <https://github.com/SuperAwesomeLTD/sa-sdk-build-repo/blob/master/package/kws_ios/<sdk_version>/KidsWebServicesSSDK-<sdk_version>.iOS.lib.zip?raw=true>`_ file - which contains the **libKidsWebServicesSDK.a** and
associated **include** folder to add to your project as a static library.

Once you've downloaded the zip archive, open it and add the library and the folder in your project.

.. image:: img/IMG_02_Static_1.png

Then add the necessary paths to **Header Search Paths**

.. image:: img/IMG_02_Static_2.png

And finally add the *-ObjC* flag to **Other Linker Flags**

.. image:: img/IMG_02_Static_3.png

You can import the same SDK header file like so:

.. code-block:: c++

    #import "KidsWebServicesSDK.h"
