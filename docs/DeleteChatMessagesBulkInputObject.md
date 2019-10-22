# Net::Sms::TextMagicClient::Object::DeleteChatMessagesBulkInputObject

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::DeleteChatMessagesBulkInputObject;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**inbound_ids** | **string** | Inbound messages ID(s) to delete. Require when \&quot;all\&quot; equal to 0 (false). | [optional] 
**sent_ids** | **string** | Sent messages ID(s) to delete. Require when \&quot;all\&quot; equal to 0 (false). | [optional] 
**calls_ids** | **string** | Calls ID(s) to delete. Require when \&quot;all\&quot; equal to 0 (false). | [optional] 
**all** | **boolean** | Default is 0 (false). If set to 1 all the entities will be removed. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


