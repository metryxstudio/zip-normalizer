___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "MACRO",
  "id": "zip_normalizer",
  "version": 1,
  "securityGroups": [],
  "displayName": "Zip Code Normalizer",
  "description": "Normalizes postal/zip codes for server-side tracking by removing spaces and hyphens, converting to lowercase. Validates length (3-10 characters).",
  "containerContexts": [
    "SERVER",
    "WEB"
  ],
  "categories": ["UTILITY"],
  "brand": {
    "id": "metryxstudio",
    "displayName": "Metryx Studio"
  }
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "rawZipCode",
    "displayName": "Raw Zip Code",
    "simpleValueType": true,
    "help": "The postal/zip code in its original form."
  }
]

___SANDBOXED_JS_FOR_SERVER___

var makeString = require('makeString');

var normalizeZipCode = function(data) {
  var rawZipCode = data.rawZipCode;

  if (!rawZipCode) {
    return undefined;
  }

  var zipString = makeString(rawZipCode).trim().toLowerCase();
  
  if (zipString.length === 0) {
    return undefined;
  }
  
  var normalizedZip = '';
  
  for (var i = 0; i < zipString.length; i++) {
    var char = zipString.charAt(i);
    
    var isLetter = (char >= 'a' && char <= 'z');
    var isNumber = (char >= '0' && char <= '9');
    
    if (isLetter || isNumber) {
      normalizedZip = normalizedZip + char;
    }
  }
  
  if (normalizedZip.length < 3 || normalizedZip.length > 10) {
    return undefined;
  }
  
  return normalizedZip;
};

return normalizeZipCode(data);


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var makeString = require('makeString');

var normalizeZipCode = function(data) {
  var rawZipCode = data.rawZipCode;

  if (!rawZipCode) {
    return undefined;
  }

  var zipString = makeString(rawZipCode).trim().toLowerCase();
  
  if (zipString.length === 0) {
    return undefined;
  }
  
  var normalizedZip = '';
  
  for (var i = 0; i < zipString.length; i++) {
    var char = zipString.charAt(i);
    
    var isLetter = (char >= 'a' && char <= 'z');
    var isNumber = (char >= '0' && char <= '9');
    
    if (isLetter || isNumber) {
      normalizedZip = normalizedZip + char;
    }
  }
  
  if (normalizedZip.length < 3 || normalizedZip.length > 10) {
    return undefined;
  }
  
  return normalizedZip;
};

return normalizeZipCode(data);



___WEB_PERMISSIONS___

[]


___SERVER_PERMISSIONS___

[]


___TESTS___

scenarios:
- name: Croatian zip code
  code: |-
    const mockData = {
      rawZipCode: '10000'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('10000');
- name: Croatian zip with space
  code: |-
    const mockData = {
      rawZipCode: '10 000'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('10000');
- name: US zip code
  code: |-
    const mockData = {
      rawZipCode: '90210'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('90210');
- name: US zip plus 4
  code: |-
    const mockData = {
      rawZipCode: '90210-1234'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('902101234');
- name: UK postal code
  code: |-
    const mockData = {
      rawZipCode: 'SW1A 1AA'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('sw1a1aa');
- name: Canadian postal code
  code: |-
    const mockData = {
      rawZipCode: 'K1A 0B1'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('k1a0b1');
- name: Empty input returns undefined
  code: |-
    const mockData = {
      rawZipCode: ''
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Only whitespace returns undefined
  code: |-
    const mockData = {
      rawZipCode: '   '
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Too short zip returns undefined
  code: |-
    const mockData = {
      rawZipCode: '12'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Too long zip returns undefined
  code: |-
    const mockData = {
      rawZipCode: '12345678901'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Undefined input returns undefined
  code: |-
    const mockData = {};
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: German zip code
  code: |-
    const mockData = {
      rawZipCode: '10115'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('10115');
