openapi_generator_version := "7.18.0"
openapi_generator_image := "openapitools/openapi-generator-cli:v" + openapi_generator_version

spec := "openapi.json"

api_out := "lib/generated/berth_api"
pub_name := "berth_api"

default:
    @just --list

gen-api spec=spec:
    @test -f "{{spec}}" || { echo "Spec not found: {{spec}}"; exit 1; }
    rm -rf "{{api_out}}"
    docker run --rm \
        -u "$(id -u):$(id -g)" \
        -v "$(pwd):/local" \
        "{{openapi_generator_image}}" generate \
        -i "/local/{{spec}}" \
        -g dart \
        -o "/local/{{api_out}}" \
        --global-property=apiDocs=false,modelDocs=false \
        --additional-properties=pubName={{pub_name}}
    rm -f "{{api_out}}/README.md" "{{api_out}}/git_push.sh"
    @echo "Generated {{pub_name}} into {{api_out}} (generator v{{openapi_generator_version}})"
