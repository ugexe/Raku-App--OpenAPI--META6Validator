use Cro::OpenAPI::RoutesFromDefinition;
use Cro::HTTP::Router;

class App::OpenAPI::META6Validator {
    has @.models;

    method application {
        openapi %?RESOURCES<openapi.json>.IO, {
            operation 'validate', -> {
                request-body -> (*%_) {
                    # We shouldn't need to do any further validation if we reach here
                    content 'application/json', { success => 1 };
                }
            }
        }
    }
}
