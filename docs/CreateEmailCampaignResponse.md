# Net::Sms::TextMagicClient::Object::CreateEmailCampaignResponse

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::CreateEmailCampaignResponse;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Unique campaign ID. | 
**status** | **string** | Current campaign status. | 
**email_sender_id** | **int** | Email sender ID used for this campaign. | [optional] 
**start_at** | **DateTime** | Campaign start timestamp. | 
**created_by** | [**UserPersonalInfo**](UserPersonalInfo.md) |  | 
**from_name** | **string** | Sender name displayed in recipient&#39;s inbox. | [optional] 
**from_email** | **string** | Sender email address. | 
**reply_to_email** | **string** | Reply-to email address. | 
**subject** | **string** | Email subject line. | 
**html** | **string** | HTML email content. | 
**cost** | **double** | Total campaign cost. | 
**totals** | [**EmailCampaignStatisticTotals**](EmailCampaignStatisticTotals.md) |  | 
**outbound_email** | [**OutboundEmailResponse**](OutboundEmailResponse.md) |  | [optional] 
**failed_reason** | **string** | Reason for campaign failure if applicable. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


