# Net::Sms::TextMagicClient::Object::Contact

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::Contact;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Contact ID. | 
**favorited** | **boolean** | Is the Contact favorite? [Favorite list](https://docs.textmagic.com/#operation/getFavorites). | 
**blocked** | **boolean** | Is the Contact blocked? [Blocked contacts](https://docs.textmagic.com/#operation/getBlockedContacts). | 
**first_name** | **string** | Contact first name. | 
**last_name** | **string** | Contact last name. | 
**company_name** | **string** | Company name. | 
**phone** | **string** | Phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164). | 
**email** | **string** | Contact email address. | 
**country** | [**Country**](Country.md) | Contact country. | 
**custom_fields** | [**ARRAY[CustomFieldListItem]**](CustomFieldListItem.md) |  | 
**user** | [**User**](User.md) |  | 
**lists** | [**ARRAY[List]**](List.md) |  | 
**owner** | [**User**](User.md) | Contact Owner User ID. | [optional] 
**tags** | [**ARRAY[Tag]**](Tag.md) |  | [optional] 
**phone_type** | **string** | Phone number type: * **0** if it is fixed-line; * **1** if it is mobile; * **2** if it is mobile or fixed-line (in case we cannot distingush between fixed-line or mobile); * **3** if it is toll-free; * **4** if it is a premium rate phone; * **5** if it is a shared cost phone; * **6** if it is a VoIP; * **7** if it is a [Personal Number](); * **8** if it is a pager; * **9** if it is a Universal Access Number; * **10** if the phone type is unknown; * **-1** if the phone type is not yet processed or cannot be determined.  | 
**avatar** | [**ContactImage**](ContactImage.md) |  | 
**notes** | [**ARRAY[ContactNote]**](ContactNote.md) |  | 
**whatsapp_phone** | **string** | Whatsapp phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


