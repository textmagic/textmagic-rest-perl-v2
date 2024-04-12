=begin comment

Textmagic API

No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 2

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package Net::Sms::TextMagicClient::Object::SendMessageInputObject;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;


use base ("Class::Accessor", "Class::Data::Inheritable");


#
#
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

=begin comment

Textmagic API

No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 2

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
        	$log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "Net::Sms::TextMagicClient::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => '',
                                  class => 'SendMessageInputObject',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'text' => {
    	datatype => 'string',
    	base_name => 'text',
    	description => 'Message text. Required if the **template_id** is not set.',
    	format => '',
    	read_only => '',
    		},
    'template_id' => {
    	datatype => 'int',
    	base_name => 'templateId',
    	description => 'Template used instead of message text. Required if the **text** is not set.',
    	format => '',
    	read_only => '',
    		},
    'sending_time' => {
    	datatype => 'int',
    	base_name => 'sendingTime',
    	description => 'DEPRECATED, consider using sendingDateTime and sendingTimezone parameters instead: Optional (required with rrule set). Message sending time in unix timestamp format. Default is now.',
    	format => '',
    	read_only => '',
    		},
    'sending_date_time' => {
    	datatype => 'string',
    	base_name => 'sendingDateTime',
    	description => 'Sending time in Y-m-d H:i:s format (e.g. 2022-05-27 13:05:10). This time is relative to **sendingTimezone**. Note: for correct operation, the value of seconds must not be less than 10.',
    	format => '',
    	read_only => '',
    		},
    'sending_timezone' => {
    	datatype => 'string',
    	base_name => 'sendingTimezone',
    	description => 'ID or ISO-name of timezone used for sending when sendingDateTime parameter is set. E.g. if you specify sendingDateTime &#x3D; \\\&quot;2016-05-27 13:02:33\\\&quot; and sendingTimezone &#x3D; \\\&quot;America/Buenos_Aires\\\&quot;, your message will be sent at May 27, 2016 13:02:33 Buenos Aires time, or 16:02:33 UTC. Default is account timezone.',
    	format => '',
    	read_only => '',
    		},
    'contacts' => {
    	datatype => 'string',
    	base_name => 'contacts',
    	description => 'Comma separated array of contact resources id message will be sent to.',
    	format => '',
    	read_only => '',
    		},
    'lists' => {
    	datatype => 'string',
    	base_name => 'lists',
    	description => 'Comma separated array of list resources id message will be sent to.',
    	format => '',
    	read_only => '',
    		},
    'phones' => {
    	datatype => 'string',
    	base_name => 'phones',
    	description => 'Comma separated array of E.164 phone numbers message will be sent to.',
    	format => '',
    	read_only => '',
    		},
    'cut_extra' => {
    	datatype => 'boolean',
    	base_name => 'cutExtra',
    	description => 'Should sending method cut extra characters which not fit supplied partsCount or return 400 Bad request response instead.',
    	format => '',
    	read_only => '',
    		},
    'parts_count' => {
    	datatype => 'int',
    	base_name => 'partsCount',
    	description => 'Maximum message parts count (Textmagic allows sending 1 to 6 message parts).',
    	format => '',
    	read_only => '',
    		},
    'reference_id' => {
    	datatype => 'int',
    	base_name => 'referenceId',
    	description => 'Custom message reference id which can be used in your application infrastructure.',
    	format => '',
    	read_only => '',
    		},
    'from' => {
    	datatype => 'string',
    	base_name => 'from',
    	description => 'One of allowed Sender ID (phone number or alphanumeric sender ID). If specified Sender ID is not allowed for some destinations, a fallback default Sender ID will be used to ensure delivery. See [Get timezones](https://docs.textmagic.com/#tag/Sender-IDs).',
    	format => '',
    	read_only => '',
    		},
    'rrule' => {
    	datatype => 'string',
    	base_name => 'rrule',
    	description => 'iCal RRULE parameter to create recurrent scheduled messages. When used, sendingTime is mandatory as start point of sending. See https://www.textmagic.com/free-tools/rrule-generator for format details.',
    	format => '',
    	read_only => '',
    		},
    'create_chat' => {
    	datatype => 'boolean',
    	base_name => 'createChat',
    	description => 'Should sending method try to create new Chat (if not exist) with specified recipients?',
    	format => '',
    	read_only => '',
    		},
    'tts' => {
    	datatype => 'boolean',
    	base_name => 'tts',
    	description => 'Send a Text-to-Speech message.',
    	format => '',
    	read_only => '',
    		},
    'local' => {
    	datatype => 'boolean',
    	base_name => 'local',
    	description => 'Treat phone numbers passed in the \\&#39;phones\\&#39; field as local.',
    	format => '',
    	read_only => '',
    		},
    'local_country' => {
    	datatype => 'string',
    	base_name => 'localCountry',
    	description => 'The 2-letter ISO country code for local phone numbers, used when \\&#39;local\\&#39; is set to true. Default is the account country.',
    	format => '',
    	read_only => '',
    		},
    'destination' => {
    	datatype => 'string',
    	base_name => 'destination',
    	description => 'Messsage destination type allowed [mms, tts].',
    	format => '',
    	read_only => '',
    		},
    'resources' => {
    	datatype => 'string',
    	base_name => 'resources',
    	description => 'File name from mms attachment response (named as resource)',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'text' => 'string',
    'template_id' => 'int',
    'sending_time' => 'int',
    'sending_date_time' => 'string',
    'sending_timezone' => 'string',
    'contacts' => 'string',
    'lists' => 'string',
    'phones' => 'string',
    'cut_extra' => 'boolean',
    'parts_count' => 'int',
    'reference_id' => 'int',
    'from' => 'string',
    'rrule' => 'string',
    'create_chat' => 'boolean',
    'tts' => 'boolean',
    'local' => 'boolean',
    'local_country' => 'string',
    'destination' => 'string',
    'resources' => 'string'
} );

__PACKAGE__->attribute_map( {
    'text' => 'text',
    'template_id' => 'templateId',
    'sending_time' => 'sendingTime',
    'sending_date_time' => 'sendingDateTime',
    'sending_timezone' => 'sendingTimezone',
    'contacts' => 'contacts',
    'lists' => 'lists',
    'phones' => 'phones',
    'cut_extra' => 'cutExtra',
    'parts_count' => 'partsCount',
    'reference_id' => 'referenceId',
    'from' => 'from',
    'rrule' => 'rrule',
    'create_chat' => 'createChat',
    'tts' => 'tts',
    'local' => 'local',
    'local_country' => 'localCountry',
    'destination' => 'destination',
    'resources' => 'resources'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
