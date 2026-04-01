___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Trengo Widget",
  "description": "Trengo live chat widget. Supports widget event tracking, contact/ticket data, page-level visibility control, and SPA routing.",
  "categories": ["CHAT"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "PLACEHOLDER_TRENGO_LOGO",
    "displayName": "Trengo",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Widget Configuration",
    "name": "groupWidgetConfig",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Your Trengo widget key. Find it in Trengo under Settings \u003e Web Widget \u003e Installation.",
        "displayName": "Widget Key",
        "simpleValueType": true,
        "name": "widgetKey",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Page Visibility",
    "name": "groupPageVisibility",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Control which pages the widget appears on. The widget will still render if the visitor has an active chat session, even on hidden pages.",
        "displayName": "Visibility Mode",
        "name": "visibilityMode",
        "type": "SELECT",
        "selectItems": [
          {
            "displayValue": "Show on all pages",
            "value": "showAll"
          },
          {
            "displayValue": "Hide on specific pages",
            "value": "hideSpecific"
          },
          {
            "displayValue": "Show only on specific pages",
            "value": "showSpecific"
          }
        ],
        "defaultValue": "showAll",
        "simpleValueType": true
      },
      {
        "help": "When enabled, the widget auto-renders on page load. Disable to control rendering manually via the Trengo API.",
        "displayName": "Auto Render Widget",
        "name": "autoRender",
        "type": "CHECKBOX",
        "defaultValue": true
      },
      {
        "help": "Add URL patterns to match pages for hiding or showing the widget.",
        "displayName": "Page Patterns",
        "name": "pagePatterns",
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add Page Pattern",
        "simpleTableColumns": [
          {
            "defaultValue": "contains",
            "displayName": "Match Type",
            "name": "type",
            "type": "SELECT",
            "selectItems": [
              {
                "displayValue": "URL contains",
                "value": "contains"
              },
              {
                "displayValue": "URL equals",
                "value": "equals"
              },
              {
                "displayValue": "URL starts with",
                "value": "startsWith"
              },
              {
                "displayValue": "URL ends with",
                "value": "endsWith"
              },
              {
                "displayValue": "Regular expression",
                "value": "regex"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "visibilityMode",
            "type": "NOT_EQUALS",
            "paramValue": "showAll"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Contact Data",
    "name": "groupContactData",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Pre-fill the contact email. Useful for logged-in visitors. Supports GTM variables.",
        "displayName": "Email",
        "name": "contactEmail",
        "type": "TEXT",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "help": "Pre-fill the contact name.",
        "displayName": "Name",
        "name": "contactName",
        "type": "TEXT",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "help": "Add custom contact fields. The Field ID must match an existing custom_field of type \u0027contact\u0027 in Trengo.",
        "displayName": "Custom Contact Fields",
        "name": "contactCustomFields",
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add Contact Field",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field ID",
            "name": "fieldId",
            "type": "TEXT",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Ticket Data",
    "name": "groupTicketData",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Add custom ticket fields. The Field ID must match an existing custom_field of type \u0027ticket\u0027 in Trengo. Only works for web chat channels.",
        "displayName": "Custom Ticket Fields",
        "name": "ticketCustomFields",
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add Ticket Field",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field ID",
            "name": "fieldId",
            "type": "TEXT",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ]
      },
      {
        "help": "Automatically add the browser language as a custom ticket field.",
        "displayName": "Add Browser Language",
        "name": "addBrowserLanguage",
        "type": "CHECKBOX",
        "defaultValue": false
      },
      {
        "help": "The custom field ID for the browser language field in Trengo.",
        "displayName": "Browser Language Field ID",
        "name": "browserLanguageFieldId",
        "type": "TEXT",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "addBrowserLanguage",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "help": "The browser language value to send. Use a GTM variable like {{Browser Language}}.",
        "displayName": "Browser Language Value",
        "name": "browserLanguageValue",
        "type": "TEXT",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "addBrowserLanguage",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      }
    ]
  },
  {
    "displayName": "Event Handlers",
    "name": "groupEventHandlers",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Push Trengo widget events to the dataLayer. Events are prefixed with \u0027trengo.\u0027 (e.g. trengo.ready, trengo.open).",
        "displayName": "Push Events to DataLayer",
        "name": "pushEventsToDataLayer",
        "type": "CHECKBOX",
        "defaultValue": false
      },
      {
        "help": "Fire when the widget is fully loaded and initialized.",
        "displayName": "Widget Ready (on_ready)",
        "name": "enableOnReady",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when the widget is opened by visitor or API.",
        "displayName": "Widget Opened (on_open)",
        "name": "enableOnOpen",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when the widget is closed by visitor or API.",
        "displayName": "Widget Closed (on_close)",
        "name": "enableOnClose",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when the agency comes online.",
        "displayName": "Chat Online (on_status_online)",
        "name": "enableOnStatusOnline",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when the agency goes offline.",
        "displayName": "Chat Offline (on_status_offline)",
        "name": "enableOnStatusOffline",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when a visitor starts a chat.",
        "displayName": "Chat Started (on_chat_started)",
        "name": "enableOnChatStarted",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      },
      {
        "help": "Fire when an agent or bot ends the chat.",
        "displayName": "Chat Ended (on_chat_ended)",
        "name": "enableOnChatEnded",
        "type": "CHECKBOX",
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "pushEventsToDataLayer",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      }
    ]
  },
  {
    "displayName": "Advanced Settings",
    "name": "groupAdvanced",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Override the default Trengo embed script URL. Only change this if instructed by Trengo support.",
        "displayName": "Script URL",
        "name": "scriptUrl",
        "type": "TEXT",
        "simpleValueType": true,
        "defaultValue": "https://static.widget.trengo.eu/embed.js"
      },
      {
        "help": "Skip loading the widget if the visitor has Do Not Track enabled. Requires a GTM variable that resolves to the navigator.doNotTrack value.",
        "displayName": "Respect Do Not Track",
        "name": "respectDoNotTrack",
        "type": "CHECKBOX",
        "defaultValue": false
      },
      {
        "help": "A GTM variable that returns the Do Not Track value (e.g. \u00271\u0027 or \u0027yes\u0027).",
        "displayName": "Do Not Track Value",
        "name": "doNotTrackValue",
        "type": "TEXT",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "respectDoNotTrack",
            "type": "EQUALS",
            "paramValue": true
          }
        ]
      }
    ]
  },
  {
    "displayName": "Debugging",
    "name": "groupDebugging",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Enable verbose console logging for debugging. Disable in production.",
        "displayName": "Debug Mode",
        "name": "debugMode",
        "type": "CHECKBOX",
        "defaultValue": false
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var log = require('logToConsole');
var injectScript = require('injectScript');
var copyFromWindow = require('copyFromWindow');
var setInWindow = require('setInWindow');
var callInWindow = require('callInWindow');
var createQueue = require('createQueue');
var getUrl = require('getUrl');
var makeInteger = require('makeInteger');
var getType = require('getType');

var debug = data.debugMode ? log : function() {};

// Check Do Not Track
if (data.respectDoNotTrack && data.doNotTrackValue) {
  if (data.doNotTrackValue === '1' || data.doNotTrackValue === 'yes') {
    debug('Trengo Widget: Do Not Track enabled, skipping');
    data.gtmOnSuccess();
    return;
  }
}

// Page visibility logic
var shouldShowWidget = function() {
  if (data.visibilityMode === 'showAll') {
    return true;
  }

  var currentUrl = getUrl();
  var patterns = data.pagePatterns || [];

  for (var i = 0; i < patterns.length; i++) {
    var pattern = patterns[i];
    var type = pattern.type;
    var value = pattern.value;
    var matches = false;

    switch (type) {
      case 'contains':
        matches = currentUrl.indexOf(value) !== -1;
        break;
      case 'equals':
        matches = currentUrl === value;
        break;
      case 'startsWith':
        matches = currentUrl.indexOf(value) === 0;
        break;
      case 'endsWith':
        matches = currentUrl.lastIndexOf(value) === currentUrl.length - value.length;
        break;
      case 'regex':
        if (value.indexOf('.*') !== -1) {
          var parts = value.split('.*');
          matches = true;
          var searchStart = 0;
          for (var j = 0; j < parts.length; j++) {
            if (parts[j]) {
              var index = currentUrl.indexOf(parts[j], searchStart);
              if (index === -1) {
                matches = false;
                break;
              }
              searchStart = index + parts[j].length;
            }
          }
        } else if (value.indexOf('|') !== -1) {
          var options = value.split('|');
          for (var j = 0; j < options.length; j++) {
            if (currentUrl.indexOf(options[j]) !== -1) {
              matches = true;
              break;
            }
          }
        } else {
          matches = currentUrl.indexOf(value) !== -1;
        }
        break;
    }

    if (matches) {
      return data.visibilityMode === 'showSpecific';
    }
  }

  return data.visibilityMode === 'hideSpecific';
};

// Initialize Trengo config
var trengoObj = copyFromWindow('Trengo') || {};
trengoObj.key = data.widgetKey;

if (data.visibilityMode !== 'showAll' || !data.autoRender) {
  trengoObj.render = false;
}

// Contact data
if (data.contactEmail || data.contactName || (data.contactCustomFields && data.contactCustomFields.length > 0)) {
  trengoObj.contact_data = {};
  if (data.contactEmail) trengoObj.contact_data.email = data.contactEmail;
  if (data.contactName) trengoObj.contact_data.name = data.contactName;
  if (data.contactCustomFields && data.contactCustomFields.length > 0) {
    trengoObj.contact_data.custom_fields = [];
    for (var i = 0; i < data.contactCustomFields.length; i++) {
      var field = data.contactCustomFields[i];
      if (field.fieldId && field.value) {
        trengoObj.contact_data.custom_fields.push({
          field_id: makeInteger(field.fieldId),
          value: field.value
        });
      }
    }
  }
}

// Ticket data
if ((data.ticketCustomFields && data.ticketCustomFields.length > 0) || data.addBrowserLanguage) {
  trengoObj.ticket_data = { custom_fields: [] };
  if (data.ticketCustomFields && data.ticketCustomFields.length > 0) {
    for (var i = 0; i < data.ticketCustomFields.length; i++) {
      var field = data.ticketCustomFields[i];
      if (field.fieldId && field.value) {
        trengoObj.ticket_data.custom_fields.push({
          field_id: makeInteger(field.fieldId),
          value: field.value
        });
      }
    }
  }
  if (data.addBrowserLanguage && data.browserLanguageFieldId && data.browserLanguageValue) {
    trengoObj.ticket_data.custom_fields.push({
      field_id: makeInteger(data.browserLanguageFieldId),
      value: data.browserLanguageValue
    });
  }
}

// FIX: Use createQueue for safe dataLayer pushes instead of read/replace pattern
var dlPush = createQueue('dataLayer');

var pushToDataLayer = function(eventName) {
  if (data.pushEventsToDataLayer) {
    dlPush({
      event: 'trengo.' + eventName,
      trengoEvent: eventName
    });
    debug('Trengo Widget: Pushed trengo.' + eventName + ' to dataLayer');
  }
};

// Event handlers
if (data.enableOnReady) {
  trengoObj.on_ready = function() {
    debug('Trengo Widget: Ready');
    pushToDataLayer('ready');

    if (data.visibilityMode !== 'showAll' || !data.autoRender) {
      var trengoApi = copyFromWindow('Trengo.Api');
      if (trengoApi && trengoApi.Widget) {
        var isChatting = trengoApi.Widget.is_chatting && trengoApi.Widget.is_chatting();
        if (shouldShowWidget() || isChatting) {
          debug('Trengo Widget: Rendering');
          if (trengoApi.Widget.render) trengoApi.Widget.render();
        } else {
          debug('Trengo Widget: Hidden by visibility rules');
        }
      }
    }
  };
}

if (data.enableOnOpen) {
  trengoObj.on_open = function() { pushToDataLayer('open'); };
}
if (data.enableOnClose) {
  trengoObj.on_close = function() { pushToDataLayer('close'); };
}
if (data.enableOnStatusOnline) {
  trengoObj.on_status_online = function() { pushToDataLayer('status_online'); };
}
if (data.enableOnStatusOffline) {
  trengoObj.on_status_offline = function() { pushToDataLayer('status_offline'); };
}
if (data.enableOnChatStarted) {
  trengoObj.on_chat_started = function() { pushToDataLayer('chat_started'); };
}
if (data.enableOnChatEnded) {
  trengoObj.on_chat_ended = function() { pushToDataLayer('chat_ended'); };
}

setInWindow('Trengo', trengoObj, true);

var scriptUrl = data.scriptUrl || 'https://static.widget.trengo.eu/embed.js';
debug('Trengo Widget: Loading ' + scriptUrl);

injectScript(scriptUrl, function() {
  debug('Trengo Widget: Loaded');
  data.gtmOnSuccess();
}, function() {
  debug('Trengo Widget: Failed to load');
  data.gtmOnFailure();
}, 'trengo-widget');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://static.widget.trengo.eu/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Trengo"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Trengo.Api.Widget.render"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Trengo.Api.Widget.is_chatting"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Trengo.Api"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 2025-01-01 by New North Digital (newnorth.digital).
