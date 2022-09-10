#!/usr/bin/env perl6
use v6;
use JSON::Fast;
use Cro::HTTP::Test;
use App::OpenAPI::META6Validator;


my %META6 = from-json($*PROGRAM.parent(2).add('META6.json').slurp);

test-service App::OpenAPI::META6Validator.new.application(), {
    test-given '/validate', {
        # Validate self META6.json
        {
            test post(json => %META6),
                status => 200,
                json => { :success(1) },
            ;
        }

        # resources is an Array, not a Hash'
        {
            temp %META6;
            %META6<resources> = Hash.new;
            test post(json => %META6),
                status => 400,
            ;
        }

        
        # name field missing
        {
            temp %META6;
            %META6<name>:delete;
            test post(json => %META6),
                status => 400,
            ;
        }
    }
}

done-testing;