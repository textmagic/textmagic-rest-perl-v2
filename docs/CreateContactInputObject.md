# Net::Sms::TextMagicClient::Object::CreateContactInputObject

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::CreateContactInputObject;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **string** | Contact first name. | [optional] 
**last_name** | **string** | Contact last name. | [optional] 
**phone** | **string** | Phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164). | 
**email** | **string** | Contact email address. | [optional] 
**company_name** | **string** | Company name. | [optional] 
**lists** | **string** | Contact [list](http://docs.textmagictesting.com/#tag/Lists) ID. Each contact must be assigned to at least one list. | 
**favorited** | **boolean** | Is contact marked as favorite. | [optional] 
**blocked** | **boolean** | Is contact blocked for outgoing and incoming messaging. | [optional] 
**type** | **int** | Force type of phone. Possible values: 0 - landline, 1 - mobile. Default is -1 (auto detection). | [optional] 
**custom_field_values** | [**ARRAY[CustomFieldListItem]**](CustomFieldListItem.md) |  | [optional] 
**local** | **int** | Treat phone number passed in request body as local | [optional] 
**country** | **string** | 2-letter ISO country code for local phone numbers, used when local is  set to true. Default is account country | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


