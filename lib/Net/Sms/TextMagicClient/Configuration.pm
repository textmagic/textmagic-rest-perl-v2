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
package Net::Sms::TextMagicClient::Configuration;

use strict;
use warnings;
use utf8;

use Log::Any qw($log);
use Carp;

use constant VERSION => '2.0.673';

=head1 Name

        Net::Sms::TextMagicClient::Configuration - holds the configuration for all Net::Sms::TextMagicClient Modules

=head1 new(%parameters)

=over 4

=item http_timeout: (optional)

Integer. timeout for HTTP requests in seconds

default: 180

=item http_user_agent: (optional)

String. custom UserAgent header

default: textmagic client

=item api_key: (optional)

Hashref. Keyed on the name of each key (there can be multiple tokens).

    api_key => {
	secretKey => 'aaaabbbbccccdddd',
	anotherKey => '1111222233334444',
    };

=item api_key_prefix: (optional)

Hashref. Keyed on the name of each key (there can be multiple tokens). Note not all api keys require a prefix.

    api_key_prefix => {
        secretKey => 'string',
	anotherKey => 'same or some other string',
    };
 
=item api_key_in: (optional)

=item username: (optional)

String. The username for basic auth.

=item password: (optional)

String. The password for basic auth.

=item access_token: (optional)

String. The OAuth access token.

=item base_url: (optional)

String. The base URL of the API

default: http://rest.textmagic.com

=back

=cut

sub new {
	my ($self, %p) = (shift,@_);

	# class/static variables
	$p{http_timeout} //= 180;
	$p{http_user_agent} //= 'textmagic client';

	# authentication setting
	$p{api_key} //= {};
	$p{api_key_prefix} //= {};
	$p{api_key_in} //= {};

	# username and password for HTTP basic authentication
	$p{username} //= '';
	$p{password} //= '';

	# access token for OAuth
	$p{access_token} //= '';

	# base_url
        $p{base_url} //= 'http://rest.textmagic.com';

	return bless \%p => $self;
}


sub get_tokens {
	my $self = shift;
	
	my $tokens = {};
	$tokens->{username} = $self->{username} if $self->{username};
	$tokens->{password} = $self->{password} if $self->{password};
	$tokens->{access_token} = $self->{access_token} if $self->{access_token};
	
	foreach my $token_name (keys %{ $self->{api_key} }) {
		$tokens->{$token_name}->{token} = $self->{api_key}{$token_name};
		$tokens->{$token_name}->{prefix} = $self->{api_key_prefix}{$token_name};
		$tokens->{$token_name}->{in} = $self->{api_key_in}{$token_name};
	}

	return $tokens;
}

sub clear_tokens {
	my $self = shift;
	my %tokens = %{$self->get_tokens}; # copy
	
	$self->{username} = '';
	$self->{password} = '';
	$self->{access_token} = '';

	$self->{api_key} = {};
	$self->{api_key_prefix} = {};
	$self->{api_key_in} = {};
	
	return \%tokens;
}

sub accept_tokens {
	my ($self, $tokens) = @_;
	
	foreach my $known_name (qw(username password access_token)) {
		next unless $tokens->{$known_name};
		$self->{$known_name} = delete $tokens->{$known_name};
	}
	
	foreach my $token_name (keys %$tokens) {
		$self->{api_key}{$token_name} = $tokens->{$token_name}{token};
		if ($tokens->{$token_name}{prefix}) {
			$self->{api_key_prefix}{$token_name} = $tokens->{$token_name}{prefix};
		}
		my $in = $tokens->{$token_name}->{in} || 'head';
		croak "Tokens can only go in 'head' or 'query' (not in '$in')" unless $in =~ /^(?:head|query)$/;
		$self->{api_key_in}{$token_name} = $in;
	}
}	

1;
