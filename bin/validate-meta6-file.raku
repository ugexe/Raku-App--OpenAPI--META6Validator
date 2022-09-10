#!/usr/bin/env raku
use App::OpenAPI::META6Validator;

use JSON::Fast;
use Cro::HTTP::Client;
use Cro::HTTP::Server;
use Cro::HTTP::Log::File;

sub MAIN(IO() $file = $*CWD.add('META6.json'), :$host = 'localhost', :$port = 3000) {
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
    my $response = await Cro::HTTP::Client.post: "http://$host:$port/validate",
        content-type => 'application/json',
        body         => from-json($file.slurp),
    ;
    $server.stop;

    my $is-invalid = $response.status != 200;
    note(await $response.body-text) if $is-invalid;

    exit $is-invalid
}
