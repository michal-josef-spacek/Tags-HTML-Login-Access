#!/usr/bin/env perl

use strict;
use warnings;

use CSS::Struct::Output::Indent;
use Plack::App::Tags::HTML;
use Plack::Runner;
use Tags::Output::Indent;
use Unicode::UTF8 qw(decode_utf8);

my $app = Plack::App::Tags::HTML->new(
        'component' => 'Tags::HTML::Login::Access',
        'constructor_args' => {
                'register_url' => '/register',
        },
        'css' => CSS::Struct::Output::Indent->new,
        'tags' => Tags::Output::Indent->new(
                'xml' => 1,
                'preserved' => ['style'],
        ),
        'title' => 'Login and password',
)->to_app;
Plack::Runner->new->run($app);

# Output screenshot is in images/ directory.