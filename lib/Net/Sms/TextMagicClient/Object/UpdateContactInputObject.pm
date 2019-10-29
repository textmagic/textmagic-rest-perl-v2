=begin comment

TextMagic API

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
package Net::Sms::TextMagicClient::Object::UpdateContactInputObject;

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

use Net::Sms::TextMagicClient::Object::CustomFieldListItem;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

=begin comment

TextMagic API

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
                                  class => 'UpdateContactInputObject',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'first_name' => {
    	datatype => 'string',
    	base_name => 'firstName',
    	description => 'Contact first name.',
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
    'phone' => {
    	datatype => 'string',
    	base_name => 'phone',
    	description => 'Phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164).',
    	format => '',
    	read_only => '',
    		},
    'email' => {
    	datatype => 'string',
    	base_name => 'email',
    	description => 'Contact email address.',
    	format => '',
    	read_only => '',
    		},
    'company_name' => {
    	datatype => 'string',
    	base_name => 'companyName',
    	description => 'Contact company name.',
    	format => '',
    	read_only => '',
    		},
    'lists' => {
    	datatype => 'string',
    	base_name => 'lists',
    	description => 'Comma-separated [list](http://docs.textmagictesting.com/#section/Lists) ID. Each contact must be assigned to at least one list.',
    	format => '',
    	read_only => '',
    		},
    'favorited' => {
    	datatype => 'boolean',
    	base_name => 'favorited',
    	description => 'Is the contact marked as favorite?',
    	format => '',
    	read_only => '',
    		},
    'blocked' => {
    	datatype => 'boolean',
    	base_name => 'blocked',
    	description => 'Is the contact blocked for outgoing and incoming messaging?',
    	format => '',
    	read_only => '',
    		},
    'type' => {
    	datatype => 'int',
    	base_name => 'type',
    	description => 'Force type of phone. Possible values: 0 is landline; 1 is mobile; default is -1 (auto-detection).',
    	format => '',
    	read_only => '',
    		},
    'custom_field_values' => {
    	datatype => 'ARRAY[CustomFieldListItem]',
    	base_name => 'customFieldValues',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'local' => {
    	datatype => 'int',
    	base_name => 'local',
    	description => 'Treat phone numbers passed in the request body as **local**.',
    	format => '',
    	read_only => '',
    		},
    'country' => {
    	datatype => 'string',
    	base_name => 'country',
    	description => 'The 2-letter ISO country code for local phone numbers, used when **local** is set to true.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'first_name' => 'string',
    'last_name' => 'string',
    'phone' => 'string',
    'email' => 'string',
    'company_name' => 'string',
    'lists' => 'string',
    'favorited' => 'boolean',
    'blocked' => 'boolean',
    'type' => 'int',
    'custom_field_values' => 'ARRAY[CustomFieldListItem]',
    'local' => 'int',
    'country' => 'string'
} );

__PACKAGE__->attribute_map( {
    'first_name' => 'firstName',
    'last_name' => 'lastName',
    'phone' => 'phone',
    'email' => 'email',
    'company_name' => 'companyName',
    'lists' => 'lists',
    'favorited' => 'favorited',
    'blocked' => 'blocked',
    'type' => 'type',
    'custom_field_values' => 'customFieldValues',
    'local' => 'local',
    'country' => 'country'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
