Author: Ben Barber 11/2/2017

This is a backend component you can use to create and update sub merchants in Braintree. It does not require any database and the models used are virtual.  Tests were done using Postman see 'postman_request_examples.txt'

you will need to set up a Braintree account and put a file called .env at the project root with the following environment variables

BT_ENVIRONMENT={production or sandbox}
BT_PUBLIC_KEY=[YOUR_ACCOUNT_PUBLIC_KEY]
BT_PRIVATE_KEY=[YOUR_ACCOUNT_PRIVATE_KEY]
BT_MERCHANT_ID=c[YOUR_ACCOUNT_MERCHANT_ID]
BT_MASTER_MERCHANT_ID=[NAME_OF_MASTER_MERHCANT]

Run Bundle Install first Gems are installed properly.

You will need to run this on a local instance of Nginx Use the config file in the project root. The user www-data might not be needed so remove that line if needed. Refer to the NGINX guides if you have Problems.
The reason is so you can get the tool to serve over https and braintree requires that in a production setting

The only two lines you need to change are the line where it says [YOUR_IP_ADDRESS_HERE] and PATH/TO/DHPARAMS.PEM

You Will need to generate a DHPARAMS.PEM file these are the linux commands for it
cd /etc/ssl/certs
openssl dhparam -out dhparam.pem 4096
Note this might take a while you can try 2048 instead of 4096 if its taking forever

You will need to generate a self signed cert and need the paths to the crt and key files for it.
This is the linux command for doing so

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

Once those are in place restart nginx.

Finally run this rails s -b 'ssl://0.0.0.0:9292?key=[PATH/TO/SELF_SIGNED_CERT].key&cert=[PATH/TO/SELF-SIGNED-CRT].crt'. Refer to the postman_request_examples.txt to see how requests should be handled.

Refer to this guide https://developers.braintreepayments.com/reference/request/merchant-account/create/ruby for the required fields(individual, buisness, funding) for the new or existing sub merchants

Feel Free to Fork or make a pull request off of this as I will be unable to keep this up to date most of the time.
