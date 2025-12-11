[comment]: <> (HEAD)
# TextMagic Perl SDK

[![GitHub release](https://img.shields.io/github/v/release/textmagic/textmagic-rest-perl-v2)](https://github.com/textmagic/textmagic-rest-perl-v2/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CPAN](https://img.shields.io/badge/CPAN-Net%3A%3ASms%3A%3ATextMagicClient-blue.svg)](https://metacpan.org/)

This library provides you with an easy way to send SMS and receive replies by integrating the TextMagic SMS Gateway into your Perl application.

## What Is TextMagic?

TextMagic's application programming interface (API) provides the communication link between your application and TextMagic's SMS Gateway, allowing you to send and receive text messages and to check the delivery status of text messages you've already sent.

For detailed documentation, please visit [https://docs.textmagic.com/](https://docs.textmagic.com/).

[comment]: <> (/HEAD)
## Requirements

- **Perl** >= 5.38 (recommended), minimum 5.10
  - ⚠️ **Note:** Perl versions below 5.38 are no longer officially supported by the Perl community
  - For production use, we strongly recommend **Perl 5.38+** for security updates and bug fixes
  - Minimum version 5.10 is supported for legacy compatibility only
- **CPAN modules:**
  - URI::Query
  - Log::Any
  - JSON
  - LWP::UserAgent
  - Module::Runtime
  - DateTime
  - LWP::Protocol::https

## Quick Start

```perl
use strict;
use warnings;
use Net::Sms::TextMagicClient::ApiClient;
use Net::Sms::TextMagicClient::TextMagicApi;

# Configure API client
# Get your credentials from https://app.textmagic.com/settings/api
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username  => 'YOUR_USERNAME',
    password  => 'YOUR_API_KEY',
    base_url  => 'https://rest.textmagic.com'
);

my $api = Net::Sms::TextMagicClient::TextMagicApi->new($client);

# Test connection
eval {
    my $result = $api->ping();
    print "✅ Connected! Server time: " . $result->ping . "\n";
};
if ($@) {
    warn "❌ Error: $@\n";
}
```

## Installation

### From GitHub

```bash
# Download and extract
wget https://github.com/textmagic/textmagic-rest-perl-v2/archive/v3.0.43909.tar.gz
tar zxf v3.0.43909.tar.gz
rm -f v3.0.43909.tar.gz
cd textmagic-rest-perl-v2-3.0.43909

# Install dependencies
cpanm --installdeps .

# Add to Perl library path
export PERL5LIB="${PERL5LIB}:$(pwd)/lib"
```

### Using cpanfile

If you want to include this SDK in your project's dependencies:

```perl
# Add to your cpanfile
requires 'Net::Sms::TextMagicClient', '== 3.0.43909';
```

Then install:

```bash
cpanm --installdeps .
```

## Usage Examples

Please follow the [installation](#installation) instructions and execute the following Perl code:

### Sending Messages

```perl
use strict;
use warnings;
use Net::Sms::TextMagicClient::ApiClient;
use Net::Sms::TextMagicClient::TextMagicApi;
use Net::Sms::TextMagicClient::Object::SendMessageInputObject;

# Configure API client
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username  => 'YOUR_USERNAME',
    password  => 'YOUR_API_KEY',
    base_url  => 'https://rest.textmagic.com'
);

my $api = Net::Sms::TextMagicClient::TextMagicApi->new($client);

# Send SMS to a single number
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new(
    text   => 'Hello from TextMagic Perl SDK!',
    phones => '+1234567890'
);

eval {
    my $result = $api->send_message(send_message_input_object => $message);
    print "✅ Message sent! ID: " . $result->id . "\n";
    print "   Session ID: " . $result->session_id . "\n";
};
if ($@) {
    warn "❌ Error sending message: $@\n";
}
```

### Retrieving Messages

```perl
# Get all outbound messages
eval {
    my $result = $api->get_all_outbound_messages();
    foreach my $msg (@{$result->resources}) {
        print "Message ID: " . $msg->id . "\n";
        print "Text: " . $msg->text . "\n";
        print "Status: " . $msg->status . "\n";
    }
};
if ($@) {
    warn "❌ Error: $@\n";
}
```

### Uploading Files

```perl
# Upload list avatar (example list ID: 3223)
eval {
    my $result = $api->upload_list_avatar(
        image => "avatar.jpg",
        id    => 3223
    );
    print "✅ Avatar uploaded! Resource ID: " . $result->id . "\n";
};
if ($@) {
    warn "❌ Error uploading avatar: $@\n";
}
```

### Error Handling

```perl
use Try::Tiny;

try {
    my $result = $api->ping();
    print "Server time: " . $result->ping . "\n";
} catch {
    if (ref($_) eq 'Net::Sms::TextMagicClient::ApiException') {
        print "API Exception:\n";
        print "  Code: " . $_->code . "\n";
        print "  Message: " . $_->message . "\n";
    } else {
        print "Unexpected error: $_\n";
    }
};
```

## API Documentation

For detailed API documentation, including all available methods and parameters, please visit:

- **REST API Documentation:** [https://docs.textmagic.com/](https://docs.textmagic.com/)
- **API Key Management:** [https://app.textmagic.com/settings/api](https://app.textmagic.com/settings/api)

### Available Methods

The SDK provides access to all TextMagic API endpoints, including:

- **Messages:** Send, receive, and manage SMS messages
- **Contacts:** Manage your contact lists
- **Templates:** Create and use message templates
- **Chats:** Manage conversations
- **Bulk Messaging:** Send messages to multiple recipients
- **Sender IDs:** Manage sender names
- **Account:** Check balance and account information
- **Statistics:** Get messaging statistics and reports

## Migration Guide

### Migrating from v2.x to v3.x

**Version 3.0 is a MAJOR update** that introduces breaking changes. This guide will help you migrate your code from v2.x to v3.x.

> ⚠️ **IMPORTANT:** v3.x is **NOT backward compatible** with v2.x. You will need to update your code.

#### Why Upgrade?

- ✅ **Modern tooling** - OpenAPI Generator 7.17.0 (actively maintained)
- ✅ **Better code quality** - Improved type handling and error messages
- ✅ **Bug fixes** - Many Swagger Codegen issues resolved
- ✅ **Consistency** - Aligned with other TextMagic SDKs (Python, Ruby, Go, etc.)
- ✅ **Future-proof** - Ready for OpenAPI 3.1+ features
- ✅ **Security** - Support for modern Perl versions (5.38+)

#### Breaking Changes Overview

| Component | v2.x | v3.x | Impact |
|-----------|------|------|--------|
| **Generator** | Swagger Codegen 2.4.8 | **OpenAPI Generator 7.17.0** | ⚠️ High |
| **Installation** | `perl Makefile.PL && make install` | **`cpanm --installdeps .`** | ⚠️ Medium |
| **Method Signatures** | Positional parameters | **Named parameters** | ⚠️ High |
| **Perl Version** | 5.10+ | **5.10+ (min), 5.38+ (recommended)** | ℹ️ Low |
| **Module Name** | Net::Sms::TextMagicClient | **Net::Sms::TextMagicClient** | ✅ None |
| **API Endpoints** | Same | **Same** | ✅ None |
| **Authentication** | HTTP Basic Auth | **HTTP Basic Auth** | ✅ None |

**⚠️ Perl Version Notice:** While SDK supports Perl 5.10+, versions below 5.38 are **no longer maintained** by the Perl community (no security patches). For production use, upgrade to **Perl 5.38+**.

#### Detailed Breaking Changes

##### 1. **Installation Method Changed**

**v2.x used ExtUtils::MakeMaker:**
```bash
# Old way (v2.x)
perl Makefile.PL
make
make test
make install
```

**v3.x uses cpanfile (modern approach):**
```bash
# New way (v3.x)
cpanm --installdeps .
export PERL5LIB="${PERL5LIB}:$(pwd)/lib"
```

**Why?** OpenAPI Generator uses modern Perl tooling. `cpanfile` is the current standard.

##### 2. **API Method Signatures - Named Parameters Required**

**This is the MOST IMPORTANT change.** All API methods now require named parameters.

**v2.x - Positional parameters:**
```perl
# Old way - positional parameter
my $result = $api->send_message($message_object);

# Old way - multiple parameters
my $messages = $api->get_all_outbound_messages(1, 10);
```

**v3.x - Named parameters:**
```perl
# New way - named parameter (REQUIRED)
my $result = $api->send_message(
    send_message_input_object => $message_object
);

# New way - named parameters
my $messages = $api->get_all_outbound_messages(
    page => 1,
    limit => 10
);
```

**⚠️ Your code WILL break if you don't update method calls!**

##### 3. **Object Initialization - Named Parameters Recommended**

**v2.x - Setter methods:**
```perl
# Old way - create empty object, then set properties
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new();
$message->text('Hello');
$message->phones('+1234567890');
$message->from('MyCompany');
```

**v3.x - Constructor parameters (recommended):**
```perl
# New way - pass all parameters to constructor
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new(
    text   => 'Hello',
    phones => '+1234567890',
    from   => 'MyCompany'
);
```

**Note:** Setter methods still work in v3.x, but constructor initialization is cleaner.

##### 4. **Base URL Configuration**

**v2.x - Base URL was implicit:**
```perl
# Old way - base_url was optional/implicit
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => 'user',
    password => 'key'
);
```

**v3.x - Base URL should be explicit:**
```perl
# New way - explicitly set base_url (recommended)
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => 'user',
    password => 'key',
    base_url => 'https://rest.textmagic.com'
);
```

**Why?** Explicit configuration is clearer and prevents issues with default values.

#### What Stays the Same

- ✅ **Module name:** `Net::Sms::TextMagicClient` (unchanged)
- ✅ **Namespace structure:** All classes in same hierarchy
- ✅ **API class name:** `TextMagicApi` (unchanged)
- ✅ **Authentication:** HTTP Basic Auth with username/API key
- ✅ **Response objects:** Same structure and properties
- ✅ **Error handling:** Same exception types

#### Step-by-Step Migration Guide

##### Step 1: Backup Your Current Code

```bash
# Create a backup before starting migration
cp -r your_project your_project_backup
git checkout -b upgrade-to-v3
```

##### Step 2: Check Your Perl Version

```bash
# Check current Perl version
perl -v

# If below 5.38, consider upgrading (recommended for production)
# Ubuntu/Debian:
sudo apt-get install perl

# macOS:
brew install perl

# Or use perlbrew for multiple versions:
curl -L https://install.perlbrew.pl | bash
perlbrew install perl-5.38.0
perlbrew switch perl-5.38.0
```

##### Step 3: Remove Old SDK (v2.x)

```bash
# If you installed v2.x globally, remove it
# Find where it's installed:
perldoc -l Net::Sms::TextMagicClient

# Remove old installation (adjust path as needed)
rm -rf /path/to/perl/lib/Net/Sms/TextMagicClient
```

##### Step 4: Install New SDK (v3.x)

```bash
# Download v3.x
wget https://github.com/textmagic/textmagic-rest-perl-v2/archive/v3.0.43909.tar.gz
tar zxf v3.0.43909.tar.gz
rm -f v3.0.43909.tar.gz
cd textmagic-rest-perl-v2-3.0.43909

# Install dependencies
cpanm --installdeps .

# Add to library path (add this to your ~/.bashrc or ~/.zshrc)
export PERL5LIB="${PERL5LIB}:$(pwd)/lib"
```

##### Step 5: Update Your Code - API Method Calls

**Find all API method calls and add named parameters:**

```perl
# BEFORE (v2.x):
$api->send_message($message);
$api->get_all_outbound_messages(1, 10);
$api->delete_contact($contact_id);
$api->update_contact($contact_id, $contact_data);

# AFTER (v3.x):
$api->send_message(send_message_input_object => $message);
$api->get_all_outbound_messages(page => 1, limit => 10);
$api->delete_contact(id => $contact_id);
$api->update_contact(id => $contact_id, update_contact_input_object => $contact_data);
```

**Tip:** Use regex to find all API calls:
```bash
grep -r '\$api->' your_project/
```

##### Step 6: Update Object Initialization

**Refactor object creation to use constructor parameters:**

```perl
# BEFORE (v2.x):
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new();
$message->text('Hello');
$message->phones('+1234567890');
$message->from('MyCompany');

# AFTER (v3.x) - recommended:
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new(
    text   => 'Hello',
    phones => '+1234567890',
    from   => 'MyCompany'
);
```

##### Step 7: Update ApiClient Configuration

**Add explicit base_url:**

```perl
# BEFORE (v2.x):
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => $username,
    password => $api_key
);

# AFTER (v3.x):
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => $username,
    password => $api_key,
    base_url => 'https://rest.textmagic.com'  # Add this
);
```

##### Step 8: Test Thoroughly

```bash
# Run your test suite
prove -l t/

# Test individual scripts
perl -Ilib your_script.pl

# Enable warnings to catch issues
perl -w -Ilib your_script.pl
```

##### Step 9: Update Dependencies in Your Project

**If using cpanfile in your project:**
```perl
# Update your project's cpanfile
requires 'Net::Sms::TextMagicClient', '== 3.0.43909';
```

**If using Makefile.PL:**
```perl
# Update PREREQ_PM in your Makefile.PL
PREREQ_PM => {
    'Net::Sms::TextMagicClient' => '3.0.43909',
    # ... other dependencies
},
```

#### Complete Migration Examples

##### Example 1: Simple Message Sending

**BEFORE (v2.x):**
```perl
use strict;
use warnings;
use Net::Sms::TextMagicClient::ApiClient;
use Net::Sms::TextMagicClient::TextMagicApi;
use Net::Sms::TextMagicClient::Object::SendMessageInputObject;

# v2.x configuration
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => 'myuser',
    password => 'myapikey'
);

my $api = Net::Sms::TextMagicClient::TextMagicApi->new($client);

# v2.x object creation
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new();
$message->text('Hello World');
$message->phones('+1234567890');

# v2.x API call - positional parameter
my $result = $api->send_message($message);
print "Message ID: " . $result->id . "\n";
```

**AFTER (v3.x):**
```perl
use strict;
use warnings;
use Net::Sms::TextMagicClient::ApiClient;
use Net::Sms::TextMagicClient::TextMagicApi;
use Net::Sms::TextMagicClient::Object::SendMessageInputObject;

# v3.x configuration - explicit base_url
my $client = Net::Sms::TextMagicClient::ApiClient->new(
    username => 'myuser',
    password => 'myapikey',
    base_url => 'https://rest.textmagic.com'
);

my $api = Net::Sms::TextMagicClient::TextMagicApi->new($client);

# v3.x object creation - constructor parameters
my $message = Net::Sms::TextMagicClient::Object::SendMessageInputObject->new(
    text   => 'Hello World',
    phones => '+1234567890'
);

# v3.x API call - NAMED parameter (required!)
my $result = $api->send_message(
    send_message_input_object => $message
);
print "Message ID: " . $result->id . "\n";
```

##### Example 2: Retrieving Messages with Pagination

**BEFORE (v2.x):**
```perl
# v2.x - positional parameters
my $page = 1;
my $limit = 10;
my $result = $api->get_all_outbound_messages($page, $limit);

foreach my $msg (@{$result->resources}) {
    print $msg->id . ": " . $msg->text . "\n";
}
```

**AFTER (v3.x):**
```perl
# v3.x - named parameters (required!)
my $result = $api->get_all_outbound_messages(
    page  => 1,
    limit => 10
);

foreach my $msg (@{$result->resources}) {
    print $msg->id . ": " . $msg->text . "\n";
}
```

##### Example 3: Contact Management

**BEFORE (v2.x):**
```perl
# v2.x - create contact
my $contact = Net::Sms::TextMagicClient::Object::CreateContactInputObject->new();
$contact->first_name('John');
$contact->last_name('Doe');
$contact->phone('+1234567890');

my $result = $api->create_contact($contact);

# v2.x - update contact
my $update = Net::Sms::TextMagicClient::Object::UpdateContactInputObject->new();
$update->first_name('Jane');
$api->update_contact($result->id, $update);

# v2.x - delete contact
$api->delete_contact($result->id);
```

**AFTER (v3.x):**
```perl
# v3.x - create contact
my $contact = Net::Sms::TextMagicClient::Object::CreateContactInputObject->new(
    first_name => 'John',
    last_name  => 'Doe',
    phone      => '+1234567890'
);

my $result = $api->create_contact(
    create_contact_input_object => $contact
);

# v3.x - update contact (named parameters!)
my $update = Net::Sms::TextMagicClient::Object::UpdateContactInputObject->new(
    first_name => 'Jane'
);
$api->update_contact(
    id => $result->id,
    update_contact_input_object => $update
);

# v3.x - delete contact (named parameter!)
$api->delete_contact(id => $result->id);
```

##### Example 4: Error Handling

**Error handling remains the same, but with updated method calls:**

```perl
use Try::Tiny;

try {
    # v3.x - named parameters
    my $result = $api->send_message(
        send_message_input_object => $message
    );
    print "Success: " . $result->id . "\n";
} catch {
    if (ref($_) eq 'Net::Sms::TextMagicClient::ApiException') {
        print "API Error: " . $_->message . "\n";
        print "Code: " . $_->code . "\n";
    } else {
        print "Unexpected error: $_\n";
    }
};
```

#### Common Migration Issues & Solutions

##### Issue 1: "Can't locate Net/Sms/TextMagicClient.pm"

**Cause:** Library path not set or SDK not installed.

**Solution:**
```bash
# Check if SDK is in the path
perl -MNet::Sms::TextMagicClient -e 'print "OK\n"'

# If not found, set PERL5LIB
export PERL5LIB="${PERL5LIB}:/path/to/textmagic-rest-perl-v2/lib"

# Or reinstall
cd /path/to/textmagic-rest-perl-v2
cpanm --installdeps .
```

##### Issue 2: "Method not found" or "Wrong number of arguments"

**Cause:** Using v2.x positional parameters instead of v3.x named parameters.

**Solution:**
```perl
# ❌ WRONG (v2.x style):
$api->send_message($message);

# ✅ CORRECT (v3.x style):
$api->send_message(send_message_input_object => $message);
```

**How to find all occurrences:**
```bash
# Search for API calls that need updating
grep -rn '\$api->' your_project/ | grep -v '=>'
```

##### Issue 3: "SSL/TLS connection errors"

**Cause:** Missing LWP::Protocol::https module.

**Solution:**
```bash
# Install HTTPS support
cpanm LWP::Protocol::https

# Or install all dependencies
cpanm --installdeps .
```

##### Issue 4: "Undefined subroutine" errors

**Cause:** Method names may have changed in OpenAPI Generator.

**Solution:**
```perl
# Check available methods
use Data::Dumper;
my @methods = grep { /^[a-z]/ } keys %Net::Sms::TextMagicClient::TextMagicApi::;
print Dumper(\@methods);

# Or check documentation
perldoc Net::Sms::TextMagicClient::TextMagicApi
```

##### Issue 5: "Can't call method on undefined value"

**Cause:** API response structure may have changed.

**Solution:**
```perl
# Add defensive checks
my $result = $api->some_method(...);
if ($result && $result->resources) {
    foreach my $item (@{$result->resources}) {
        # Process item
    }
}

# Or use Try::Tiny
use Try::Tiny;
try {
    my $result = $api->some_method(...);
    # Process result
} catch {
    warn "Error: $_";
};
```

##### Issue 6: "Perl version too old" warnings

**Cause:** Using Perl < 5.38 (unsupported by Perl community).

**Solution:**
```bash
# Check current version
perl -v

# Upgrade using perlbrew (recommended)
curl -L https://install.perlbrew.pl | bash
perlbrew install perl-5.38.0
perlbrew switch perl-5.38.0

# Or use system package manager
# Ubuntu/Debian:
sudo apt-get update && sudo apt-get install perl

# macOS:
brew upgrade perl
```

##### Issue 7: "Dependencies not found"

**Cause:** Missing CPAN modules.

**Solution:**
```bash
# Install all dependencies from cpanfile
cpanm --installdeps .

# Or install individually
cpanm URI::Query Log::Any JSON LWP::UserAgent Module::Runtime DateTime LWP::Protocol::https

# Check installed modules
perldoc -l URI::Query
perldoc -l LWP::UserAgent
```

#### Benefits of Upgrading to v3.x

##### Technical Improvements

- ✅ **Modern code generation** - OpenAPI Generator 7.17.0 (actively maintained, regular updates)
- ✅ **Better type handling** - Improved object serialization/deserialization
- ✅ **Cleaner code** - Named parameters make code more readable and maintainable
- ✅ **Bug fixes** - Many Swagger Codegen issues resolved
- ✅ **Better error messages** - More descriptive exceptions and validation
- ✅ **Future-proof** - Ready for OpenAPI 3.1+ features

##### Ecosystem Alignment

- ✅ **Consistent with other SDKs** - Same patterns as Python, Ruby, Go, Java SDKs
- ✅ **Modern Perl practices** - Uses cpanfile, follows current standards
- ✅ **Better documentation** - Auto-generated docs from OpenAPI spec
- ✅ **Community support** - OpenAPI Generator has large, active community

##### Security & Maintenance

- ✅ **Security updates** - OpenAPI Generator receives regular security patches
- ✅ **Active maintenance** - Generator is actively developed (Swagger Codegen is deprecated)
- ✅ **Perl 5.38+ support** - Ready for modern, supported Perl versions
- ✅ **Long-term support** - OpenAPI Generator is the industry standard

##### Migration Effort vs. Benefits

| Effort Level | Time Estimate | Benefit |
|--------------|---------------|----------|
| **Small projects** (< 100 API calls) | 1-2 hours | High - Future-proof, better code quality |
| **Medium projects** (100-500 calls) | 4-8 hours | High - Consistency, maintainability |
| **Large projects** (500+ calls) | 1-2 days | High - Long-term support, security |

**Recommendation:** The migration effort is worthwhile for all project sizes due to long-term benefits.

#### Need Help?

If you encounter issues during migration:

1. Check the [GitHub Issues](https://github.com/textmagic/textmagic-rest-perl-v2/issues)
2. Review the [API Documentation](https://docs.textmagic.com/)
3. Contact [TextMagic Support](https://www.textmagic.com/support/)

[comment]: <> (FOOTER)
## License
The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[comment]: <> (/FOOTER)
