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
package Net::Sms::TextMagicClient::Object::MessageOut;

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

use Net::Sms::TextMagicClient::Object::MessageOutSenderSource;
use Net::Sms::TextMagicClient::Object::MessageOutSession;

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
                                  class => 'MessageOut',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'Message ID.',
    	format => '',
    	read_only => '',
    		},
    'sender' => {
    	datatype => 'string',
    	base_name => 'sender',
    	description => 'Message sender (phone number or alphanumeric Sender ID).',
    	format => '',
    	read_only => '',
    		},
    'receiver' => {
    	datatype => 'string',
    	base_name => 'receiver',
    	description => 'Recipient&#x60;s phone number.',
    	format => '',
    	read_only => '',
    		},
    'text' => {
    	datatype => 'string',
    	base_name => 'text',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'status' => {
    	datatype => 'string',
    	base_name => 'status',
    	description => 'Delivery status of the message. See [message delivery statuses](https://docs.textmagic.com/#section/Delivery-status-codes) for details. ',
    	format => '',
    	read_only => '',
    		},
    'reject_reason' => {
    	datatype => 'string',
    	base_name => 'rejectReason',
    	description => 'Rejection reason.',
    	format => '',
    	read_only => '',
    		},
    'contact_id' => {
    	datatype => 'int',
    	base_name => 'contactId',
    	description => 'Recipient contact ID.',
    	format => '',
    	read_only => '',
    		},
    'session_id' => {
    	datatype => 'int',
    	base_name => 'sessionId',
    	description => 'Message Session ID of a message.',
    	format => '',
    	read_only => '',
    		},
    'message_time' => {
    	datatype => 'DateTime',
    	base_name => 'messageTime',
    	description => 'Sending time.',
    	format => '',
    	read_only => '',
    		},
    'avatar' => {
    	datatype => 'string',
    	base_name => 'avatar',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'deleted' => {
    	datatype => 'boolean',
    	base_name => 'deleted',
    	description => 'Indicates that the message has been deleted.',
    	format => '',
    	read_only => '',
    		},
    'charset' => {
    	datatype => 'string',
    	base_name => 'charset',
    	description => 'Message charset. Could be: *   **ISO-8859-1** for plaintext SMS; *   **UTF-16BE** for Unicode SMS. ',
    	format => '',
    	read_only => '',
    		},
    'charset_label' => {
    	datatype => 'string',
    	base_name => 'charsetLabel',
    	description => 'Human-readable message charset label. Could be: *   **ISO-8859-1** for plaintext SMS; *   **UTF-16BE** for Unicode SMS; *   **Voice** for voice services (Text-to-Speech or Voice Broadcast) messages. ',
    	format => '',
    	read_only => '',
    		},
    'first_name' => {
    	datatype => 'string',
    	base_name => 'firstName',
    	description => 'Contact first name. Could be substituted from your [Contacts](https://docs.textmagic.com/#tag/Contacts) (even if you submitted the phone number instead of the contact ID). ',
    	format => '',
    	read_only => '',
    		},
    'last_name' => {
    	datatype => 'string',
    	base_name => 'lastName',
    	description => 'Contact last name.',
    	format => '',
    	read_only => '',
    		},
    'country' => {
    	datatype => 'string',
    	base_name => 'country',
    	description => 'The 2-letter ISO country code of the recipient&#39;s phone number. ',
    	format => '',
    	read_only => '',
    		},
    'phone' => {
    	datatype => 'string',
    	base_name => 'phone',
    	description => 'Receipent&#x60;s phone number.',
    	format => '',
    	read_only => '',
    		},
    'price' => {
    	datatype => 'double',
    	base_name => 'price',
    	description => 'Message price.',
    	format => '',
    	read_only => '',
    		},
    'parts_count' => {
    	datatype => 'int',
    	base_name => 'partsCount',
    	description => 'Message parts (multiples of 160 characters) count.',
    	format => '',
    	read_only => '',
    		},
    'from_email' => {
    	datatype => 'string',
    	base_name => 'fromEmail',
    	description => 'The user email which this message came from. For Email2SMS and Distribution Lists the messages, it is an original email address - in other cases, it is an account email address.',
    	format => '',
    	read_only => '',
    		},
    'from_number' => {
    	datatype => 'string',
    	base_name => 'fromNumber',
    	description => 'The Phone number used to send the SMS.',
    	format => '',
    	read_only => '',
    		},
    'sender_source' => {
    	datatype => 'MessageOutSenderSource',
    	base_name => 'senderSource',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'session' => {
    	datatype => 'MessageOutSession',
    	base_name => 'session',
    	description => '',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'sender' => 'string',
    'receiver' => 'string',
    'text' => 'string',
    'status' => 'string',
    'reject_reason' => 'string',
    'contact_id' => 'int',
    'session_id' => 'int',
    'message_time' => 'DateTime',
    'avatar' => 'string',
    'deleted' => 'boolean',
    'charset' => 'string',
    'charset_label' => 'string',
    'first_name' => 'string',
    'last_name' => 'string',
    'country' => 'string',
    'phone' => 'string',
    'price' => 'double',
    'parts_count' => 'int',
    'from_email' => 'string',
    'from_number' => 'string',
    'sender_source' => 'MessageOutSenderSource',
    'session' => 'MessageOutSession'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'sender' => 'sender',
    'receiver' => 'receiver',
    'text' => 'text',
    'status' => 'status',
    'reject_reason' => 'rejectReason',
    'contact_id' => 'contactId',
    'session_id' => 'sessionId',
    'message_time' => 'messageTime',
    'avatar' => 'avatar',
    'deleted' => 'deleted',
    'charset' => 'charset',
    'charset_label' => 'charsetLabel',
    'first_name' => 'firstName',
    'last_name' => 'lastName',
    'country' => 'country',
    'phone' => 'phone',
    'price' => 'price',
    'parts_count' => 'partsCount',
    'from_email' => 'fromEmail',
    'from_number' => 'fromNumber',
    'sender_source' => 'senderSource',
    'session' => 'session'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
