Add the SDK through CocoaPods
=============================

We use `CocoaPods <http://cocoapods.org>`_ in order to make installing and updating our SDK super easy.
CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects.

If you don't have CocoaPods installed on your machine you can install it by issuing the following command in your terminal:

.. code-block:: shell

    sudo gem install cocoapods

After that you need to go to the project's directory and initialize CocoaPods

.. code-block:: shell

    cd /path_to/my_project/
    pod init

This will also create a special file called a **Podfile**, where you can specify what dependencies to add to your new project.
Usually it will look similar to this:

.. code-block:: shell

    target 'MyProject' do
        # add dependencies
    end

For more information on Podfile options, please check the `Podfile <https://guides.cocoapods.org/syntax/podfile.html>`_ specification.

You can add SuperAwesome to your project by declaring the following Pod:

.. code-block:: shell

    target 'MyProject' do
        pod 'KWSiOSSDKObjC', '<sdk_version>'
    end

This will tell CocoaPods to fetch the latest version of the Kids Web Services iOS SDK.

After the pod source has been added, update your project's dependencies by running the following command in the terminal:

.. code-block:: shell

    pod update

Don't forget to use the **.xcworkspace** file to open your project in Xcode, instead of the **.xcproj** file, from here on out.

You can import the main SDK header file like so:

.. code-block:: c++

    #import "KWS.h"
