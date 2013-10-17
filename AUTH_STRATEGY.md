Auth Strategy
=============

This document describes how the ShadowWolf Client can securely request protected resources from the ShadowWolf Server only after being authenticated by an Authentication Server host on BVN infrastructure. The strategy follows the OAuth2 protocol.

Introduction
------------

ShadowWolf Server may contain sensitive information that should only be yielded to privileged ShadowWolf Client users. Authentication should not be done by ShadowWolf Server but rather the internal system used by BVN. This results in a loosely coupled system where the authentication server is a separate entity from the resource server.

Flow
----

Below is a diagram of the flow:

   +----------+           #6  +------------+     
   |          |<--------------|            |     
   |   Auth   |-------------->| ShadowWolf |     
   |  Server  |<-------\  #7  |   Server   |     
   |          |------\ |      |            |     
   +----------+      | |      +------------+     
       ^  |          | |           ^  |          
     #3|  |#2      #4| |#1       #5|  |#8        
       |  v          | |           |  v          
   +-----------+     | |      +------------+     
   |           |     | |      |            |     
   |   BVN     |     | \------| ShadowWolf |     
   |  Active   |     \------->|   Client   |     
   | Directory |              |            |     
   |           |              +------------+     
   +-----------+                                 

When a user clicks "Login" on the client:

1. The user is taken to a login form hosted by the Auth Server,
2. The Auth Server verifies the credentials from the user against the BVN Active directory,
3. The BVN Active Directory validates the credentials,
4. The Auth Server sends an access token to the ShadowWolf Client,
5. The ShadowWolf Client requests protected resources from the ShadowWolf Server, providing the access token it received,
6. If the ShadowWolf Server has not yet verified the access token it does so against the API provided by the Auth Server,
7. The Auth Server confirms the access token,
8. The ShadowWolf Server returns the protected resource to the ShadowWolf Client and will in future accept the access token until it expires.

Why use a Verification API?
---------------------------

Steps 6 and 7 would not be necessary if the ShadowWolf Server and the Auth Server shared public/private keys. The ShadowWolf Server would immediately be able to confirm the access token is from the Auth Server without a Verification API. This would result in a faster login process.

The reason why we are not doing this is simply to avoid writing as much of our own crypto code as possible. We will likely reconsider the Verification API in the future if the speed of the login becomes an issue but until we are playing it safe.

Details
-------

* The exact protocol to communicate with Active Directory needs to be documented.
* The Auth Server will not only need to be able to generate random Base64 keys but also store the expiration date of each key and be able to recognise expired keys.
* The ShadowWolf Server will also need to recognise expired keys. It should also automatically refresh keys that are near expiration.
