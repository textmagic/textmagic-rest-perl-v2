# Net::Sms::TextMagicClient::Object::ScheduledEmailCampaignDetails

## Load the model package
```perl
use Net::Sms::TextMagicClient::Object::ScheduledEmailCampaignDetails;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Unique scheduled campaign ID. | 
**status** | **string** | Current scheduled campaign status. | 
**email_sender_id** | **int** | Email sender ID used for this campaign. | [optional] 
**start_at** | **DateTime** | Scheduled start timestamp (UTC). | 
**end_at** | **DateTime** | End timestamp for recurring campaigns (UTC). | [optional] 
**next_send_at** | **DateTime** | Next scheduled send timestamp (UTC). | [optional] 
**created_by** | [**UserPersonalInfo**](UserPersonalInfo.md) |  | 
**created_at** | **DateTime** | Campaign creation timestamp. | 
**updated_at** | **DateTime** | Last update timestamp. | 
**type** | **string** | Campaign recurrence type. | 
**from_name** | **string** | Sender name displayed in recipient&#39;s inbox. | [optional] 
**from_email** | **string** | Sender email address. | 
**reply_to_email** | **string** | Reply-to email address. | 
**subject** | **string** | Email subject line. | 
**html** | **string** | HTML email content. | 
**recipients_count** | **int** | Number of recipients for this campaign. | 
**sending_timezone** | **string** | Timezone for sending the campaign. | 
**rrule** | **string** | RFC 5545 recurrence rule for recurring campaigns. | [optional] 
**occurrence_summary** | **string** | Human-readable schedule description. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


