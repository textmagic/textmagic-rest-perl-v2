# Net::Sms::TextMagicClient::Object::SendMessageInputObject

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::SendMessageInputObject;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**text** | **string** | Message text. Required if the **template_id** is not set. | [optional] 
**template_id** | **int** | Template used instead of message text. Required if the **text** is not set. | [optional] 
**sending_time** | **int** | DEPRECATED, consider using sendingDateTime and sendingTimezone parameters instead: Optional (required with rrule set). Message sending time in unix timestamp format. Default is now. | [optional] 
**sending_date_time** | **string** | Sending time in Y-m-d H:i:s format (e.g. 2022-05-27 13:05:10). This time is relative to **sendingTimezone**. Note: for correct operation, the value of seconds must not be less than 10. | [optional] 
**sending_timezone** | **string** | ID or ISO-name of timezone used for sending when sendingDateTime parameter is set. E.g. if you specify sendingDateTime &#x3D; \\\&quot;2016-05-27 13:02:33\\\&quot; and sendingTimezone &#x3D; \\\&quot;America/Buenos_Aires\\\&quot;, your message will be sent at May 27, 2016 13:02:33 Buenos Aires time, or 16:02:33 UTC. Default is account timezone. | [optional] 
**contacts** | **string** | Comma separated array of contact resources id message will be sent to. | [optional] 
**lists** | **string** | Comma separated array of list resources id message will be sent to. | [optional] 
**phones** | **string** | Comma separated array of E.164 phone numbers message will be sent to. | [optional] 
**cut_extra** | **boolean** | Should sending method cut extra characters which not fit supplied partsCount or return 400 Bad request response instead. | [optional] [default to false]
**parts_count** | **int** | Maximum message parts count (Textmagic allows sending 1 to 6 message parts). | [optional] 
**reference_id** | **int** | Custom message reference id which can be used in your application infrastructure. | [optional] 
**from** | **string** | One of allowed Sender ID (phone number or alphanumeric sender ID). If specified Sender ID is not allowed for some destinations, a fallback default Sender ID will be used to ensure delivery. See [Get timezones](https://docs.textmagic.com/#tag/Sender-IDs). | [optional] 
**rrule** | **string** | iCal RRULE parameter to create recurrent scheduled messages. When used, sendingTime is mandatory as start point of sending. See https://www.textmagic.com/free-tools/rrule-generator for format details. | [optional] 
**create_chat** | **boolean** | Should sending method try to create new Chat (if not exist) with specified recipients? | [optional] [default to false]
**tts** | **boolean** | Send a Text-to-Speech message. | [optional] [default to false]
**local** | **boolean** | Treat phone numbers passed in the \\&#39;phones\\&#39; field as local. | [optional] [default to false]
**local_country** | **string** | The 2-letter ISO country code for local phone numbers, used when \\&#39;local\\&#39; is set to true. Default is the account country. | [optional] 
**destination** | **string** | Messsage destination type allowed [mms, tts]. | [optional] 
**resources** | **string** | File name from mms attachment response (named as resource) | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


