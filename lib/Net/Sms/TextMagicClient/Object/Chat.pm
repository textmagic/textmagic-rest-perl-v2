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
package Net::Sms::TextMagicClient::Object::Chat;

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

use Net::Sms::TextMagicClient::Object::Contact;
use Net::Sms::TextMagicClient::Object::Country;

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
                                  class => 'Chat',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'Chat ID.',
    	format => '',
    	read_only => '',
    		},
    'original_id' => {
    	datatype => 'int',
    	base_name => 'originalId',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'phone' => {
    	datatype => 'string',
    	base_name => 'phone',
    	description => 'Chat partner&#39;s phone number.',
    	format => '',
    	read_only => '',
    		},
    'contact' => {
    	datatype => 'Contact',
    	base_name => 'contact',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'unsubscribed_contact_id' => {
    	datatype => 'int',
    	base_name => 'unsubscribedContactId',
    	description => 'If this field has a value, it means that the chat phone number has been unsubscribed from you and this value is an ID of an Unsubscribed contact entity. See [Get all unsubscribed contacts](https://docs.textmagic.com/#operation/getUnsubscribers).',
    	format => '',
    	read_only => '',
    		},
    'unread' => {
    	datatype => 'int',
    	base_name => 'unread',
    	description => 'Total unread incoming messages.',
    	format => '',
    	read_only => '',
    		},
    'updated_at' => {
    	datatype => 'DateTime',
    	base_name => 'updatedAt',
    	description => 'Time when the last incoming message arrived at this chat.',
    	format => '',
    	read_only => '',
    		},
    'status' => {
    	datatype => 'string',
    	base_name => 'status',
    	description => 'Chat status:   * **a** - Active;   * **c** - Closed;   * **d** - Deleted. ',
    	format => '',
    	read_only => '',
    		},
    'mute' => {
    	datatype => 'int',
    	base_name => 'mute',
    	description => 'Indicates when the chat is muted.',
    	format => '',
    	read_only => '',
    		},
    'last_message' => {
    	datatype => 'string',
    	base_name => 'lastMessage',
    	description => 'The last message content of a chat.',
    	format => '',
    	read_only => '',
    		},
    'direction' => {
    	datatype => 'string',
    	base_name => 'direction',
    	description => 'Last message type: * **ci** - incoming call; * **co** - outgoing call; * **i** - incoming message; * **o** - outgoing message. ',
    	format => '',
    	read_only => '',
    		},
    'reply_options_type' => {
    	datatype => 'string',
    	base_name => 'replyOptionsType',
    	description => 'Used for chats prices.',
    	format => '',
    	read_only => '',
    		},
    'from' => {
    	datatype => 'string',
    	base_name => 'from',
    	description => 'If filled, the value will be used as a sender number for all outgoing messages of a chat.',
    	format => '',
    	read_only => '',
    		},
    'muted_until' => {
    	datatype => 'DateTime',
    	base_name => 'mutedUntil',
    	description => 'Date and time until the chat will be muted.',
    	format => '',
    	read_only => '',
    		},
    'time_left_mute' => {
    	datatype => 'int',
    	base_name => 'timeLeftMute',
    	description => 'Time left untill the chat will be unmuted (seconds).',
    	format => '',
    	read_only => '',
    		},
    'country' => {
    	datatype => 'Country',
    	base_name => 'country',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'pinned' => {
    	datatype => 'boolean',
    	base_name => 'pinned',
    	description => 'Indicates when the chat is pinned.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'original_id' => 'int',
    'phone' => 'string',
    'contact' => 'Contact',
    'unsubscribed_contact_id' => 'int',
    'unread' => 'int',
    'updated_at' => 'DateTime',
    'status' => 'string',
    'mute' => 'int',
    'last_message' => 'string',
    'direction' => 'string',
    'reply_options_type' => 'string',
    'from' => 'string',
    'muted_until' => 'DateTime',
    'time_left_mute' => 'int',
    'country' => 'Country',
    'pinned' => 'boolean'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'original_id' => 'originalId',
    'phone' => 'phone',
    'contact' => 'contact',
    'unsubscribed_contact_id' => 'unsubscribedContactId',
    'unread' => 'unread',
    'updated_at' => 'updatedAt',
    'status' => 'status',
    'mute' => 'mute',
    'last_message' => 'lastMessage',
    'direction' => 'direction',
    'reply_options_type' => 'replyOptionsType',
    'from' => 'from',
    'muted_until' => 'mutedUntil',
    'time_left_mute' => 'timeLeftMute',
    'country' => 'country',
    'pinned' => 'pinned'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
