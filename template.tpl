___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Get Root Domain",
  "categories": [
    "UTILITY"
  ],
  "description": "Extract Root domain from hostname or URL",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "inputValue",
    "displayName": "Host or URL",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//input may be hostname or URL
var domain = data.inputValue||"";
var x = domain.indexOf('//');

//protocol-relative URL or hostname only?
if (x === 0) domain = 'https:'+domain;  
else if (x<0) domain = "https://"+domain;

//try to extract from complete URL
var urlData = require("parseUrl")(domain);
if (urlData && urlData.hostname) domain = urlData.hostname;

//delete path if still present due to incomplete input
domain = domain.split('/')[0];

//extracting root domain as demonstrated here: 
//https://gist.github.com/RavenHursT/fe8a95a59109096ac1f8?permalink_comment_id=3869493#gistcomment-3869493
const elems = domain.split('.');
const iMax = elems.length - 1;
const isSecondLevel = elems.length >= 3 && (elems[iMax] + elems[iMax - 1]).length <= 5;
return elems.splice( isSecondLevel ? -3 : -2 ).join('.');


___TESTS___

scenarios: []


___NOTES___

Created on 24.8.2022, 17:38:42


