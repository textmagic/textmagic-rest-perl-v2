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
package Net::Sms::TextMagicClient::Object::MessagingStatItem;

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
                                  class => 'MessagingStatItem',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'reply_rate' => {
    	datatype => 'double',
    	base_name => 'replyRate',
    	description => 'The number of incoming messages divided by the number of total messages.',
    	format => '',
    	read_only => '',
    		},
    'date' => {
    	datatype => 'DateTime',
    	base_name => 'date',
    	description => 'Time interval start: empty if the **by** parameter was set to **off**. ',
    	format => '',
    	read_only => '',
    		},
    'delivery_rate' => {
    	datatype => 'double',
    	base_name => 'deliveryRate',
    	description => 'Message delivery rate:the number of delivered messages divided by the number of total messages.',
    	format => '',
    	read_only => '',
    		},
    'costs' => {
    	datatype => 'double',
    	base_name => 'costs',
    	description => 'Cost for sent messages during this period. The costs are in the [Account](https://docs.textmagic.com/#tag/User) currency. ',
    	format => '',
    	read_only => '',
    		},
    'messages_received' => {
    	datatype => 'int',
    	base_name => 'messagesReceived',
    	description => 'Total received messages count.',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_delivered' => {
    	datatype => 'int',
    	base_name => 'messagesSentDelivered',
    	description => 'Delivered messages count. As messages are retried for up to 48 hours, this value could change.',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_accepted' => {
    	datatype => 'int',
    	base_name => 'messagesSentAccepted',
    	description => 'Messages accepted for delivery (in queue) but not yet delivered.',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_buffered' => {
    	datatype => 'int',
    	base_name => 'messagesSentBuffered',
    	description => 'Messages buffered by endpoint cell phone operators.',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_failed' => {
    	datatype => 'int',
    	base_name => 'messagesSentFailed',
    	description => 'Messages that have failed for whatever reason, e.g. the destination phone was switched off for 48 hours or the recipient&#39;s phone account is out of service.',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_rejected' => {
    	datatype => 'int',
    	base_name => 'messagesSentRejected',
    	description => 'Messages that were rejected: invalid Sender ID used (e.g. you cannot use the Sender ID or your own mobile number when sending to the United States and Canada.) ',
    	format => '',
    	read_only => '',
    		},
    'messages_sent_parts' => {
    	datatype => 'int',
    	base_name => 'messagesSentParts',
    	description => 'Total sent messages **parts** count. Note that this is not equal to the sent messages count, because one message could consist of 1 to 6 parts and users are charged per part, not per message.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'reply_rate' => 'double',
    'date' => 'DateTime',
    'delivery_rate' => 'double',
    'costs' => 'double',
    'messages_received' => 'int',
    'messages_sent_delivered' => 'int',
    'messages_sent_accepted' => 'int',
    'messages_sent_buffered' => 'int',
    'messages_sent_failed' => 'int',
    'messages_sent_rejected' => 'int',
    'messages_sent_parts' => 'int'
} );

__PACKAGE__->attribute_map( {
    'reply_rate' => 'replyRate',
    'date' => 'date',
    'delivery_rate' => 'deliveryRate',
    'costs' => 'costs',
    'messages_received' => 'messagesReceived',
    'messages_sent_delivered' => 'messagesSentDelivered',
    'messages_sent_accepted' => 'messagesSentAccepted',
    'messages_sent_buffered' => 'messagesSentBuffered',
    'messages_sent_failed' => 'messagesSentFailed',
    'messages_sent_rejected' => 'messagesSentRejected',
    'messages_sent_parts' => 'messagesSentParts'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
