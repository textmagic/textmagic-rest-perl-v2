# Net::Sms::TextMagicClient::Object::ScheduleEmailCampaignRequest

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::ScheduleEmailCampaignRequest;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**email_sender_id** | **int** | Email sender ID from your configured senders. | [optional] 
**subject** | **string** | Email subject line. | [optional] 
**message** | **string** | HTML email content. | [optional] 
**from_name** | **string** | Optional custom sender name. | [optional] 
**reply_to_email** | **string** | Optional custom reply-to email address. | [optional] 
**recipients** | [**ScheduleEmailCampaignRequestRecipients**](ScheduleEmailCampaignRequestRecipients.md) |  | [optional] 
**schedule_params** | [**ScheduleEmailCampaignRequestScheduleParams**](ScheduleEmailCampaignRequestScheduleParams.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


