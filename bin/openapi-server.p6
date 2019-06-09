#!/usr/bin/env perl6
use App::OpenAPI::META6Validator;

use Cro::HTTP::Server;
use Cro::HTTP::Log::File;

sub MAIN(:$host = 'localhost', :$port = 3000) {
    my $api = App::OpenAPI::META6Validator.new;

    my $server = Cro::HTTP::Server.new(
        host         => $host,
        port         => $port,
        body-parsers => [Cro::HTTP::BodyParser::JSON.new],
        application  => $api.application,
        after => [
            Cro::HTTP::Log::File.new(logs => $*OUT, errors => $*ERR)
        ],
    );

    $server.start;
    say "Listening at http://$host:$port";

    react {
        whenever signal(SIGINT) {
            $server.stop;
            exit;
        }
    }
}
