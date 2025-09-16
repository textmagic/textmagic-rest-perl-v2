# Net::Sms::TextMagicClient::Object::OutboundEmailResponse

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::OutboundEmailResponse;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Outbound email ID. | 
**send_time** | **DateTime** | Email send timestamp. | 
**from_name** | **string** | Sender name. | [optional] 
**from_email** | **string** | Sender email address. | 
**reply_to_email** | **string** | Reply-to email address. | 
**recipient_full_name** | **string** | Recipient&#39;s full name. | [optional] 
**recipient_email** | **string** | Recipient&#39;s email address. | [optional] 
**email_subject** | **string** | Email subject line. | 
**email_content** | **string** | HTML email content. | 
**source** | **string** | Source of the outbound email. | 
**status** | **string** | Current email status. | 
**cost** | **double** | Cost of sending this email. | 
**status_reason** | **string** | Detailed status reason. | [optional] 
**contact_id** | **int** | Associated contact ID. | [optional] 
**initiator_id** | **int** | ID of user who initiated the email. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


