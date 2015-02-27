// openssl genrsa -out my-server.key.pem 2048 
// openssl rsa -in my-server.key.pem -pubout -out my-server.pub 
 
'use strict';
 
var fs = require('fs')
  , ursa = require('ursa')
  , crt
  , key
  , msg
  ;
 
key = ursa.createPrivateKey(fs.readFileSync('my-server.key.pem'));
crt = ursa.createPublicKey(fs.readFileSync('my-server.pub'));
 
console.log('Encrypt with Public');
msg = crt.encrypt("Everything is going to be 200 OK", 'utf8', 'base64');
console.log('encrypted', msg, '\n');
 
console.log('Decrypt with Private');
msg = key.decrypt(msg, 'base64', 'utf8');
console.log('decrypted', msg, '\n');
 
console.log('############################################');
console.log('Reverse Public -> Private, Private -> Public');
console.log('############################################\n');
 
crt = ursa.createPrivateKey(fs.readFileSync('my-server.key.pem'));
key = ursa.createPublicKey(fs.readFileSync('my-server.pub'));
 
console.log('Encrypt with Private (called public)');
msg = key.encrypt("Everything is going to be 200 OK", 'utf8', 'base64');
console.log('encrypted', msg, '\n');
 
console.log('Decrypt with Public (called private)');
msg = crt.decrypt(msg, 'base64', 'utf8');
console.log('decrypted', msg, '\n');