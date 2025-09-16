# Net::Sms::TextMagicClient::Object::ScheduleEmailCampaignInputObject

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::ScheduleEmailCampaignInputObject;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**email_sender_id** | **int** | Email sender ID from your configured senders. | [optional] 
**subject** | **string** | Email subject line. | [optional] 
**message** | **string** | HTML email content. | [optional] 
**from_name** | **string** | Optional custom sender name. | [optional] 
**reply_to_email** | **string** | Optional custom reply-to email address. | [optional] 
**recipients** | [**Apiv2emailcampaignsscheduleRecipients**](Apiv2emailcampaignsscheduleRecipients.md) |  | [optional] 
**schedule_params** | [**Apiv2emailcampaignsscheduleScheduleParams**](Apiv2emailcampaignsscheduleScheduleParams.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


