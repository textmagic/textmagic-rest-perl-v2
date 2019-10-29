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
package Net::Sms::TextMagicClient::Object::Contact;

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

use Net::Sms::TextMagicClient::Object::ContactCustomField;
use Net::Sms::TextMagicClient::Object::ContactImage;
use Net::Sms::TextMagicClient::Object::ContactNote;
use Net::Sms::TextMagicClient::Object::Country;
use Net::Sms::TextMagicClient::Object::List;
use Net::Sms::TextMagicClient::Object::User;

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
                                  class => 'Contact',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'Contact ID.',
    	format => '',
    	read_only => '',
    		},
    'favorited' => {
    	datatype => 'boolean',
    	base_name => 'favorited',
    	description => 'Is the Contact favorite? [Favorite list](http://docs.textmagictesting.com/#operation/getFavorites).',
    	format => '',
    	read_only => '',
    		},
    'blocked' => {
    	datatype => 'boolean',
    	base_name => 'blocked',
    	description => 'Is the Contact blocked? [Blocked contacts](http://docs.textmagictesting.com/#operation/getBlockedContacts).',
    	format => '',
    	read_only => '',
    		},
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
    'company_name' => {
    	datatype => 'string',
    	base_name => 'companyName',
    	description => 'Company name.',
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
    'country' => {
    	datatype => 'Country',
    	base_name => 'country',
    	description => 'Contact country.',
    	format => '',
    	read_only => '',
    		},
    'custom_fields' => {
    	datatype => 'ARRAY[ContactCustomField]',
    	base_name => 'customFields',
    	description => 'See the [Custom Fields](http://docs.textmagictesting.com/#tag/Custom-Fields) section.',
    	format => '',
    	read_only => '',
    		},
    'user' => {
    	datatype => 'User',
    	base_name => 'user',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'lists' => {
    	datatype => 'ARRAY[List]',
    	base_name => 'lists',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'phone_type' => {
    	datatype => 'string',
    	base_name => 'phoneType',
    	description => 'Phone number type: * **0** if it is fixed-line; * **1** if it is mobile; * **2** if it is mobile or fixed-line (in case we cannot distingush between fixed-line or mobile); * **3** if it is toll-free; * **4** if it is a premium rate phone; * **5** if it is a shared cost phone; * **6** if it is a VoIP; * **7** if it is a [Personal Number](); * **8** if it is a pager; * **9** if it is a Universal Access Number; * **10** if the phone type is unknown; * **-1** if the phone type is not yet processed or cannot be determined. ',
    	format => '',
    	read_only => '',
    		},
    'avatar' => {
    	datatype => 'ContactImage',
    	base_name => 'avatar',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'notes' => {
    	datatype => 'ARRAY[ContactNote]',
    	base_name => 'notes',
    	description => '',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'favorited' => 'boolean',
    'blocked' => 'boolean',
    'first_name' => 'string',
    'last_name' => 'string',
    'company_name' => 'string',
    'phone' => 'string',
    'email' => 'string',
    'country' => 'Country',
    'custom_fields' => 'ARRAY[ContactCustomField]',
    'user' => 'User',
    'lists' => 'ARRAY[List]',
    'phone_type' => 'string',
    'avatar' => 'ContactImage',
    'notes' => 'ARRAY[ContactNote]'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'favorited' => 'favorited',
    'blocked' => 'blocked',
    'first_name' => 'firstName',
    'last_name' => 'lastName',
    'company_name' => 'companyName',
    'phone' => 'phone',
    'email' => 'email',
    'country' => 'country',
    'custom_fields' => 'customFields',
    'user' => 'user',
    'lists' => 'lists',
    'phone_type' => 'phoneType',
    'avatar' => 'avatar',
    'notes' => 'notes'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
